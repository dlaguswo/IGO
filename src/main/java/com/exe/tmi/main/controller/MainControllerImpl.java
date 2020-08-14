package com.exe.tmi.main.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.service.BookService;
import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.service.GuestService;
import com.exe.tmi.main.dto.MainDTO;
import com.exe.tmi.main.dto.MonthsChartDTO;
import com.exe.tmi.main.dto.PopularDTO;
import com.exe.tmi.main.service.MainService;
import com.exe.tmi.post.service.PostService;
import com.exe.tmi.room.dto.HostDTO;
import com.exe.tmi.room.service.RoomService;

@Controller("MainController")
@RequestMapping(value = "/main")
public class MainControllerImpl implements MainController{
	
	@Autowired
	MainService mainService;
	
	@Autowired
	private GuestService guestService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	MainDTO dto;
	
	//Main페이지 이동시 메인페이지에 출력할 사진 가지고 이동
	@RequestMapping(value = "/ok", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(HttpServletRequest request) throws Exception {
		
		List<MainDTO> lists = mainService.hitImage(); //조회수 높은 순으로 5개
		
		request.setAttribute("lists", lists);
		return "main";
	}
	
	
	//Main의 검색창 ajax 처리
	@ResponseBody
	@RequestMapping(value = "/err", method = RequestMethod.POST, produces = "application/text; charset=utf8") 
	public String test(HttpServletRequest req) throws Exception {
		System.out.println("나 실행됨");

		String recommand = "";

		String userKeyword = req.getParameter("userKeyword");
		System.out.println(userKeyword);

		if (userKeyword == null || userKeyword.equals("")) {

			return recommand; // 키워드가 없으면 그냥 반환
		}

		Map<String, String> hMap = new HashMap<String, String>();

		hMap.put("userKeyword", userKeyword); // 사용자의 키워드를 받음
		List<MainDTO> lists = mainService.selectKeyword(hMap); // 사용자에게 받은 대로 DB에 검색

		if (lists != null) {
			Iterator<MainDTO> it = lists.iterator();

			System.out.println(lists);
			while (it.hasNext()) {

				dto = it.next();

				recommand += dto.getM_addr() + ","; // 사용자에게 받은 키워드와 비슷한 아이들을 String "," 연결해서 만듬
			}
			return recommand;

		} else {

			return recommand;
		}

	}

	// 어드민 페이지 이동
		@RequestMapping(value ="/admin", method = {RequestMethod.GET,RequestMethod.POST} )
		public String admin(HttpServletRequest request, HttpSession session) throws Exception{
			
			GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
			
			String hostCheck = guestService.hostCheck(dto.getEmail());
			
			int reviewCount = postService.totalReviewCount();	//리뷰 총 갯수
			int curBookCount = bookService.totalBookCount();	// 현재 예약 갯수
			int userCount = guestService.totalUserCount();	// 유저 수
			int hostCount = guestService.totalHostCount(); 		// 호스트 수
			
			List<MonthsChartDTO> listsMC = mainService.monthsChart();	// 월별 예약 횟수, 금액 리스트
			List<PopularDTO> listsR = mainService.popularRoom();		// 조회수 높은 방 가져옴
			
			request.setAttribute("hostCheck", hostCheck);
			request.setAttribute("listsR", listsR);
			request.setAttribute("listsMC", listsMC);
			request.setAttribute("reviewCount", reviewCount);
			request.setAttribute("curBookCount", curBookCount);
			request.setAttribute("userCount", userCount);
			request.setAttribute("hostCount", hostCount);
			
			return "admin/admin";
		
		}
		
		// hostCheck List
		@RequestMapping(value = "/hostCheckList", method = { RequestMethod.GET, RequestMethod.POST })
		public String hostCheckList(HttpServletRequest request, HttpSession session) throws Exception {

			// 생략 상관없을 듯
			// GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
			List<HostDTO> listsHC = roomService.hostAllData(); // 호스트가 0인것가져오기
			Iterator<HostDTO> it = listsHC.iterator();
			while (it.hasNext()) {
				HostDTO dto1 = it.next();
				System.out.println(dto1.getR_mainimage());
			}
			request.setAttribute("listsHC", listsHC);
			return "admin/hostCheckList";
		}
		
		// hostCheck List -> 
		@RequestMapping(value = "/roomProfile", method = { RequestMethod.GET, RequestMethod.POST })
		public String hostCheckFinal(HttpServletRequest request, HttpSession session) throws Exception {

			String r_num = request.getParameter("r_num");
			System.out.println(r_num);

			HostDTO dto = roomService.hostUpdateData(r_num);
			System.out.println(dto.getR_content());
			System.out.println("이것때문에 에러");
			dto.setR_content(dto.getR_content().replaceAll("\r\n", "<br/>"));
			System.out.println(dto.getF_num());
			System.out.println(dto.getS_num());
			System.out.println(dto);
			
			//cate_num 으로 cate_name 소환
			String cate_name = roomService.getCate_name(dto.getCate_num());
			
			request.setAttribute("cate_name", cate_name);
			request.setAttribute("dto", dto);			
			return "admin/hostCheck";
		}
		
		// Host Check 동의 했을 시
		@RequestMapping(value = "/agreeHost", method = RequestMethod.GET)
		public String agreeHost(HttpServletRequest request, HttpSession session) throws Exception {

			int r_num = Integer.parseInt(request.getParameter("r_num"));
			System.out.println("hostCheck의 r_num:" + r_num);

			String email = guestService.selectEmail(r_num);
			roomService.agreeHost(r_num, email);

			return "redirect:/main/hostCheckList";
		}

		// Host Check 거절 했을 시
		@RequestMapping(value = "/disAgreeHost", method = RequestMethod.GET)
		public String disAgreeHost(HttpServletRequest request, HttpSession session) throws Exception {

			int r_num = Integer.parseInt(request.getParameter("r_num"));
			System.out.println(r_num);

			// DB room 및 mansion 삭제
			roomService.disAgreeHost(r_num);
			roomService.deleteRoomData(r_num);

			// 파일삭제
			String main_image = roomService.getMainImageName(r_num);
			String sub_image = roomService.getsubImageName(r_num);

			String path_m = request.getSession().getServletContext().getRealPath("/resources/tmi/room");

			String oldFilePath = path_m + File.separator + main_image;
			System.out.println("옛경로:" + oldFilePath);
			File oldFileMain = new File(oldFilePath);
			oldFileMain.delete();

			String[] sub = sub_image.split(",");
			for (int i = 0; i < sub.length; i++) {
				String subFilePath = path_m + File.separator + sub[i];
				File oldFileSub = new File(subFilePath);
				oldFileSub.delete();
			}

			// DB파일 roomimage 삭제
			roomService.deleteRoomImage(r_num);

			// 단일 호스트일 시 hostcheck 0으로 변환 복수 호스트 일시 hostcheck 1 유지
			String email = request.getParameter("email");
			int checkCount = roomService.checkCount(email);

			if (checkCount == 0) {
				roomService.updateHost(email);
			}

			return "redirect:/main/hostCheckList";
		}

		// 현재 예약 확인 페이지
		@RequestMapping(value = "/currentReserv", method = { RequestMethod.GET, RequestMethod.POST })
		public String currentReserv(HttpServletRequest request, HttpSession session) throws Exception {

			List<BookDTO> listsCR = bookService.currentBookList();
			request.setAttribute("listsCR", listsCR);

			return "admin/currentReserv";
		}
	}
