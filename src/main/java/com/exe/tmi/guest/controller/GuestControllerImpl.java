package com.exe.tmi.guest.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.tmi.api.KakaoAPI;
import com.exe.tmi.api.NaverLoginBO;
import com.exe.tmi.api.TokenDTO;
import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.service.BookService;
import com.exe.tmi.common.email.MailHandler;
import com.exe.tmi.common.key.TempKey;
import com.exe.tmi.common.tel.Coolsms;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.dto.ReservationListDTO;
import com.exe.tmi.guest.service.GuestService;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.post.dto.PostCommentDTO;
import com.exe.tmi.post.service.PostService;
import com.exe.tmi.room.service.RoomService;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller("guestController")
@RequestMapping("/guest")
public class GuestControllerImpl implements GuestController {

	@Autowired
	private GuestService guestService;

	@Autowired
	private PostService postService;

	@Autowired
	private BookService bookService;
	
	@Autowired
	private RoomService roomService;
	

	// 네이버 OAUTH
	private static final String mydomain = "http://183.99.243.229/tmi/guest/main/callback";
	private static final String clientId = "0oxsugDYqfYhm6shdIs1";
	private static final String requestUrl = "https://nid.naver.com/oauth2.0/authorize?client_id=" + clientId
			+ "&response_type=code&redirect_uri=" + mydomain + "&state=";
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// KAKAOAPI
	@Autowired
	private KakaoAPI kakao;

	// Mail 인증
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private GuestDTO guestDTO;

	@RequestMapping(value = "/what", method = RequestMethod.GET)
	public String kakao1(@RequestParam("code") String code, HttpSession session, HttpServletRequest request) throws Exception {

		String access_Token = kakao.getAccessToken(code);
		TokenDTO tdto = new TokenDTO();
        tdto.setAccess_token(access_Token);
        session.setAttribute("token", tdto);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		GuestDTO dto = guestService.kakaoLogin((String) userInfo.get("email"));
		
		if (dto != null) {
			session.setAttribute("guestInfo", dto);
			return "redirect:http://183.99.243.229/tmi/main/ok";
		}
		
		request.setAttribute("msg", "OK");
		request.setAttribute("email",(String) userInfo.get("email"));
		request.setAttribute("name",(String) userInfo.get("nickname"));

		return "guest/register";
	}

	// 처음 메인화면 및 네이버 보안 state 생성
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String main(HttpServletRequest req, HttpSession session) throws Exception {

		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		Object userInfo = session.getAttribute("userInfo");
		System.out.println(userInfo);
		System.out.println(state);
		req.setAttribute("state", state);

		String url = requestUrl + state;

		req.setAttribute("url", url);

		return "guest/register";
	}

	@RequestMapping(value = "/main/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request)
			throws Exception, IOException, ParseException, org.json.simple.parser.ParseException {

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(code, state);
		System.out.println(oauthToken);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");

		System.out.println(name);
		System.out.println(email);

		// 4.파싱 닉네임 세션으로 저장
		model.addAttribute("result", apiResult);

		GuestDTO dto = guestService.kakaoLogin(email);

		System.out.println("네이버이메일");
		System.out.println(dto);

		if (dto != null) {
			session.setAttribute("guestInfo", dto);
			return "redirect:http://183.99.243.229/tmi/main/ok";
		}

		request.setAttribute("msg", "ok");
		request.setAttribute("name", name);
		request.setAttribute("email", email);

		return "guest/register";
	}

	// 실제 Database 입력
	@RequestMapping(value = "/add", method = { RequestMethod.POST })
	public String main_ok(GuestDTO dto) throws Exception {

		guestService.add(dto);
		return "guest/login";
	}

	// 실제 Database 입력
	@RequestMapping(value = "/dashboard", method = { RequestMethod.GET, RequestMethod.POST })
	public String dashboard(HttpSession session, HttpServletRequest request) throws Exception {

		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		GuestDTO dto_af = guestService.login(dto);
		System.out.println("hostCheck: " + dto_af.getHostcheck());

		String wishList = dto_af.getWishlist();

		int count = 0;

		if (wishList != null) {
			count = wishList.split(",").length;
		}

		int bookCount = bookService.bookCount(dto.getEmail());

		int postCount = postService.postCommentCount(dto.getEmail());

		BookDTO dto_re = bookService.recentBookInfo(dto.getEmail());

		// System.out.println(dto_re.getR_mainimage());
		System.out.println("보여라!!");
		request.setAttribute("dto_re", dto_re);
		List<RoomListDTO> lists = bookService.activityBookInfo(dto.getEmail());

		GuestDTO dto_G = (GuestDTO) session.getAttribute("guestInfo");
		String hostCheck = guestService.hostCheck(dto_G.getEmail());
		System.out.println("hostCheck: " + hostCheck);
		request.setAttribute("hostCheck", hostCheck);

		request.setAttribute("lists", lists);

		request.setAttribute("postCount", postCount);
		request.setAttribute("bookCount", bookCount);
		request.setAttribute("hostCheck", dto_af.getHostcheck());
		request.setAttribute("point", dto_af.getPoint());
		request.setAttribute("count", count);

		return "dashboard/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/overlapped", method = { RequestMethod.POST }) //
	public String overlapped(String email) throws Exception {
		String result = guestService.overlapped(email);
		return result;
	}

	// 로그인 창 이동
	@RequestMapping(value = "/loginForm", method = { RequestMethod.GET })
	public String loginForm(HttpSession session, HttpServletRequest request) throws Exception {

		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);
		System.out.println(state);
		request.setAttribute("state", state);
		String url = requestUrl + state;
		request.setAttribute("url", url);
		
		String deleteGuest = request.getParameter("deleteGuest");
		if(deleteGuest=="delete") {
			System.out.println("delete 씰행됨");
			return "dashboard/myprofile";
		}

		return "guest/login";
	}

	
	// 전화번호 인증번호 전송
	@ResponseBody
	@RequestMapping(value = "/sendSms", method = { RequestMethod.POST })
	public String sendSms(HttpServletRequest request, @RequestParam("receiver") String receiver, HttpSession session)
			throws Exception {
		String key = TempKey.numberGen(4, 1);
		String api_key = "NCS6NV5SVES7ZJQN";
		String api_secret = "L6TDF2R0NXUGIMF6ILKCFIBLAFCACELE";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", receiver);

		set.put("from", "01045092881");
		set.put("text", "[IGO] 인증번호" + key + "를 입력해주세요.");
		set.put("type", "sms");

		session = request.getSession();
		session.setAttribute("key", key);

		System.out.println(set);
		System.out.println("인증번호는: " + key + "입니다.");
		JSONObject result = coolsms.send(set);

		if (Boolean.valueOf((Boolean) result.get("status")) == true) {
			System.out.println(result.get("group_id"));
			System.out.println(result.get("result_code"));
			System.out.println(result.get("result_message"));
			System.out.println(result.get("success_count"));
			System.out.println(result.get("error_count"));
			return "true";
		} else {
			System.out.println(result.get("code"));
			System.out.println(result.get("message"));
			return "false";
		}
	}

	// 새 패스워드 입력 페이지
	@RequestMapping(value = "/newPasswordForm", method = { RequestMethod.POST })
	public String newPasswordForm(@RequestParam("email") String email, HttpServletRequest request) {
		request.setAttribute("email", email);
		return "guest/newPassword";
	}

	// 새 패스워드 입력 처리
	@RequestMapping(value = "/newPassword", method = { RequestMethod.POST })
	public String newPassword(GuestDTO dto, HttpServletRequest request) throws Exception {
		guestService.newpassword(dto);
		return "redirect:/guest/loginForm";
	}

	// 패스워드 찾을 시 인증번호 이메일로 전송
	@ResponseBody
	@RequestMapping(value = "/sendEmail", method = { RequestMethod.POST })
	public String sendEmail(@RequestParam("email") String email, HttpServletRequest request) throws Exception {
		String Tempkey = TempKey.numberGen(4, 1);
		MailHandler sendMail = new MailHandler(mailSender);
		HttpSession session = request.getSession();

		sendMail.setSubject("[IGO 홈페이지 비밀번호 찾기인증]");
		sendMail.setText(
				"<h3>안녕하세요. IGO 비밀번호 찾기 인증 메일입니다!</h3><br><br>" + "[IGO] 인증번호 [" + Tempkey + "]를 입력해주세요.<br><br>");
		sendMail.setFrom("gjwoo96@naver.com", "[IGO]"); // 발신자
		sendMail.setTo(email); // 수신자
		sendMail.send();
		session.setAttribute("Tempkey", Tempkey);
		return "true";
	}

	// 회원가입 체크
	@RequestMapping(value = "/check")
	public String check() {
		return "guest/check";
	}

	// 로그인 로직 처리
	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public ModelAndView login(HttpServletRequest request, GuestDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		guestDTO = guestService.login(dto);
		if (guestDTO != null && guestDTO.getEmail() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("guestInfo", guestDTO);
			session.setAttribute("isLogOn", true);

			String action = (String) session.getAttribute("action"); // 로그인 후 이동할 페이지
			if (action != null) {
				mav.setViewName("redirect:" + action);
				session.removeAttribute("action");
			} else {
				mav.setViewName("redirect:/main/ok");
			}
		} else {
			String message = "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.";
			mav.addObject("message", message);
			mav.setViewName("guest/login");
		}
		return mav;
	}

	// 로그 아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET })
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		TokenDTO dto = (TokenDTO) session.getAttribute("token");

		if(dto != null && dto.getAccess_token()!=null) {
			
			System.out.println("카카오 로그아웃 들어옴!!!!!!!!!!!!!!!!!!!!!!");
			session.removeAttribute("token");
			
			session.setAttribute("isLogOn", false);
			session.removeAttribute("guestInfo");
			
			return "redirect:https://kauth.kakao.com/oauth/logout?client_id=cb73a41fa443b2c4495c2be87ea8b26e&logout_redirect_uri=http://183.99.243.229/tmi/guest/logoutkakao";
		}
		session.setAttribute("isLogOn", false);
		session.removeAttribute("guestInfo");
	
		return "redirect:/main/ok";
	}
	// 로그 아웃 카카오
	@RequestMapping(value = "/logoutkakao", method = { RequestMethod.GET })
	public String logoutkakao() throws Exception {
		return "redirect:/main/ok";
	}

	// 패스워드 찾기 페이지
	@RequestMapping(value = "/findpwdForm", method = { RequestMethod.GET })
	public String findpwdForm(GuestDTO dto) {
		return "guest/findpwd";
	}

	// 패스워드 찾을 시 인증번호 확인
	@ResponseBody
	@RequestMapping(value = "/pwdCheck", method = { RequestMethod.POST })
	public String findpwd(HttpServletRequest request, @RequestParam("number") String number, HttpSession session) {
		session = request.getSession();
		String Tempkey = (String) session.getAttribute("Tempkey");
		if (Tempkey.equals(number)) {
			session.removeAttribute("Tempkey");
			return "true";
		} else {
			return "false";
		}
	}

	// 회원 가입 처리
	@RequestMapping(value = "/addMember", method = { RequestMethod.POST })
	public String register(GuestDTO dto) throws Exception {
		guestService.add(dto); // 회원가입

		MailHandler sendMail = new MailHandler(mailSender);

		sendMail.setSubject("[IGO 홈페이지 이메일 인증]");
		sendMail.setText("<h3>안녕하세요. IGO 계정인증 메일입니다!</h3><br><br>" + "인증하기 버튼을 클릭하시면 인증에 성공합니다<br><br>"
				+ "<a href='http://183.99.243.229/tmi/guest/emailConfirm?email=" + dto.getEmail() + ""
				+ "' target='_blenk'>이메일 인증 확인</a>");
		sendMail.setFrom("taopping@gmail.com", "[IGO]"); // 발신자
		sendMail.setTo(dto.getEmail()); // 수신자
		sendMail.send();
		return "guest/emailcheck";
	}

	// 이메일 인증 확인 -> 경로 수정
	@RequestMapping(value = "/emailConfirm", method = { RequestMethod.GET })
	public ModelAndView emailConfirm(@RequestParam("email") String email) throws Exception {
		ModelAndView mav = new ModelAndView();
		guestService.check(email); // 이메일 체크
		mav.setViewName("redirect:http://183.99.243.229/tmi/guest/sign_Up?email="+email);
		return mav;
	}
	
	@RequestMapping(value = "/sign_Up",method = {RequestMethod.GET,RequestMethod.POST})
	public String loginOK(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		
		request.setAttribute("email", email);
		
		return "guest/loginOK";
	}

	// 인증번호 확인
	@ResponseBody
	@RequestMapping(value = "/numberCheck", method = { RequestMethod.POST })
	public String numberCheck(HttpServletRequest request, @RequestParam("number") String number, HttpSession session)
			throws Exception {
		session = request.getSession();
		String key = (String) session.getAttribute("key");
		System.out.println("key=" + key);
		System.out.println("number=" + number);
		if (key.equals(number)) {
			session.removeAttribute("key");
			return "true";
		} else {
			return "false";
		}
	}

	// 프로필
	@RequestMapping(value = "/myProfile", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myProfile(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		guestDTO = (GuestDTO) session.getAttribute("guestInfo");
		
		guestDTO.setCreated(guestDTO.getCreated().substring(0,10));
		// boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		if (guestDTO == null) { // 로그인 안하고 myProfile 접근 시
			session.setAttribute("action", "/guest/myProfile");
			mav.setViewName("redirect:/guest/loginForm");
			return mav;
		}
		// 로그인 성공 후
		mav.setViewName("dashboard/myprofile");
		mav.addObject("dto", guestDTO);
		return mav;
	}

	@RequestMapping(value = "/edit", method = { RequestMethod.GET })
	public ModelAndView edit(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		session.setAttribute("action", "/guest/editProfileForm");
		mav.setViewName("redirect:/guest/loginForm");
		return mav;
	}

	@RequestMapping(value = "/editProfileForm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView editProfileForm(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		guestDTO = (GuestDTO) session.getAttribute("guestInfo");
		mav.setViewName("dashboard/editprofile");
		mav.addObject("dto", guestDTO);
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/editProfile", method = { RequestMethod.GET, RequestMethod.POST })
	public String editProfile(MultipartHttpServletRequest request, HttpSession session, GuestDTO guestDTO)
			throws Exception {
		/*
		 * MultipartFile file = guestDTO.getUpload(); InputStream is =
		 * file.getInputStream();
		 * 
		 * String root = session.getServletContext().getRealPath("/"); String savePath =
		 * root + File.separator + "pds" + File.separator + "saveData";
		 * 
		 * guestDTO.setProfileimage(fileManager.doFileUpload(is,
		 * guestDTO.getUpload().getOriginalFilename(), savePath));
		 * 
		 * System.out.println("이름:" + guestDTO.getName()); System.out.println("비밀번호: " +
		 * guestDTO.getPwd()); System.out.println("파일: " + guestDTO.getProfileimage());
		 */

		MultipartFile mfile = request.getFile("upload");
		String path = request.getSession().getServletContext().getRealPath("/resources/tmi/profile");
		File file = new File(path);

		if (mfile != null) {

			System.out.println("파라미터명: " + mfile.getName());
			System.out.println("파일 크기: " + mfile.getSize());
			System.out.println("파일 존재: " + mfile.isEmpty());
			System.out.println("오리지널 파일 이름: " + mfile.getOriginalFilename());
		}

		if (!file.exists()) {
			file.mkdirs();
		}

		if (mfile != null && mfile.getSize() > 0) {

			try {

				FileOutputStream fos = new FileOutputStream(path + "/" + mfile.getOriginalFilename());

				InputStream is = mfile.getInputStream();

				byte[] buffer = new byte[512];

				while (true) {

					int data = is.read(buffer, 0, buffer.length);

					if (data == -1) {
						break;
					}

					fos.write(buffer, 0, data);
				}

				is.close();
				fos.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}

		guestDTO.setProfileimage(mfile.getOriginalFilename());
		System.out.println("이름:" + guestDTO.getName());
		System.out.println("비밀번호: " + guestDTO.getPwd());
		System.out.println("파일이름:" + guestDTO.getProfileimage());
		guestService.updateProfile(guestDTO);
		return "true";
	}

	@RequestMapping(value = "/addHost", method = { RequestMethod.GET })
	public String addHost(HttpServletRequest request, HttpSession session) throws Exception {

		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		String hostCheck = guestService.hostCheck(dto.getEmail());
		System.out.println("hostCheck: " + hostCheck);
		request.setAttribute("hostCheck", hostCheck);
		return "dashboard/addhost";
	}

	///////////////////// 댓글 //////////////////////
	@RequestMapping(value = "/commandCheck", method = { RequestMethod.GET })
	public ModelAndView commandCheck(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String r_num = request.getParameter("r_num");
		int inwon = Integer.parseInt(request.getParameter("inwon"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		session = request.getSession();
		session.setAttribute("action", "/room/roomInfo?" + "r_num=" + r_num + "&inwon=" + inwon + "&startDate="
				+ startDate + "&endDate=" + endDate);
		mav.setViewName("redirect:/guest/loginForm");
		return mav;
	}

	///////////////////// 댓글 //////////////////////
	@RequestMapping(value = "/commandCheck2", method = { RequestMethod.GET })
	public ModelAndView commandCheck2(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String r_num = request.getParameter("r_num");
		int inwon = Integer.parseInt(request.getParameter("inwon"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String searchValue1 = request.getParameter("searchValue1");
		String searchValue2 = request.getParameter("searchValue2");
		
		System.out.println("여기는 guestImpl:" + searchValue1);

		searchValue1 = URLEncoder.encode(searchValue1, "UTF-8");

		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");
		session = request.getSession();
		session.setAttribute("action",
				"/mansion/reList?r_num=" + r_num + "&inwon=" + inwon + "&startDate=" + startDate + "&endDate=" + endDate
						+ "&searchValue1=" + searchValue1 + "&searchValue2=" + searchValue2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice);
		mav.setViewName("redirect:/guest/loginForm");
		return mav;
	}

	@RequestMapping(value = "/seletRoomCheck", method = { RequestMethod.GET })
	public ModelAndView selectRoomCheck(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String r_num = request.getParameter("r_num");
		int inwon = Integer.parseInt(request.getParameter("inwon"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		session = request.getSession();
		session.setAttribute("action", "/room/roomInfo?r_num=" + r_num + "&inwon=" + inwon + "&startDate=" + startDate
				+ "&endDate=" + endDate);
		mav.setViewName("redirect:/guest/loginForm");
		return mav;
	}

	// 호스트 리뷰 페이지
	@RequestMapping(value = "/hostReviewForm", method = { RequestMethod.GET })
	public ModelAndView hostReviewForm(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");
		String host = guestDTO.getEmail(); // 호스트 아이디
		List<PostCommentDTO> lists = guestService.getListReviews(host);
		mav.addObject("dto", guestDTO);
		mav.addObject("lists", lists);
		mav.setViewName("dashboard/hostReviewPage");
		return mav;
	}

	// 위시 리스트 페이지 가져오기
	@RequestMapping(value = "/wishListForm", method = { RequestMethod.GET })
	public ModelAndView wishListForm(HttpServletRequest request, HttpSession session) throws Exception {
		session = request.getSession();
		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dashboard/wishlist");
		mav.addObject("dto", dto);
		return mav;
	}

	// 위시 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "/wishList", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public List<RoomListDTO> wishList(HttpServletRequest request, HttpSession session) throws Exception {
		session = request.getSession();
		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		String wishlists = guestService.getWishLists(dto.getEmail());
		String adj[] = wishlists.split(",");
		List<RoomListDTO> lists = new ArrayList<RoomListDTO>();
		for (int i = 0; i < adj.length; i++) {
			lists.add(guestService.getRoom(Integer.parseInt(adj[i])));
		}
		return lists;
	}

	@ResponseBody
	@RequestMapping(value = "/wishListDelete", method = {RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public String wishListDelete(String email, String r_num, HttpServletRequest request, HttpSession session)
			throws Exception {
		session = request.getSession();
		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		String wishlists = guestService.getWishLists(dto.getEmail());
		String adj[] = wishlists.split(",");
		String arr = "";
		for (int i = 0; i < adj.length; i++) {
			if (Integer.parseInt(adj[i]) != Integer.parseInt(r_num)) {
				arr += adj[i] + ",";
			}
		}
		arr = arr.substring(0, arr.length() - 1);
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("email", dto.getEmail());
		hmap.put("wishlist", arr);
		guestService.updateWishList(dto.getEmail(), hmap);
		return "true";
	}
	
	// 호스트 예약 확인
	@RequestMapping(value = "/reservation", method = { RequestMethod.POST, RequestMethod.GET })
	public String reservationList(HttpServletRequest request, HttpSession session) throws Exception {

		session = request.getSession();
		GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");

		try {
			@SuppressWarnings("unused")
			String email = guestDTO.getEmail();
		} catch (NullPointerException e) {
			return "guest/login";
		}
		
		return "dashboard/reservationList";
	}

	//회원 탈퇴
	@RequestMapping(value = "/commandCheck3", method = { RequestMethod.GET })
	public ModelAndView commandCheck3(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String check = "1";
		session = request.getSession();
		session.setAttribute("action","/guest/myProfile?check="+check);
		mav.setViewName("redirect:/guest/loginForm");
		return mav;
	}
	
	// 회원 탈퇴
		@ResponseBody
		@RequestMapping(value = "/removeGuest", method = { RequestMethod.POST, RequestMethod.GET },produces = "text/plain;charset=UTF-8")
		public String removeGuest(HttpServletRequest request, HttpSession session) throws Exception {

			session = request.getSession();
			GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");
			int checkCount = roomService.checkCount(guestDTO.getEmail());
			
			String check = request.getParameter("check");
			
			if(check.equals("") || check=="" || check==null) {
				
				return "로그인 해주세요";
			}else {	
			
			String hostCheck = guestService.hostCheck(guestDTO.getEmail());
			
			
			if(checkCount==0 && hostCheck=="0") {
				guestService.deleteGuest(guestDTO.getEmail());
				session.removeAttribute("guestInfo");
				return "회원탈퇴가 성공적으로 되었습니다";
			}
				
				return "등록하신 방을 먼저 삭제해주세요";
			}
		}

	// 호스트 예약 삭제
	@ResponseBody
	@RequestMapping(value = "/reservationDelete", method = { RequestMethod.POST })
	public String reservationDelete(HttpServletRequest request, HttpSession session) throws Exception {

		try {
			@SuppressWarnings("unused")
			String email = guestDTO.getEmail();
			int b_num = Integer.parseInt(request.getParameter("b_num"));


			guestService.reservationDelete(b_num);

			return "true";
		} catch (NullPointerException e) {
			return "false";
		}

	}

	// 호스트 예약 확인_ajax1
	@ResponseBody
	@RequestMapping(value = "/reservationList", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public List<ReservationListDTO> reservationListA(HttpServletRequest request, HttpSession session) throws Exception {

		session = request.getSession();
		GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");

		String email = guestDTO.getEmail();
		List<ReservationListDTO> reservationList = guestService.getReservationList(email);

		return reservationList;
	}

	// 호스트 예약 확인_ajax2
	@ResponseBody
	@RequestMapping(value = "/reservationList_A", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/json;charset=UTF-8")
	public List<ReservationListDTO> reservationList_A(HttpServletRequest request, HttpSession session)
			throws Exception {

		session = request.getSession();
		GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");


		String email = guestDTO.getEmail();
		List<ReservationListDTO> reservationList_A = guestService.getReservationList_A(email);

		return reservationList_A;

	}

	// 호스트 예약 수락
	@ResponseBody
	@RequestMapping(value = "/reservationUpdate", method = { RequestMethod.POST })
	public String reservationUpdate(HttpServletRequest request) throws Exception {

		System.out.println("reservationUpdate 실행됨");
		// update 하고
		try {

			String email = request.getParameter("email");
			int r_num = Integer.parseInt(request.getParameter("r_num"));
			String checkin = request.getParameter("checkin");
			String checkout = request.getParameter("checkout");

			checkin = checkin.replaceAll("-", "");
			checkin = checkin.replaceAll(":", "");
			checkout = checkout.replaceAll("-", "");
			checkout = checkout.replaceAll(":", "");

			System.out.println("reservationUpdate의 " + email);
			System.out.println("reservationUpdate의 " + r_num);
			System.out.println("reservationUpdate의 " + checkin);
			System.out.println("reservationUpdate의 " + checkout);

			ReservationListDTO dto = new ReservationListDTO();
			dto.setEmail(email);
			dto.setR_num(r_num);
			dto.setCheckin(checkin);
			dto.setCheckout(checkout);
			guestService.setReservationUpdate(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// select를 해야함 -> ajax 출력을 위해서
		String result = "true";
		return result;
	}

	// 예약완료_문자
	@ResponseBody
	@RequestMapping(value = "/reservationOK", method = { RequestMethod.POST })
	public String reservationOK(HttpServletRequest request, HttpSession session) throws Exception {
		String api_key = "NCS6NV5SVES7ZJQN";
		String api_secret = "L6TDF2R0NXUGIMF6ILKCFIBLAFCACELE";
		
		Coolsms coolsms = new Coolsms(api_key, api_secret);

		int b_num = Integer.parseInt(request.getParameter("b_num"));

		ReservationListDTO dto = guestService.reservationSMS(b_num);

		System.out.println("문자보낼 전화번호:" + dto.getTel());

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", dto.getTel()); // 받는사람 전화번호

		set.put("from", "01045092881");
		set.put("text", dto.getEmail() + "(" + dto.getName() + ")님 \n" + dto.getCheckin() + " ~ " + dto.getCheckout()
				+ "\n" + dto.getM_name() + " " + dto.getR_name() + "예약완료");
		set.put("type", "sms");

		JSONObject result = coolsms.send(set);

		if (Boolean.valueOf((Boolean) result.get("status")) == true) {
			return "true";
		} else {
			return "false";
		}
	}

	// 예약취소_문자
	@ResponseBody
	@RequestMapping(value = "/reservationNO", method = { RequestMethod.POST })
	public String reservationNO(HttpServletRequest request, HttpSession session) throws Exception {
		String api_key = "NCS6NV5SVES7ZJQN";
		String api_secret = "L6TDF2R0NXUGIMF6ILKCFIBLAFCACELE";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		int b_num = Integer.parseInt(request.getParameter("b_num"));
		System.out.println("b_num" + b_num);
		ReservationListDTO dto1 = guestService.reservationSMS(b_num);
		System.out.println(dto1);
		System.out.println("문자보낼 전화번호:" + dto1.getTel());

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", dto1.getTel()); // 받는사람 전화번호

		set.put("from", "01045092881");
		set.put("text", dto1.getEmail() + "(" + dto1.getName() + ")님 \n" + dto1.getM_name() + " " + dto1.getR_name()
				+ "의 예약 취소 되었습니다.");
		set.put("type", "sms");

		JSONObject result = coolsms.send(set);

		if (Boolean.valueOf((Boolean) result.get("status")) == true) {
			return "true";
		} else {
			return "false";
		}
	}
	
	

}
