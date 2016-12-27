package com.choa.proxyProject;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.choa.book.BookDTO;
import com.choa.book.BookPictureDTO;
import com.choa.book.BookService;
import com.choa.deal.DealService;
import com.choa.member.MemberLikeBooksDTO;
import com.choa.util.PageMaker;


@Controller
@RequestMapping(value="/sellBook")
public class SellBookController {
	
	@Autowired
	private BookService bookService;
	@Autowired
	private DealService dealService;
	
	//sellBookList search
	@RequestMapping(value="/sellBookSearch")
	public String sellBookListS(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20")int perPage, @RequestParam String search, @RequestParam String id,Model model){
	  try {	
		  bookService.myHeart(id, model);
		 bookService.sellBookSearch(curPage, perPage, search, model);
		 dealService.dealNumBook(model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookSearch";
	}
	
	
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
	public String sellBookWrite(BookDTO bookDTO, BookPictureDTO bookPictureDTO, MultipartRequest mr, HttpSession session, Model model){
		
		int result = 0;
		String message = "";
		try {
			result = bookService.sellBookWrite(bookDTO, bookPictureDTO,mr, session);
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
		model.addAttribute("message", message);
		return "sellBook/sellBookList";
	}

	@RequestMapping(value="/sellBookView")
	public String sellBookView(@RequestParam int num, @RequestParam String id, Model model){
		try {
			bookService.myHeart(id, model);
			bookService.sellBookView(num, id, model);
		
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return "sellBook/sellBookView";
	}
	
	@RequestMapping(value="/sellBookList")
	public String sellBookList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20")int perPage, @RequestParam String id, Model model){
	  try {
		bookService.myHeart(id, model);
		bookService.sellBookList(curPage, perPage, model);
	/*	dealService.manageDeal(model);*/
		dealService.dealNumBook(model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookList";
	}
	@RequestMapping(value="/sellBookList2")
	public String sellBookList2(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20")int perPage, @RequestParam String id, Model model){
	  try {
		  bookService.myHeart(id, model);
		bookService.sellBookList2(curPage, perPage, model);
		dealService.dealNumBook(model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookList2";
	}
	@RequestMapping(value="/sellBookList3")
	public String sellBookList3(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20")int perPage, @RequestParam String id, Model model){
	  try {
		  bookService.myHeart(id, model);
		bookService.sellBookList3(curPage, perPage, model);
		dealService.dealNumBook(model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookList3";
	}
	@RequestMapping(value="/sellBookList4")
	public String sellBookList4(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20")int perPage, @RequestParam String id, Model model){
	  try {
		  bookService.myHeart(id, model);
		bookService.sellBookList4(curPage, perPage, model);
		dealService.dealNumBook(model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookList4";
	}
	@RequestMapping(value="/sellBookList5")
	public String sellBookList5(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="20")int perPage,@RequestParam String id, Model model){
	  try {
		  bookService.myHeart(id, model);
		bookService.sellBookList5(curPage, perPage, model);
		dealService.dealNumBook(model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return "sellBook/sellBookList5";
	}
	
}
