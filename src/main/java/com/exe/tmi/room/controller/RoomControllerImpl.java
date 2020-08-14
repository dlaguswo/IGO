package com.exe.tmi.room.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.service.GuestService;
import com.exe.tmi.mansion.dto.MansionDTO;
import com.exe.tmi.mansion.service.MansionService;
import com.exe.tmi.post.service.PostService;
import com.exe.tmi.room.dto.HostDTO;
import com.exe.tmi.room.dto.RoomDTO;
import com.exe.tmi.room.service.RoomService;

@Controller("roomController")
@RequestMapping(value = "/room")
public class RoomControllerImpl implements RoomController{

	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MansionService mansionService;
	
	@Autowired
	private GuestService guestService;
	
	@Autowired
	private PostService postService;
	
	/*@RequestMapping(value = "/addHost", method = { RequestMethod.GET })
	public ModelAndView addHost(HttpServletRequest req,HttpSession session) throws Exception {		
		session = req.getSession();
		ModelAndView mav = new ModelAndView();
		GuestDTO dto = (GuestDTO) session.getAttribute("guestInfo");
		mav.addObject("dto", dto);
		mav.setViewName("addhost");
		return mav;
	}*/
	
	@RequestMapping(value = "/addHostCheckInfo", method = { RequestMethod.GET,RequestMethod.POST })
	public String addHostCheckInfo(HttpServletRequest req,HttpSession session) throws Exception {
		
		return "dashboard/addHostCheck";
	}
	
	@RequestMapping(value = "/roomEdit", method = { RequestMethod.GET })
	public String addHostCK(HttpServletRequest req,HttpSession session) throws Exception {
		
		//���ǿ� EMAIL ������ ����Ʈ ��� �� ����
		GuestDTO dto = (GuestDTO)session.getAttribute("guestInfo");
		System.out.println("email Ȯ��");
		System.out.println(dto.getEmail());
		
		String hostCheck = guestService.hostCheck(dto.getEmail());
		List<HostDTO> lists = roomService.hostData(dto.getEmail());
		
		
		req.setAttribute("hostCheck", hostCheck);
		req.setAttribute("lists", lists);
		
		return "dashboard/roomEdit";
	}
	
	@RequestMapping(value = "/roomProfile", method = { RequestMethod.GET })
	public String addHostPRO(HttpServletRequest req,HttpSession session) throws Exception {
		
		String r_num = req.getParameter("r_num");
		HostDTO dto = roomService.hostUpdateData(r_num);
		dto.setR_content(dto.getR_content().replaceAll("\r\n", "<br/>"));
		
		req.setAttribute("dto", dto);
		
		GuestDTO dto_G = (GuestDTO) session.getAttribute("guestInfo");
		String hostCheck = guestService.hostCheck(dto_G.getEmail());
		
		req.setAttribute("hostCheck", hostCheck);
		
		return "dashboard/roomProfile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/addhostCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String addHost_insert(MultipartHttpServletRequest request) throws Exception {
		
		
		String Housetitle = request.getParameter("houseTilte");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String roomName = request.getParameter("roomName");
		String price = request.getParameter("price");
		int cate = Integer.parseInt(request.getParameter("cate"));
		String people = request.getParameter("people");
		String checkArray = request.getParameter("checkArray");
		String checkArray2 = request.getParameter("checkArray2");
		String bedRoomCount = request.getParameter("bedRoomCount");
		String bedCount = request.getParameter("bedCount");
		String bathCount = request.getParameter("bathCount");
		String content = request.getParameter("textArea");
		String email = request.getParameter("email");
	
		
		
//		if(file_s!=null && file_s.getSize()>0) {
//			
//			try {
//				FileOutputStream fos = new FileOutputStream(path_s + "/" + file_s.getOriginalFilename());
//				
//				InputStream is = file_s.getInputStream();
//				
//				byte[] buffer = new byte[512];
//				
//				while(true) {
//					
//					int data = is.read(buffer, 0, buffer.length);
//					
//					if(data==-1) {
//						break;
//					}
//					
//					fos.write(buffer, 0, data);
//				}
//				
//				is.close();
//				fos.close();
//				
//			} catch (Exception e) {
//				System.out.println(e.toString());
//			}
//		}
				

		
		
		int maxNum = mansionService.getmaxNum(); System.out.println(maxNum);
		
		MansionDTO dto = new MansionDTO();
		
		dto.setM_num(maxNum+1); 
		dto.setCate_num(cate); 
		dto.setM_name(Housetitle);
		dto.setM_addr(address); 
		dto.setM_tel(tel);
		dto.setEmail(email);
		mansionService.insertData(dto);
		 
		int maxNum1 = roomService.getMaxNum(); System.out.println(maxNum1);
		
		RoomDTO rdto = new RoomDTO();
		
		rdto.setM_num(maxNum+1); 
		rdto.setR_num(maxNum1+1); 
		rdto.setR_name(roomName);
		rdto.setR_content(content);
		rdto.setR_price(Integer.parseInt(price));
		rdto.setR_inwon(Integer.parseInt(people));
		rdto.setR_bedroom(Integer.parseInt(bedRoomCount));
		rdto.setR_bed(Integer.parseInt(bedCount));
		rdto.setR_bath(Integer.parseInt(bathCount));
		
		roomService.insertData(rdto);
		
		//���� ���� �������� ��
		MultipartFile file = request.getFile("file1");
		
		if(file!=null) {
			
			System.out.println("�Ķ���͸�: " + file.getName());
			System.out.println("���� ũ��: " + file.getSize());
			System.out.println("���� ����: " + file.isEmpty());
			System.out.println("�������� ���� �̸�: " + file.getOriginalFilename());
		}
		
		String path_m = request.getSession().getServletContext().getRealPath("/resources/tmi/room");
		String mainFileName = "";
		
		//���� ���� ���� �����ϱ� ���ؼ�
		File file1 = new File(path_m);
		
		if(!file1.exists()) {
			file1.mkdirs();
		}
		
		
		//���� ���ε� ����
		if(file!=null && file.getSize()>0) {
			
			try {
				
				int pos = file.getOriginalFilename().lastIndexOf(".");
				String exe = file.getOriginalFilename().substring(pos);
				System.out.println(exe);

				mainFileName = cate + "-" +(maxNum1+1) + "" + exe;
				
				System.out.println(mainFileName);
				FileOutputStream fos = new FileOutputStream(path_m + "/" + mainFileName);
				
				InputStream is = file.getInputStream();
				
				byte[] buffer = new byte[512];
				
				while(true) {
					
					int data = is.read(buffer, 0, buffer.length);
					
					if(data==-1) {
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
		
		String path_s = request.getSession().getServletContext().getRealPath("/resources/tmi/room");
		
		
		File file2 = new File(path_s);
		 
		if(!file2.exists()) { file2.mkdirs(); }
		

		
		List<MultipartFile> fileList = request.getFiles("file2");
		
		int count = 1;
		String subFullName = "";
		
		for(MultipartFile mf : fileList) {
			
			try {
				
				int pos = file.getOriginalFilename().lastIndexOf(".");
				String exe = file.getOriginalFilename().substring(pos);
				System.out.println(exe);

				String newFileName = cate + "-" + (maxNum1+1) + "-" + count + exe;
				
				System.out.println(newFileName);
				subFullName += newFileName + ",";
				
				mf.transferTo(new File(path_s,newFileName));
				
				count = count+1;
				
			} catch (Exception e) {
				e.toString();
			}
			
		}
		
		subFullName = subFullName.substring(0,subFullName.length()-1);
		
		RoomDTO roomimage = new RoomDTO();
		
		roomimage.setR_num(maxNum1+1);
		roomimage.setR_mainimage(mainFileName);
		roomimage.setR_subimage(subFullName);
		
		roomService.insertImageData(roomimage);
		
		
		RoomDTO roomsub = new RoomDTO();
		roomsub.setR_num(maxNum1+1);
		roomsub.setF_num(checkArray);
		roomsub.setS_num(checkArray2);
		
		roomService.insertArrayData(roomsub);
		
		
		
		return "/tmi/room/addHostCheckInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatehostCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String updatehostCheck(MultipartHttpServletRequest request) throws Exception {
		
		
		String Housetitle = request.getParameter("houseTilte");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String roomName = request.getParameter("roomName");
		String price = request.getParameter("price");
		int cate = Integer.parseInt(request.getParameter("cate"));
		String people = request.getParameter("people");
		String checkArray = request.getParameter("checkArray");
		String checkArray2 = request.getParameter("checkArray2");
		String bedRoomCount = request.getParameter("bedRoomCount");
		String bedCount = request.getParameter("bedCount");
		String bathCount = request.getParameter("bathCount");
		String content = request.getParameter("textArea");
		@SuppressWarnings("unused")
		String email = request.getParameter("email");
		int r_num = Integer.parseInt(request.getParameter("r_num"));

		
		int m_num = mansionService.getMnum(r_num);
		
		MansionDTO dto = new MansionDTO();
		
		dto.setM_name(Housetitle);
		dto.setCate_num(cate);
		dto.setM_addr(address); 
		dto.setM_tel(tel);
		dto.setM_num(m_num);
		
		mansionService.updateData(dto);
		
		RoomDTO rdto = new RoomDTO();
		
		rdto.setR_num(r_num);
		rdto.setR_name(roomName);
		rdto.setR_content(content);
		rdto.setR_price(Integer.parseInt(price));
		rdto.setR_inwon(Integer.parseInt(people));
		rdto.setR_bedroom(Integer.parseInt(bedRoomCount));
		rdto.setR_bed(Integer.parseInt(bedCount));
		rdto.setR_bath(Integer.parseInt(bathCount));
		
		roomService.updateData(rdto);
		System.out.println(r_num);
		String main_image = roomService.getMainImageName(r_num);
		String sub_image = roomService.getsubImageName(r_num);
		
		//���� ���� �������� ��
		MultipartFile file = request.getFile("file1");
		
		RoomDTO roomimage = new RoomDTO();	
		roomimage.setR_num(r_num);
		
		
		if(file!=null) {
			
			System.out.println("�Ķ���͸�: " + file.getName());
			System.out.println("���� ũ��: " + file.getSize());
			System.out.println("���� ����: " + file.isEmpty());
			System.out.println("�������� ���� �̸�: " + file.getOriginalFilename());
		
			
		String path_m = request.getSession().getServletContext().getRealPath("/resources/tmi/room");
		String mainFileName = "";
		
		//���� ���� ���� �����ϱ� ���ؼ�
		File file1 = new File(path_m);
		
		if(!file1.exists()) {
			file1.mkdirs();
		}
		
		String oldFilePath = path_m + File.separator + main_image;
		System.out.println("�����:" + oldFilePath);
		File oldFileMain = new File(oldFilePath);
		oldFileMain.delete();
		
		//���� ���ε� ����
		if(file!=null && file.getSize()>0) {
			
			try {
				
				int pos = file.getOriginalFilename().lastIndexOf(".");
				String exe = file.getOriginalFilename().substring(pos);
				System.out.println(exe);

				mainFileName = cate + "-" +(r_num) + "" + exe;
				
				System.out.println(mainFileName);
				FileOutputStream fos = new FileOutputStream(path_m + "/" + mainFileName);
				
				InputStream is = file.getInputStream();
				
				byte[] buffer = new byte[512];
				
				while(true) {
					
					int data = is.read(buffer, 0, buffer.length);
					
					if(data==-1) {
						break;
					}
					
					fos.write(buffer, 0, data);
				}
				
				is.close();
				fos.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			roomimage.setR_mainimage(mainFileName);
			}
		}
		
		
		
		String path_s = request.getSession().getServletContext().getRealPath("/resources/tmi/room");
		
		
		File file2 = new File(path_s);
		 
		if(!file2.exists()) { file2.mkdirs(); }
		

		List<MultipartFile> fileList = request.getFiles("file2");
		
		
		if(fileList!=null) {
		int count = 1;
		String subFullName = "";
		
		
		int subCount = sub_image.split(",").length;
		String[] subImage = sub_image.split(",");
		
		
		for(int i=0;i<subCount;i++) {
			
			String subFilePath = path_s + File.separator + subImage[i];

			File oldFileSub = new File(subFilePath);
			oldFileSub.delete();
		}
		
		
		for(MultipartFile mf : fileList) {
			
			try {
				
				int pos = file.getOriginalFilename().lastIndexOf(".");
				String exe = file.getOriginalFilename().substring(pos);
				System.out.println(exe);

				String newFileName = cate + "-" + (r_num) + "-" + count + exe;
				
				System.out.println(newFileName);
				subFullName += newFileName + ",";
				mf.transferTo(new File(path_s,newFileName));
				
				count = count+1;
				
			} catch (Exception e) {
				e.toString();
			}
			
		}
		
		subFullName = subFullName.substring(0,subFullName.length()-1);
		roomimage.setR_subimage(subFullName);
		
		}
		
		roomService.updateImageData(roomimage);

		RoomDTO roomsub = new RoomDTO();
		roomsub.setR_num(r_num);
		roomsub.setF_num(checkArray);
		roomsub.setS_num(checkArray2);
		
		roomService.updateArrayData(roomsub);
		
		
		
		return "success update";
	}
		
	@RequestMapping(value = "/roomInfo", method = { RequestMethod.GET,RequestMethod.POST })
	   public String roomInfo(HttpServletRequest req) throws Exception {
	      
	      //list-sidemap.jsp���� �Ѿ�� �� �ޱ�
	      int r_num = Integer.parseInt(req.getParameter("r_num"));
	      int inwon = Integer.parseInt(req.getParameter("inwon"));
	      String startDate = req.getParameter("startDate");
	      String endDate = req.getParameter("endDate");
	      System.out.println("startDate :" + startDate);
	      System.out.println("endDate :" + endDate);
	      
	      //Ȯ��
	      System.out.println("roomInfo����! r_num�� " + r_num);
	      
	      //room ��ȸ�� ����
	      roomService.updateHitCount(r_num);
	      
	      //Room ���� ��������
	      RoomDTO dtoR = roomService.getRoom(r_num);
	      
	      //Room �̹��� ����      
	      String[] r_subimage = dtoR.getR_subimage().split(",");
	      
	      //Ȯ��
	      for(int i=0;i<r_subimage.length;i++) {
	         System.out.println(r_subimage[i]);
	      }
	      
	      //m_num ���� Mansion ���� ��������
	      MansionDTO dtoM = mansionService.getMansion(dtoR.getM_num());
	      
	      //mansion�� email�� ȣ��Ʈ ���� ��������
	      GuestDTO dtoH = mansionService.getHostInfo(dtoM.getEmail());
	      int postCount = postService.postCommentCount(dtoM.getEmail());
	      int roomCount = roomService.getRoomCount(dtoM.getEmail());
	      
	      //m_addr ���� �ֺ��� �� ��������
	      String[] addr = dtoM.getM_addr().split(" ");   //addr[2] : ��
	      Map<String, Object> hMap = new HashMap<String, Object>();
	      hMap.put("m_num", dtoR.getM_num());
	      hMap.put("addr", addr[2]);
	      
	      List<RoomDTO> listNR = roomService.getNearRoom(hMap);
	      
	      //m_num ���� ���� �ǹ��� �ٸ� �� ���� ��������
	      Map<String, Integer> hMap1 = new HashMap<String, Integer>();
	      hMap1.put("r_num", r_num);
	      hMap1.put("m_num", dtoR.getM_num());
	      
	      List<RoomDTO> listOR = roomService.getOtherRoom(hMap1);
	      
	      String m_addr = dtoM.getM_addr();
	      String m_name = dtoM.getM_name();
	      
	      String searchValue1 = req.getParameter("searchValue1");
			
			if(searchValue1!=null) {
				
				searchValue1 = URLDecoder.decode(searchValue1, "UTF-8");
				req.setAttribute("searchValue1", searchValue1);
			}
	      
		  RoomDTO dto = roomService.faciltyorroomsub(r_num);
		  
		  req.setAttribute("postCount", postCount);
		  req.setAttribute("roomCount", roomCount);
		  req.setAttribute("facility", dto.getF_num());
		  req.setAttribute("roomsub", dto.getS_num());
	      req.setAttribute("r_num", r_num);//���ȣ
	      req.setAttribute("dtoR", dtoR);//������
	      req.setAttribute("r_subimage", r_subimage);//�� �����̹���
	      req.setAttribute("dtoM", dtoM);//��������
	      req.setAttribute("listOR", listOR);//���� �ǹ��� �ٸ� ������
	      req.setAttribute("listNR", listNR);//�ֺ��� �ٸ� ������
	      req.setAttribute("inwon", inwon);//�����ο�
	      req.setAttribute("startDate", startDate);//üũ��
	      req.setAttribute("endDate", endDate);//üũ�ƿ�
	      req.setAttribute("m_addr", m_addr);
	      req.setAttribute("m_name", m_name);
	      req.setAttribute("dtoH", dtoH);//ȣ��Ʈ����
	      
	      return "room/selectroom";
	      
	   }

	@ResponseBody
	@RequestMapping(value = "/selectRoomCheck", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "application/text; charset=utf8")
	public String selectRoomCheck(HttpServletRequest req) throws Exception {

		System.out.println("selectRoomCheck �����");

		String r_num = req.getParameter("r_num");
		String email = req.getParameter("email");

		// Ȯ��
		System.out.println("addWishList�� r_num:" + r_num);
		System.out.println("addWishList�� email: " + email);

		// �α��� �ȉ�����
		if (email.equals("") || email == null) {
			return "�α����� ���ּ���";
		}
		
		String Sr_num = r_num + "";
		
		return Sr_num;
	}
	
	@RequestMapping(value = "/deleteRoomForm", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteListForm(HttpServletRequest request, HttpSession session) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/deleteRoom");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteRoom", method = {RequestMethod.GET, RequestMethod.POST})
	public List<RoomDTO> deleteRoom (HttpServletRequest request, HttpSession session) throws Exception {
				
		List<RoomDTO> lists = roomService.deleteRoomGetData();
		return lists;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteRoomData", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteRoomData (HttpServletRequest request, HttpSession session, @RequestParam("r_num") String r_num) throws Exception {
		try {
			roomService.deleteRoomData(Integer.parseInt(r_num));
			
			String email = guestService.selectEmail(Integer.parseInt(r_num));

			int checkCount = roomService.checkCount(email);

			if (checkCount == 0) {
				roomService.updateHost(email);
			}

			return "true";
		} catch (Exception e) {
			return "false";
		}
	}

}
