package com.exe.tmi.post.dao;

import java.util.List;

import com.exe.tmi.post.dto.PostCommentDTO;
import com.exe.tmi.post.dto.PostDTO;

public interface PostDAO {
	
	public int maxcommentCount() throws Exception;
	public int commentCount(int r_num) throws Exception; //��� ����
	public List<PostCommentDTO> commentList(int r_num) throws Exception; //��� ���
	public void commentInsert(PostDTO dto) throws Exception; //��� �ۼ�
	public void commentUpdate(PostDTO dto) throws Exception; //��� ����
	public void commentDelete(int p_num)throws Exception; // ��� ����
	public String getReadData(int p_num) throws Exception; // �ۼ��� ���̵� �ҷ�����
	public List<PostDTO> getComment(String email) throws Exception;//���� �����ҷ�����
	public int postCommentCount(String email)throws Exception;//���� �����ҷ�����
	public int totalReviewCount() throws Exception;		// ���� �� ����
}
