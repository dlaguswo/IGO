package com.exe.tmi.post.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exe.tmi.post.dto.PostCommentDTO;
import com.exe.tmi.post.dto.PostDTO;

@Repository("postDAO")
public class PostDAOImpl implements PostDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int commentCount(int r_num) throws Exception {
		int num = sqlSession.selectOne("mapper.post.commentCount", r_num);
		return num;
	}
	@Override
	public List<PostCommentDTO> commentList(int r_num) throws Exception {
		List<PostCommentDTO> lists = sqlSession.selectList("mapper.post.commentList", r_num);		
		return lists;
	}

	@Override
	public void commentInsert(PostDTO dto) throws Exception {
		sqlSession.insert("mapper.post.commentInsert", dto);
		
	}

	@Override
	public void commentUpdate(PostDTO dto) throws Exception {
		sqlSession.update("mapper.post.commentUpdate");
		
	}

	@Override
	public void commentDelete(int p_num) throws Exception {
		sqlSession.delete("mapper.post.commentDelete", p_num);
		
	}
	
	@Override
	public int maxcommentCount() throws Exception {
		return sqlSession.selectOne("mapper.post.commentmaxNum");
	}
	
	@Override
	public String getReadData(int p_num) throws Exception {
		return sqlSession.selectOne("mapper.post.getReadData", p_num);
	}
	
	@Override
	public List<PostDTO> getComment(String email) throws Exception {
		return sqlSession.selectList("mapper.post.getComment",email); 
	}
	
	@Override
	public int postCommentCount(String email) throws Exception {
		int postCount = sqlSession.selectOne("mapper.post.postCommentCount", email);
		return postCount;
	}
	
	@Override
	public int totalReviewCount() throws Exception {		
		int totalpostCount = sqlSession.selectOne("mapper.post.totalpostCount");		
		return totalpostCount;
	}
	
}
