package com.exe.tmi.mansion.controller;

import java.util.ArrayList;
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

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.mansion.dto.RoomListDTO;
import com.exe.tmi.mansion.service.MansionService;

@Controller("mansionController")
@RequestMapping(value = "/mansion")
public class MansionControllerImpl implements MansionController{

	@Autowired
	private MansionService mansionService;
	
	@RequestMapping(value = "/addHost", method = { RequestMethod.GET,RequestMethod.POST })
	public String addHost(HttpServletRequest req) throws Exception {
		
		return "addHost";
	}

	@RequestMapping(value = "/list", method = { RequestMethod.GET,RequestMethod.POST })
	public String list(HttpServletRequest request,HttpSession session) throws Exception {

		Map<String, String> hMap = new HashMap<String, String>();

		//main에서 넘어온 값 받기****************************************************************************
		String searchValue1 = request.getParameter("userKeyword");	//지역
		String datefilter = request.getParameter("datefilter");		//날짜
		String inwon = request.getParameter("inwon");				//인원
		String startDate = datefilter.substring(7, 18);		//체크인 날짜
		String endDate = datefilter.substring(26);				//체크아웃 날짜

		hMap.put("inwon", inwon);
		hMap.put("startDate", startDate);
		hMap.put("endDate", endDate);
		hMap.put("searchValue1", searchValue1);

		//확인
		System.out.println("지역=" + searchValue1);
		System.out.println("날짜(datefilter)=" + datefilter);
		System.out.println("인원=" + inwon);
		System.out.println("체크인=" + startDate);
		System.out.println("체크아웃=" + endDate);
		
		String check = request.getParameter("check");
		System.out.println("아이콘" + check);
		String check2 = request.getParameter("check2");
		System.out.println("아이콘" + check2);
		System.out.println("아이콘 실행");
		
		//후에 상세검색 하는 값들
		//check = f_num
		//check1 = r_grade
		//check2 = s_num
		hMap.put("check", check);
		hMap.put("check1", "");
		hMap.put("check2", check2);
		hMap.put("minPrice", "20000");
		hMap.put("maxPrice", "500000");
		hMap.put("searchValue2", "");
		
		String check1 = "";
		
		//뿌려줄 room 리스트 가져오기
		List<RoomListDTO> roomList;
		
		//wish-list 이미지 변환
		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		
		if(dto!=null) {
			System.out.println("dto1");
			String wishList = mansionService.getReadWish(dto.getEmail());
			
			if (wishList==null) {
				System.out.println("dto2");
				List<RoomListDTO> roomList2 = mansionService.getRoomList(hMap);
				
				request.setAttribute("roomList", roomList2);
				
				request.setAttribute("startDate", startDate);
				request.setAttribute("endDate", endDate);
				request.setAttribute("searchValue1", searchValue1);
				request.setAttribute("inwon", inwon);

				return "mansion/list-sidemap";

			}
			
			String[] wish = wishList.split(",");
			
			for(int i=0;i<wish.length;i++) {
				System.out.println(wish[i]);
			}
			
			//뿌려줄 room 리스트 가져오기
			List<RoomListDTO> roomList2 = mansionService.getRoomList(hMap);
			roomList = new ArrayList<RoomListDTO>();
			
			Iterator<RoomListDTO> it = roomList2.iterator();
			
			while(it.hasNext()) {
				
				
				RoomListDTO rldto = new RoomListDTO();
				
				rldto = it.next();
				
				
				  for(int i=0;i<wish.length;i++) {
				  
				  if(Integer.parseInt(wish[i])==rldto.getR_num()) {
				  
				  rldto.setWishList(wish[i]);
				  
				  System.out.println("=============================================");
				  
				  System.out.println("wish의 번호: " + wish[i]);
				  
				  System.out.println("============================================="); } }
				 
				
				roomList.add(rldto);	
			}
			
		}else {
			System.out.println("dto3");
			roomList = mansionService.getRoomList(hMap);
		}
		
		request.setAttribute("check", check);
		request.setAttribute("check1", check1);
		request.setAttribute("check2", check2);
		request.setAttribute("roomList", roomList);
		request.setAttribute("inwon", inwon);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("searchValue1", searchValue1);
		request.setAttribute("minPrice", 20000);
		request.setAttribute("maxPrice", 500000);
		System.out.println("출력");
		System.out.println(roomList);
		return "mansion/list-sidemap";

	}

	@RequestMapping(value = "/reList", method = { RequestMethod.GET,RequestMethod.POST })
	public String reList(HttpServletRequest request,HttpSession session) throws Exception {

		System.out.println("reList 들어옴**************************************************");
		
		Map<String, String> hMap = new HashMap<String, String>();
		
		String startDate = request.getParameter("startDate");		//체크인 날짜
		String endDate = request.getParameter("endDate");				//체크아웃 날짜
		String inwon = request.getParameter("inwon");
		
		hMap.put("startDate", startDate);
		hMap.put("endDate", endDate);
		hMap.put("inwon", inwon); //인원값 없어도 sql 검색X
		
		//재검색 할때 리다이렉트되면 초기화 되기 때문에 셋션으로 처리됨
		if(startDate == null) {
			startDate = (String)session.getAttribute("startDate");
			endDate = (String)session.getAttribute("endDate");
			inwon = (String)session.getAttribute("inwon");
		}
				
		//확인
		System.out.println("session_startDate : "+startDate);
		System.out.println("session_endDate : "+endDate);
		System.out.println("session_inwon : "+ inwon);
				
		hMap.put("startDate", startDate);
		hMap.put("endDate", endDate);
		hMap.put("inwon", inwon);
		//지역,카테고리 검색***********************************************************************************
		String searchValue1 = request.getParameter("searchValue1");	//지역
		System.out.println(searchValue1);
		String searchValue2 = request.getParameter("searchValue2");	//카테고리
		System.out.println("searchValue2: " + searchValue2);
		if(searchValue1==null) {
			searchValue1="";
		}

		if(searchValue2==null) {
			searchValue2="";
		}
		
		hMap.put("searchValue1", searchValue1);
		hMap.put("searchValue2", searchValue2);
		System.out.println("searchValue1 : " + searchValue1);
		System.out.println("searchValue2 : " + searchValue2);


		//필터검색 (facility, ratings, space)*****************************************************************************
		//facility
		String[] check = request.getParameterValues("check");	//5,10
		String newCheck="";
		if(check!=null) {
			for(String ch : check) {
				newCheck += ch + "%,%";	//5%,%10%,%
			}
			newCheck = newCheck.substring(0, newCheck.length()-3);	//5%,%10	    	  
		}
		hMap.put("check", newCheck);

		//ratings
		String check1 = request.getParameter("check1");	//별점
		if(check1==null) {
			check1="";
		}
		hMap.put("check1", check1);

		//space
		String[] check2 = request.getParameterValues("check2");	//4,5
		System.out.println("이게 왜 에러냐??" + check2);
		String newCheck2="";
		if(check2!=null) {
			for(String ch : check2) {
				newCheck2 += ch + "%,%";	//4%,%5%,%
			}
			newCheck2 = newCheck2.substring(0, newCheck2.length()-3);//4%,%5
			System.out.println(newCheck2);
		}
		hMap.put("check2", newCheck2);

		//가격범위검색****************************************************************************************
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");

		if(minPrice==null || minPrice.equals("") || maxPrice==null || maxPrice.equals("")) {
			minPrice = "20000";
			maxPrice = "500000";
		}
		hMap.put("minPrice", minPrice);
		hMap.put("maxPrice", maxPrice);
		
		
		String checkf = "";
		if(check!=null) {	
			for(int i=0;i<check.length;i++) {
				
				checkf += check[i] + ",";
			}
		checkf = checkf.substring(0,checkf.lastIndexOf(","));	
		}
		
		
		String checks = "";
		if(check2!=null) {
			for(int i=0;i<check2.length;i++) {
				
				checks += check2[i] + ",";
			}
			checks = checks.substring(0,checks.lastIndexOf(","));	
		}
		

		//뿌려줄 room 리스트 가져오기
		request.setAttribute("check1", check1);
		request.setAttribute("check", checkf);
		request.setAttribute("check2", checks);
		
		List<RoomListDTO> roomList;
		if(searchValue2.equals("0") || searchValue2=="0" || searchValue2==null || searchValue2=="" || searchValue2.equals("")) {
			System.out.println("0은들어옴");
			//wish-list 이미지 변환
			GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
			
			if(dto!=null) {
				String wishList = mansionService.getReadWish(dto.getEmail());
				
				if (wishList==null) {
					System.out.println("wishList3번 실행");
					List<RoomListDTO> roomList3 = mansionService.getRoomList(hMap);
					
					request.setAttribute("roomList", roomList3);
					
					request.setAttribute("startDate", startDate);
					request.setAttribute("endDate", endDate);
					request.setAttribute("searchValue1", searchValue1);
					request.setAttribute("inwon", inwon);

					return "mansion/list-sidemap";

				}
				
				String[] wish = wishList.split(",");
				
				for(int i=0;i<wish.length;i++) {
					System.out.println(wish[i]);
				}
				
				//뿌려줄 room 리스트 가져오기
				List<RoomListDTO> roomList2 = mansionService.getRoomList(hMap);
				roomList = new ArrayList<RoomListDTO>();
				
				Iterator<RoomListDTO> it = roomList2.iterator();
				
				while(it.hasNext()) {
					
					
					RoomListDTO rldto = new RoomListDTO();
					
					rldto = it.next();
					
					
					  for(int i=0;i<wish.length;i++) {
					  
					  if(Integer.parseInt(wish[i])==rldto.getR_num()) {
					  
					  rldto.setWishList(wish[i]);
					  
					  System.out.println("=============================================");
					  
					  System.out.println("wish의 번호: " + wish[i]);
					  
					  System.out.println("============================================="); } }
					 
					
					roomList.add(rldto);	
				}
				
			}else {
				System.out.println("wishList4번 실행");
				roomList = mansionService.getRoomList(hMap);
			}
		}else {
		
			//wish-list 이미지 변환
			GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
			
			if(dto!=null) {
				String wishList = mansionService.getReadWish(dto.getEmail());
				
				if (wishList==null) {
					
					List<RoomListDTO> roomList4 = mansionService.reGetRoomList(hMap);
					
					request.setAttribute("roomList", roomList4);
					
					request.setAttribute("startDate", startDate);
					request.setAttribute("endDate", endDate);
					request.setAttribute("searchValue1", searchValue1);
					request.setAttribute("inwon", inwon);

					return "mansion/list-sidemap";

				}
				
				String[] wish = wishList.split(",");
				
				for(int i=0;i<wish.length;i++) {
					System.out.println(wish[i]);
				}
				
				//뿌려줄 room 리스트 가져오기
				List<RoomListDTO> roomList2 = mansionService.getRoomList(hMap);
				roomList = new ArrayList<RoomListDTO>();
				
				Iterator<RoomListDTO> it = roomList2.iterator();
				
				while(it.hasNext()) {
					
					
					RoomListDTO rldto = new RoomListDTO();
					
					rldto = it.next();
					
					
					  for(int i=0;i<wish.length;i++) {
					  
					  if(Integer.parseInt(wish[i])==rldto.getR_num()) {
					  
					  rldto.setWishList(wish[i]);
					  
					  System.out.println("=============================================");
					  
					  System.out.println("wish의 번호: " + wish[i]);
					  
					  System.out.println("============================================="); } }
					 
					
					roomList.add(rldto);	
				}
				
			}else {
				
				roomList = mansionService.reGetRoomList(hMap);
			}
		}
		
		
		request.setAttribute("roomList", roomList);
		
		
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("searchValue1", searchValue1);
		request.setAttribute("inwon", inwon);

		return "mansion/list-sidemap";

	}
	
	@ResponseBody
	@RequestMapping(value = "/addWishList", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset=utf8")
	public String addWishList(HttpServletRequest req) throws Exception {

		Map<String, String> hMap = new HashMap<String, String>();

		System.out.println("addWishList 실행됨");

		String r_num = req.getParameter("r_num");
		String searchValue1 = req.getParameter("searchValue1");
		String email = req.getParameter("email");

		// 확인
		System.out.println("addWishList의 r_num:" + r_num);
		System.out.println("addWishList의 email: " + email);
		System.out.println("addWishList의 searchValue1: " + searchValue1);
		

		// 로그인 안됬으면
		if (email.equals("") || email == null) {
			return "로그인을 해주세요";
		}

		// 위시리스트 가져오기
		String wishList = mansionService.getReadWish(email);

		// 위시리스트가 있으면
		if (wishList != null && !wishList.equals("")) {

			if (!wishList.contains(r_num)) { // 위시리스트에 추가되지 않는 번호이면

				String wishListAdd = wishList + "," + r_num;

				hMap.put("email", email);
				hMap.put("wishlist", wishListAdd);
				mansionService.updateWish(hMap);

				System.out.println("읽어온 wish: " + wishList);

			} else {
				return "이미 추가된 방입니다!";
			}

		}

		// 위시리스트가 없으면
		if (wishList == null || wishList.equals("")) {

			String wishListAdd = r_num;

			hMap.put("email", email);
			hMap.put("wishlist", wishListAdd);
			mansionService.updateWish(hMap);

		}
		return "위시리스트 추가 완료!";
	}
	
}
