package com.choa.book;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.member.MemberDTO;
import com.choa.member.MemberLikeBooksDTO;
import com.choa.util.PageMaker;



@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace= "BookMapper.";
	
	

	
	//like 하나 더하기
	public int changeLikesAdd(int num)throws Exception{
		int result = 0;
		result = sqlSession.update(namespace+"changeLikesAdd", num);
		return result;
	}
	//like 하나 빼기
	public int changeLikesDelete(int num)throws Exception{
		int result=0;
		result = sqlSession.update(namespace+"changeLikesDelete", num);
		return result;
	}
	//memberLIkeBook 에 한줄 추가하기
	public int insertMLB(MemberLikeBooksDTO mlbDTO)throws Exception{
		int result=0;
		result = sqlSession.insert(namespace+"insertMLB", mlbDTO);
		return result;
	}
	//memberLikeBook에 한줄 삭제하기
	public int deleteMLB(MemberLikeBooksDTO mlbDTO)throws Exception{
		int result = 0;
		result = sqlSession.delete(namespace+"deleteMLB", mlbDTO );
		return result;
	}
	
	
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
	
	//search 했을때 list
	public List<BookDTO> sellBookSearch(PageMaker pageMaker)throws Exception{
		  System.out.println("dao의 서치 : " + pageMaker.getSearch());
		  return sqlSession.selectList(namespace+"sellBookSearch", pageMaker);
	}		
		
	//내가 팔기위해 올려놓은 책 리스트
	public List<BookDTO> sellBookList(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(namespace+"sellBookList", pageMaker);
	}
	//내가 팔기위해 올려놓은 책 리스트  //낮은 가격순
	public List<BookDTO> sellBookList2(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(namespace+"sellBookList2", pageMaker);
	}
	//내가 팔기위해 올려놓은 책 리스트  // 높은 가격순
	public List<BookDTO> sellBookList3(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(namespace+"sellBookList3", pageMaker);
	}
	//내가 팔기위해 올려놓은 책 리스트  //최신순
	public List<BookDTO> sellBookList4(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(namespace+"sellBookList4", pageMaker);
	}	//내가 팔기위해 올려놓은 책 리스트  //좋아요순
	public List<BookDTO> sellBookList5(PageMaker pageMaker)throws Exception{
		return sqlSession.selectList(namespace+"sellBookList5", pageMaker);
	}
	
	//book 카운트
	public int bookCount() throws Exception {
		return sqlSession.selectOne(namespace+"bookCount");
	}
	
	
	
	
	
}
