package com.choa.book;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.choa.member.MemberDTO;
import com.choa.member.MemberLikeBooksDTO;
import com.choa.util.PageMaker;


@Service
public class BookService {

	@Autowired
	private BookDAO bookDAO;
	
	public int statusDeposit(int num)throws Exception{
		return bookDAO.statusDeposit(num);
	}
	
	
	//sellBookList에서 하트 검증용
	public List<Integer> myHeart(String id, Model model)throws Exception{
		List<Integer> heart = bookDAO.myHeart(id);
		model.addAttribute("heart", heart);
		model.addAttribute("heartSize", heart.size());
		return heart;
	}
	

	//index에서 좋아요순으로 1~10 보여주기
	public List<BookDTO> BookLikes(Model model)throws Exception{
		List<BookDTO> ar = bookDAO.BookLikes();
		model.addAttribute("bookLikes", ar);
		model.addAttribute("count", 0);
		model.addAttribute("listsize", ar.size());
		return ar;
	}
	
	//search 했을때 list
	public List<BookDTO> sellBookSearch(int curPage, int perPage, String search , Model model)throws Exception{
		  System.out.println("서비스의 서치 : " + search);
		int totalCount = bookDAO.bookCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();//startRow & lastRow
		pageMaker.makePage(totalCount);
		pageMaker.setSearch(search);
		
		List<BookDTO> ar2 = bookDAO.sellBookSearch(pageMaker);
		System.out.println("ar2.size : " + ar2.size());
		
		model.addAttribute("count", 0);
		model.addAttribute("list", ar2);
		model.addAttribute("listsize", ar2.size());
		model.addAttribute("paging", pageMaker);
		model.addAttribute("check", true);
		model.addAttribute("search", search);
		return ar2;
	}	
	
	
	
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
	public int sellBookWrite(BookDTO bookDTO, BookPictureDTO bookPictureDTO,  MultipartRequest mr,HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		List<MultipartFile> files = mr.getFiles("fileName1");
		files.add(mr.getFile("fileName2"));
		files.add(mr.getFile("fileName3"));
		files.add(mr.getFile("fileName4"));
		ArrayList<String> fileNames = new ArrayList<String>();
		for(int i = 0; i<files.size(); i++){
			MultipartFile mf = files.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			File file  = new File(path, fileName);
			mf.transferTo(file);
			fileNames.add(fileName);
		}
		return bookDAO.sellBookWrite(bookDTO, bookPictureDTO, fileNames);
	}
	
	public BookDTO sellBookView(int num, String id, Model model) throws Exception{
		BookDTO bookDTO = bookDAO.sellBookView(num);
		BookPictureDTO bookPictureDTO = bookDAO.sellBookPicture(num);
		MemberDTO memberDTO = bookDAO.sellBookViewMember(id);
		List<Integer> heartV = bookDAO.myHeart(id);
		model.addAttribute("heartV", heartV);
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
			System.out.println("인덱스확인 : " + ar.size());

			
			model.addAttribute("count", 0);
			model.addAttribute("list", ar);
			model.addAttribute("listsize", ar.size());
			model.addAttribute("paging", pageMaker);
			model.addAttribute("check", true);
			return ar;
		}	
	public List<BookDTO> sellBookList2(int curPage, int perPage, Model model)throws Exception{
		
		int totalCount = bookDAO.bookCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();//startRow & lastRow
		pageMaker.makePage(totalCount);
		
		List<BookDTO> ar = bookDAO.sellBookList2(pageMaker);
		model.addAttribute("count", 0);
		model.addAttribute("list2", ar);
		model.addAttribute("listsize2", ar.size());
		model.addAttribute("paging2", pageMaker);
		model.addAttribute("check2", true);
		return ar;
	}	
	public List<BookDTO> sellBookList3(int curPage, int perPage, Model model)throws Exception{
		
		int totalCount = bookDAO.bookCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();//startRow & lastRow
		pageMaker.makePage(totalCount);
		
		List<BookDTO> ar = bookDAO.sellBookList3(pageMaker);
		model.addAttribute("count", 0);
		model.addAttribute("list3", ar);
		model.addAttribute("listsize3", ar.size());
		model.addAttribute("paging3", pageMaker);
		model.addAttribute("check3", true);
		return ar;
	}	
	public List<BookDTO> sellBookList4(int curPage, int perPage, Model model)throws Exception{
		
		int totalCount = bookDAO.bookCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();//startRow & lastRow
		pageMaker.makePage(totalCount);
		
		List<BookDTO> ar = bookDAO.sellBookList4(pageMaker);
		model.addAttribute("count", 0);
		model.addAttribute("list4", ar);
		model.addAttribute("listsize4", ar.size());
		model.addAttribute("paging4", pageMaker);
		model.addAttribute("check4", true);
		return ar;
	}	
	public List<BookDTO> sellBookList5(int curPage, int perPage, Model model)throws Exception{
		
		int totalCount = bookDAO.bookCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();//startRow & lastRow
		pageMaker.makePage(totalCount);
		
		List<BookDTO> ar = bookDAO.sellBookList5(pageMaker);
		model.addAttribute("count", 0);
		model.addAttribute("list5", ar);
		model.addAttribute("listsize5", ar.size());
		model.addAttribute("paging5", pageMaker);
		model.addAttribute("check5", true);
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
