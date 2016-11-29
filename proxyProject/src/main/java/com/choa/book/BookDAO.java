package com.choa.book;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace= "BookMapper.";
	
	//좋아요 글 리스트//
	public List<BookDTO> myBookList(String id) throws Exception {
		return sqlSession.selectList(namespace+"myBookList", id);
	}
	
	//내가 산 책 리스트
	public List<BookDTO> myBuyList(String id) throws Exception {
		return sqlSession.selectList(namespace+"myBuyList", id);
	}
	

	
	
	
	
	
	
	
}
