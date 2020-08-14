package com.exe.tmi.post.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.tmi.guest.dto.GuestDTO;
import com.exe.tmi.guest.service.GuestService;
import com.exe.tmi.post.dto.PostCommentDTO;
import com.exe.tmi.post.dto.PostDTO;
import com.exe.tmi.post.service.PostService;

@RestController
@RequestMapping(value = "/post")
public class PostControllerImpl implements PostController{

	@Autowired
	private PostService postService;
	
	@Autowired
	private GuestService guestService;
	
	//list-side-map 리뷰 출력
	@RequestMapping(value ="/commentList",method = {RequestMethod.GET} )
	public List<PostCommentDTO> commentListJson(HttpServletRequest request)throws Exception{
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		List<PostCommentDTO> list = postService.commentList(r_num);
		
		HttpSession session = request.getSession();
		session.removeAttribute("commandCount");
		int commandCount = postService.commentCount(r_num);
		session.setAttribute("commandCount", commandCount);
		
		return list;
	}
	
	//list-side-map에서 사진 및 댓글 추가
	@ResponseBody
	@RequestMapping(value = "/commentInsert.action", method = RequestMethod.POST)
	public String commentInsert(MultipartHttpServletRequest request) throws Exception {

		System.out.println("insert들어왔니? ㅎㅎ");
		int p_grade = Integer.parseInt(request.getParameter("p_grade"));
		System.out.println(p_grade);
		try {

			String path = request.getSession().getServletContext().getRealPath("/resources/tmi/review");
			MultipartFile file = request.getFile("photo-upload");

			if (file != null) {
				System.out.println("파라미터명: " + file.getName());
				System.out.println("파일 크기: " + file.getSize());
				System.out.println("파일 존재: " + file.isEmpty());
				System.out.println("오리지널 파일 이름: " + file.getOriginalFilename());
			}

			File file1 = new File(path);

			// 경로 없으면 만들어
			if (!file1.exists()) {
				file1.mkdirs();
			}

			// 파일 업로드
			if (file != null && file.getSize() > 0) {

				FileOutputStream fos = new FileOutputStream(path + "/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();
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

			}

			int maxNum = postService.maxcommentCount();

			HttpSession session = request.getSession();
			session.removeAttribute("commandCount");

			// inset 데이터들
			GuestDTO guestDTO = (GuestDTO) session.getAttribute("guestInfo");
			String email = guestDTO.getEmail();
			int r_num = Integer.parseInt(request.getParameter("r_num"));
			String p_content = request.getParameter("p_content");

			System.out.println(email + " email");
			System.out.println(r_num + " r_num");
			System.out.println(p_content + "p_content");

			PostDTO dto = new PostDTO();
			dto.setP_num(maxNum + 1);
			dto.setR_num(r_num);
			dto.setEmail(email);
			dto.setP_grade(p_grade);
			dto.setP_content(p_content);
			dto.setP_imagename(file.getOriginalFilename());

			postService.commentInsert(dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String result = "bb";
		return result;

	}
	
	//list-side-map에서 댓글 삭제
	@RequestMapping(value ="/commentDelete",method = {RequestMethod.POST} )
	public String commentDelete(HttpServletRequest request, PostDTO dto)throws Exception{
		try {
			String writer = postService.getReadData(dto.getP_num());
			if(writer.equals(dto.getEmail())) {
				postService.commentDelete(dto.getP_num());
				return "true";
			} else {
				return "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}

	}
	
	//MYPAGE에서 출력하는 리뷰페이지
	@RequestMapping(value = "/reviewPage",method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reviewPage(HttpServletRequest req,HttpSession session)throws Exception{
		
		ModelAndView mav = new ModelAndView();
		session = req.getSession();
		
		GuestDTO guestInfo = (GuestDTO)session.getAttribute("guestInfo");

		List<PostDTO> lists = postService.getComment(guestInfo.getEmail());
				
		String hostCheck = guestService.hostCheck(guestInfo.getEmail());

		mav.setViewName("dashboard/reviewPage");
		mav.addObject("lists", lists);
		mav.addObject("hostCheck", hostCheck);
	
		return mav;
	}
	
}
