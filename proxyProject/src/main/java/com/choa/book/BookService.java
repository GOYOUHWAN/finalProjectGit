package com.choa.book;


import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.member.MemberDTO;

import com.choa.util.PageMaker;

@Service
public class BookService {

	@Autowired
	private BookDAO bookDAO;
	
/*	public void myBookView()throws Exception{
		
	}*/
	public List<BookDTO> myBookList(String id, Model model)throws Exception{
	
/*		int totalCount = bookDAO.Count();*/
/*		PageMaker pageMaker = new PageMaker();*/
		/*pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);*/
/*		pageMaker.makeRow();//startRow & lastRow
		pageMaker.makePage(totalCount);*/
		List<BookDTO> ar = bookDAO.myBookList(id);
		model.addAttribute("booklist", ar);
		return ar;

	}
	
}
