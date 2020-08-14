package com.exe.tmi.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.exe.tmi.post.dao.PostDAO;
import com.exe.tmi.post.dto.PostCommentDTO;
import com.exe.tmi.post.dto.PostDTO;

@Service("postService")
public class PostServiceImpl implements PostService{

	@Autowired
	private PostDAO postDAO;

	@Override
	public int commentCount(int r_num) throws Exception {
		int commentCount =postDAO.commentCount(r_num);
		return commentCount;
	}

	@Override
	public List<PostCommentDTO> commentList(int r_num) throws Exception {
		List<PostCommentDTO>lists = postDAO.commentList(r_num);
		return lists;
	}

	@Override
	public void commentInsert(PostDTO dto) throws Exception {
		postDAO.commentInsert(dto);
		
	}

	@Override
	public void commentUpdate(PostDTO dto) throws Exception {
		postDAO.commentUpdate(dto);
		
	}

	@Override
	public void commentDelete(int p_num) throws Exception {
		postDAO.commentDelete(p_num);
		
	}

	@Override
	public int maxcommentCount() throws Exception {
		return postDAO.maxcommentCount();
	}

	@Override
	public String getReadData(int p_num) throws Exception {
		return postDAO.getReadData(p_num);
	}
	
	@Override
	public List<PostDTO> getComment(String email) throws Exception {
		return postDAO.getComment(email);
	}

	@Override
	public int postCommentCount(String email) throws Exception {
		int postCount = postDAO.postCommentCount(email);
		return postCount;
	}
	
	@Override
	public int totalReviewCount() throws Exception{	
		int totalpostCount = postDAO.totalReviewCount();	
		return totalpostCount;		
	}

}
