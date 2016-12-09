package com.choa.book;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.member.MemberDTO;
import com.choa.util.PageMaker;



@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace= "BookMapper.";
	
	//판매도서 등록. 이미지파일 같이 등록.
	public int sellBookWrite(BookDTO bookDTO, BookPictureDTO bookPictureDTO) throws Exception{
		int result = 0;
		result = sqlSession.insert(namespace+"sellBookfile", bookPictureDTO);
		result = result + sqlSession.insert(namespace+"sellBookWrite", bookDTO);
		return result;
	}
	
	//sellBookView
	public BookDTO sellBookView(int num) throws Exception{
		return sqlSession.selectOne(namespace+"sellBookView", num);
	}
	//sellBookViewFiles   <=  파는 책의 사진꺼내기
	public BookPictureDTO sellBookPicture(int num) throws Exception{
		return sqlSession.selectOne(namespace+"sellBookViewFiles", num);
	}
	//sellBookViewMember  <=파는 책의 사람정보 꺼내기
	public MemberDTO sellBookViewMember(String id)throws Exception{
		return sqlSession.selectOne(namespace+"sellBookViewMember", id);
	}
	
	//좋아요 글 리스트//
	public List<BookDTO> myBookList(String id) throws Exception {
		return sqlSession.selectList(namespace+"myBookList", id);
	}
	
	//내가 산 책 리스트
	public List<BookDTO> myBuyList(String id) throws Exception {
		return sqlSession.selectList(namespace+"myBuyList", id);
	}
	
	//구매하기
		public List<BookDTO> deposit(String id) throws Exception {
			return sqlSession.selectList(namespace+"deposit", id);
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
