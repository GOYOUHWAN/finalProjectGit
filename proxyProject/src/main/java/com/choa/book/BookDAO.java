package com.choa.book;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.PageMaker;



@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace= "BookMapper.";
	
	//sellBookView
	public BookDTO sellBookView(int num) throws Exception{
		return sqlSession.selectOne(namespace+"sellBookView", num);
	}
	
	//좋아요 글 리스트//
	public List<BookDTO> myBookList(String id) throws Exception {
		return sqlSession.selectList(namespace+"myBookList", id);
	}
	
	//내가 산 책 리스트
	public List<BookDTO> myBuyList(String id) throws Exception {
		return sqlSession.selectList(namespace+"myBuyList", id);
	}
	
	//내가 팔기위해 올려놓은 책 리스트
	public List<BookDTO> sellBookList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(namespace+"sellBookList", pageMaker);
	}
	
	//book 카운트
	public int bookCount() throws Exception {
		return sqlSession.selectOne(namespace+"bookCount");
	}
	
	
	
	
	
}
