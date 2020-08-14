package com.exe.tmi.book.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exe.tmi.book.dto.BookDTO;
import com.exe.tmi.book.dto.PointDTO;
import com.exe.tmi.book.service.BookService;
import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.service.GuestService;
import com.exe.tmi.room.dto.RoomDTO;
import com.exe.tmi.room.service.RoomService;

@Controller("bookController")
@RequestMapping(value = "/book")
public class BookControllerImpl implements BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private GuestService guestService;

	@Autowired
	private RoomService roomService;

	@RequestMapping(value = "/bookCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookCheck(HttpServletRequest req, HttpSession session) throws Exception {

		String datefilter = req.getParameter("datefilter"); // 날짜

		System.out.println(datefilter);
		System.out.println("여기 들어옴");
		int r_num = Integer.parseInt(req.getParameter("r_num"));
		int inwon = Integer.parseInt(req.getParameter("inwon"));

		String startDate = datefilter.substring(7, 18); // 체크인 날짜
		String endDate = datefilter.substring(26); // 체크아웃 날짜
		System.out.println("r_num: " + r_num);
		System.out.println("inwon: " + inwon);
		System.out.println("startDate: " + startDate);
		System.out.println("endDate: " + endDate);

		long calDateDays = 0;

		try { // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서
				// 컴파일을 할 수 없다.
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
			Date FirstDate = format.parse(startDate);
			Date SecondDate = format.parse(endDate);

			// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
			// 연산결과 -950400000. long type 으로 return 된다.
			long calDate = FirstDate.getTime() - SecondDate.getTime();

			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다.
			// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.

			if (calDate == 0) {
				calDate = (24 * 60 * 60 * 1000);
			}

			calDateDays = calDate / (24 * 60 * 60 * 1000);

			calDateDays = Math.abs(calDateDays);

			System.out.println("두 날짜의 날짜 차이: " + calDateDays);
		}

		catch (ParseException e) {
			// 예외 처리
		}

		// 기존 방에대한 인원
		RoomDTO rdto = roomService.getRoom(r_num);

		int setPrice = rdto.getR_price();
		int price = 0;

		System.out.println("수정수정");
		System.out.println("넘어온 인원: " + inwon);
		System.out.println("기준인원: " + rdto.getR_inwon());
		System.out.println("금액: " + rdto.getR_price());
		System.out.println("수정종료수정종료");
		// 추가 인원에 대한 금액 변동 추가인원당 금액은 10000원
		if (inwon > rdto.getR_inwon()) {

			int addInwon = inwon - rdto.getR_inwon();
			price = (int) (calDateDays * setPrice) + (int) (addInwon * 10000 * calDateDays);
		} else if (inwon <= rdto.getR_inwon()) {

			price = (int) (calDateDays * setPrice);
		}

		BookDTO bdto = roomService.booking(r_num);

		session = req.getSession();
		GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");
		String coupons = guestService.getCoupons(guestDTO.getEmail());

		req.setAttribute("dto", bdto);
		req.setAttribute("inwon", inwon);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		req.setAttribute("price", price);
		req.setAttribute("coupons", coupons);

		return "payment/booking";

	}

	@ResponseBody
	@RequestMapping(value = "bookingPayMent", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookingPayMent(HttpServletRequest request, HttpSession session) throws Exception {

		String checkin = request.getParameter("startDate");
		String checkout = request.getParameter("endDate");

		int r_num = Integer.parseInt(request.getParameter("r_num"));
		int b_inwon = Integer.parseInt(request.getParameter("inwon"));
		int b_price = Integer.parseInt(request.getParameter("price"));
		int usepoint = Integer.parseInt(request.getParameter("usepoint"));
		int cp_num = Integer.parseInt(request.getParameter("cp_num"));

		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		BookDTO bookDTO = new BookDTO();

		bookDTO.setB_num((bookService.maxBnum() + 1));
		bookDTO.setR_num(r_num);
		bookDTO.setEmail(dto.getEmail());
		bookDTO.setCheckin(checkin);
		bookDTO.setCheckout(checkout);
		bookDTO.setB_inwon(b_inwon);
		bookDTO.setB_price(b_price);

		PointDTO pointDTO = new PointDTO();
		pointDTO.setL_num(bookService.maxLnum() + 1);
		pointDTO.setEmail(dto.getEmail());
		pointDTO.setCp_num(cp_num);
		pointDTO.setUsepoint(usepoint);
		pointDTO.setAddpoint((int) Math.round(b_price * 0.005));

		bookService.book(bookDTO, pointDTO); // 예약하기

		return "okay";
	}

	@RequestMapping(value = "bookingPayMentForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookingPayMentForm(HttpServletRequest request, HttpSession session) throws Exception {

		String price = request.getParameter("price");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String product = request.getParameter("product");

		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");

		request.setAttribute("price", price);
		request.setAttribute("tel", tel);
		request.setAttribute("addr", addr);
		request.setAttribute("product", product);
		request.setAttribute("email", dto.getEmail());
		request.setAttribute("name", dto.getName());

		return "payment/payment";
	}

	@RequestMapping(value = "bookingConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public String bookingCheck() throws Exception {

		return "payment/bookingConfirm";
	}

	@RequestMapping(value = "/booking", method = { RequestMethod.POST, RequestMethod.GET })
	public String booking(HttpServletRequest req, HttpSession session) throws Exception {

		session = req.getSession();

		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		String email = dto.getEmail();

		List<BookDTO> lists = bookService.bookList(email);
		req.setAttribute("lists", lists);
		req.setAttribute("dto", dto);

		return "dashboard/bookingList";
	}

	@ResponseBody
	@RequestMapping(value = "/coupondiscount", method = { RequestMethod.GET, RequestMethod.POST })
	public int coupondiscount(String coupon, String price) throws Exception {
		int temp = Integer.parseInt(price);
		double Discount_price = 0;
		if (coupon.equals("쿠폰을 입력해주세요")) { // 쿠폰 적용 X
			return temp;
		} else if (coupon.equals("신규 쿠폰")) { // 가입 쿠폰 10% 할인
			Discount_price = temp * 0.9;
			Math.floor(Discount_price);
		} else if (coupon.equals("생일 쿠폰")) { // 생일 쿠폰 30% 할인
			Discount_price = temp * 0.7;
			Math.floor(Discount_price);
		}
		return (int) Discount_price;
	}

	@ResponseBody
	@RequestMapping(value = "/pointdiscount", method = { RequestMethod.GET, RequestMethod.POST })
	public int pointdiscount(String point, String price) throws Exception {
		int temp = Integer.parseInt(price);
		int Discount_price = Integer.parseInt(point);
		return (temp - Discount_price);
	}
}
