package com.choa.book;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.util.PageMaker;


@Service
public class BookService {

	@Autowired
	private BookDAO bookDAO;
	
	
	public BookDTO sellBookView(int num, Model model) throws Exception{
		BookDTO bookDTO = bookDAO.sellBookView(num);
		model.addAttribute("view", bookDTO);
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
	
}
