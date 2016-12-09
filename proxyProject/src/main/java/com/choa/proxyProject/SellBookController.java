package com.choa.proxyProject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.book.BookDTO;
import com.choa.book.BookPictureDTO;
import com.choa.book.BookService;
import com.choa.member.MemberLikeBooksDTO;


@Controller
@RequestMapping(value="/sellBook")
public class SellBookController {
	
	@Autowired
	private BookService bookService;
	
	//likes 수 올리기 (하트 모양 바뀌면서)
/*	@RequestMapping(value = "/memberJoin", produces = "application/json; charset=utf-8")*/
	@ResponseBody
	@RequestMapping(value="/changeLikesBlack", produces = "application/json; charset=utf-8"/*method=RequestMethod.POST*/)
	public BookDTO changeLikesBlack(MemberLikeBooksDTO mlbDTO, Model model){
		BookDTO bookDTO = null;
		try {
				bookService.changeLikesBlack(mlbDTO);
				bookDTO = bookService.sellBookView(mlbDTO.getNum(), mlbDTO.getId(), model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("컨트롤러");
		return bookDTO;
		
	}
	//likes 수 -1 하기
	@ResponseBody
	@RequestMapping(value="/changeLikesRed", produces = "application/json; charset=utf-8"/*method=RequestMethod.POST*/)
	public BookDTO changeLikesRed(MemberLikeBooksDTO mlbDTO, Model model){
		BookDTO bookDTO = null;
		try {
				bookService.changeLikesRed(mlbDTO);
				bookDTO = bookService.sellBookView(mlbDTO.getNum(), mlbDTO.getId(), model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bookDTO;
	}
	
	//도서 등록 폼
	@RequestMapping(value="/sellBookWrite", method = RequestMethod.GET)
	public void sellBookWrite(){}
	
	//판매도서 등록
	@RequestMapping(value="/sellBookWrite", method = RequestMethod.POST)
	public void sellBookWrite(BookDTO bookDTO, BookPictureDTO bookPictureDTO, Model model){
		System.out.println("sellbookController");
		int result = 0;
		String message = "";
		try {
			result = bookService.sellBookWrite(bookDTO, bookPictureDTO, model);
			System.out.println(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="판매도서 등록성공";
		}else{
			message="판매도서 등록실패";
		}
		System.out.println(message);
	}

	@RequestMapping(value="/sellBookView")
	public String sellBookView(@RequestParam int num, @RequestParam String id, Model model){
		try {
			bookService.sellBookView(num, id, model);
		
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return "sellBook/sellBookView";
	}
	
	@RequestMapping(value="/sellBookList")
	public String sellBookList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10")int perPage, Model model){
	  try {
		bookService.sellBookList(curPage, perPage, model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookList";
	}
	
	
	
}
