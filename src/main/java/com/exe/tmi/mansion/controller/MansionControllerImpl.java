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

		//main���� �Ѿ�� �� �ޱ�****************************************************************************
		String searchValue1 = request.getParameter("userKeyword");	//����
		String datefilter = request.getParameter("datefilter");		//��¥
		String inwon = request.getParameter("inwon");				//�ο�
		String startDate = datefilter.substring(7, 18);		//üũ�� ��¥
		String endDate = datefilter.substring(26);				//üũ�ƿ� ��¥

		hMap.put("inwon", inwon);
		hMap.put("startDate", startDate);
		hMap.put("endDate", endDate);
		hMap.put("searchValue1", searchValue1);

		//Ȯ��
		System.out.println("����=" + searchValue1);
		System.out.println("��¥(datefilter)=" + datefilter);
		System.out.println("�ο�=" + inwon);
		System.out.println("üũ��=" + startDate);
		System.out.println("üũ�ƿ�=" + endDate);
		
		String check = request.getParameter("check");
		System.out.println("������" + check);
		String check2 = request.getParameter("check2");
		System.out.println("������" + check2);
		System.out.println("������ ����");
		
		//�Ŀ� �󼼰˻� �ϴ� ����
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
		
		//�ѷ��� room ����Ʈ ��������
		List<RoomListDTO> roomList;
		
		//wish-list �̹��� ��ȯ
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
			
			//�ѷ��� room ����Ʈ ��������
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
				  
				  System.out.println("wish�� ��ȣ: " + wish[i]);
				  
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
		System.out.println("���");
		System.out.println(roomList);
		return "mansion/list-sidemap";

	}

	@RequestMapping(value = "/reList", method = { RequestMethod.GET,RequestMethod.POST })
	public String reList(HttpServletRequest request,HttpSession session) throws Exception {

		System.out.println("reList ����**************************************************");
		
		Map<String, String> hMap = new HashMap<String, String>();
		
		String startDate = request.getParameter("startDate");		//üũ�� ��¥
		String endDate = request.getParameter("endDate");				//üũ�ƿ� ��¥
		String inwon = request.getParameter("inwon");
		
		hMap.put("startDate", startDate);
		hMap.put("endDate", endDate);
		hMap.put("inwon", inwon); //�ο��� ��� sql �˻�X
		
		//��˻� �Ҷ� �����̷�Ʈ�Ǹ� �ʱ�ȭ �Ǳ� ������ �¼����� ó����
		if(startDate == null) {
			startDate = (String)session.getAttribute("startDate");
			endDate = (String)session.getAttribute("endDate");
			inwon = (String)session.getAttribute("inwon");
		}
				
		//Ȯ��
		System.out.println("session_startDate : "+startDate);
		System.out.println("session_endDate : "+endDate);
		System.out.println("session_inwon : "+ inwon);
				
		hMap.put("startDate", startDate);
		hMap.put("endDate", endDate);
		hMap.put("inwon", inwon);
		//����,ī�װ� �˻�***********************************************************************************
		String searchValue1 = request.getParameter("searchValue1");	//����
		System.out.println(searchValue1);
		String searchValue2 = request.getParameter("searchValue2");	//ī�װ�
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


		//���Ͱ˻� (facility, ratings, space)*****************************************************************************
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
		String check1 = request.getParameter("check1");	//����
		if(check1==null) {
			check1="";
		}
		hMap.put("check1", check1);

		//space
		String[] check2 = request.getParameterValues("check2");	//4,5
		System.out.println("�̰� �� ������??" + check2);
		String newCheck2="";
		if(check2!=null) {
			for(String ch : check2) {
				newCheck2 += ch + "%,%";	//4%,%5%,%
			}
			newCheck2 = newCheck2.substring(0, newCheck2.length()-3);//4%,%5
			System.out.println(newCheck2);
		}
		hMap.put("check2", newCheck2);

		//���ݹ����˻�****************************************************************************************
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
		

		//�ѷ��� room ����Ʈ ��������
		request.setAttribute("check1", check1);
		request.setAttribute("check", checkf);
		request.setAttribute("check2", checks);
		
		List<RoomListDTO> roomList;
		if(searchValue2.equals("0") || searchValue2=="0" || searchValue2==null || searchValue2=="" || searchValue2.equals("")) {
			System.out.println("0������");
			//wish-list �̹��� ��ȯ
			GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
			
			if(dto!=null) {
				String wishList = mansionService.getReadWish(dto.getEmail());
				
				if (wishList==null) {
					System.out.println("wishList3�� ����");
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
				
				//�ѷ��� room ����Ʈ ��������
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
					  
					  System.out.println("wish�� ��ȣ: " + wish[i]);
					  
					  System.out.println("============================================="); } }
					 
					
					roomList.add(rldto);	
				}
				
			}else {
				System.out.println("wishList4�� ����");
				roomList = mansionService.getRoomList(hMap);
			}
		}else {
		
			//wish-list �̹��� ��ȯ
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
				
				//�ѷ��� room ����Ʈ ��������
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
					  
					  System.out.println("wish�� ��ȣ: " + wish[i]);
					  
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

		System.out.println("addWishList �����");

		String r_num = req.getParameter("r_num");
		String searchValue1 = req.getParameter("searchValue1");
		String email = req.getParameter("email");

		// Ȯ��
		System.out.println("addWishList�� r_num:" + r_num);
		System.out.println("addWishList�� email: " + email);
		System.out.println("addWishList�� searchValue1: " + searchValue1);
		

		// �α��� �ȉ�����
		if (email.equals("") || email == null) {
			return "�α����� ���ּ���";
		}

		// ���ø���Ʈ ��������
		String wishList = mansionService.getReadWish(email);

		// ���ø���Ʈ�� ������
		if (wishList != null && !wishList.equals("")) {

			if (!wishList.contains(r_num)) { // ���ø���Ʈ�� �߰����� �ʴ� ��ȣ�̸�

				String wishListAdd = wishList + "," + r_num;

				hMap.put("email", email);
				hMap.put("wishlist", wishListAdd);
				mansionService.updateWish(hMap);

				System.out.println("�о�� wish: " + wishList);

			} else {
				return "�̹� �߰��� ���Դϴ�!";
			}

		}

		// ���ø���Ʈ�� ������
		if (wishList == null || wishList.equals("")) {

			String wishListAdd = r_num;

			hMap.put("email", email);
			hMap.put("wishlist", wishListAdd);
			mansionService.updateWish(hMap);

		}
		return "���ø���Ʈ �߰� �Ϸ�!";
	}
	
}
