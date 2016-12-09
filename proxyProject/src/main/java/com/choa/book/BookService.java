package com.choa.book;


import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.member.MemberDTO;
import com.choa.member.MemberLikeBooksDTO;
import com.choa.util.PageMaker;


@Service
public class BookService {

	@Autowired
	private BookDAO bookDAO;

	//까망 하트 눌렀을때(mlb에 id랑 num으로 한줄 삽입 / book에 likes 하나 더하기)
	public void changeLikesBlack(MemberLikeBooksDTO mlbDTO)throws Exception{
		bookDAO.changeLikesAdd(mlbDTO.getNum());
		bookDAO.insertMLB(mlbDTO);
	}
	
	//빨강 하트 눌렀을때(mlb에 id랑 num으로 한줄 삭제 / book에 likes 하나 빼기)
	public void changeLikesRed(MemberLikeBooksDTO mlbDTO)throws Exception{
		bookDAO.changeLikesDelete(mlbDTO.getNum());
		bookDAO.deleteMLB(mlbDTO);
	}
	

	//판매도서등록
	public int sellBookWrite(BookDTO bookDTO, BookPictureDTO bookPictureDTO, Model model) throws Exception{
		System.out.println("bookservice");
		System.out.println(bookPictureDTO.getFiles1()+bookPictureDTO.getFiles2()+bookPictureDTO.getFiles3()+bookPictureDTO.getFiles4());
		return bookDAO.sellBookWrite(bookDTO, bookPictureDTO);
	}
	
	public BookDTO sellBookView(int num, String id, Model model) throws Exception{
		
		BookDTO bookDTO = bookDAO.sellBookView(num);
		BookPictureDTO bookPictureDTO = bookDAO.sellBookPicture(num);
		MemberDTO memberDTO = bookDAO.sellBookViewMember(id);
		model.addAttribute("view", bookDTO);
		model.addAttribute("viewPicture", bookPictureDTO);
		model.addAttribute("viewMember", memberDTO);
		return bookDTO;
	}
	
	public List<BookDTO> sellBookList(int curPage, int perPage, Model model)throws Exception{
	
			int totalCount = bookDAO.bookCount();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCurPage(curPage);
			pageMaker.setPerPage(perPage);
			pageMaker.makeRow();//startRow & lastRow
			pageMaker.makePage(totalCount);
			
			List<BookDTO> ar = bookDAO.sellBookList(pageMaker);
			model.addAttribute("list", ar);
			model.addAttribute("listsize", ar.size());
			model.addAttribute("paging", pageMaker);
			model.addAttribute("check", true);
			return ar;
		}	
	

	public List<BookDTO> myBookList(String id, Model model)throws Exception{
		List<BookDTO> ar = bookDAO.myBookList(id);
		model.addAttribute("booklist", ar);
		return ar;
	}
	
	public List<BookDTO> myBuyList(String id, Model model)throws Exception{
		List<BookDTO> ar = bookDAO.myBuyList(id);
		model.addAttribute("buylist", ar);
		return ar;
	}
	
	//구매
	public List<BookDTO> deposit(int num, String id, Model model)throws Exception{
		BookPictureDTO bookPictureDTO = bookDAO.sellBookPicture(num);
		List<BookDTO> ar = bookDAO.deposit(id);
		BookDTO bookDTO = bookDAO.sellBookView(num);
		model.addAttribute("viewPicture", bookPictureDTO);
		model.addAttribute("view", bookDTO);
		model.addAttribute("deposit", ar);
		return ar;
	}
	
}
