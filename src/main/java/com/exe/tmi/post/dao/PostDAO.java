package com.exe.tmi.post.dao;

import java.util.List;

import com.exe.tmi.post.dto.PostCommentDTO;
import com.exe.tmi.post.dto.PostDTO;

public interface PostDAO {
	
	public int maxcommentCount() throws Exception;
	public int commentCount(int r_num) throws Exception; //댓글 개수
	public List<PostCommentDTO> commentList(int r_num) throws Exception; //댓글 목록
	public void commentInsert(PostDTO dto) throws Exception; //댓글 작성
	public void commentUpdate(PostDTO dto) throws Exception; //댓글 수정
	public void commentDelete(int p_num)throws Exception; // 댓글 삭제
	public String getReadData(int p_num) throws Exception; // 작성자 아이디 불러오기
	public List<PostDTO> getComment(String email) throws Exception;//리뷰 정보불러오기
	public int postCommentCount(String email)throws Exception;//리뷰 정보불러오기
	public int totalReviewCount() throws Exception;		// 리뷰 총 개수
}
