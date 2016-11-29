package com.choa.book;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.member.MemberDTO;

@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace= "BookMapper.";
	
	//좋아요 글 리스트//
	public List<BookDTO> myBookList(String id) throws Exception {
		System.out.println("dao에서 id 는 : " +id);
		return sqlSession.selectList(namespace+"myBookList", id);
	}
	

	
	
	
	
	
	
	
}
