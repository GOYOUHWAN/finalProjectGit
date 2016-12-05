package com.choa.proxyProject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.book.BookService;


@Controller
@RequestMapping(value="/sellBook")
public class SellBookController {
	
	@Autowired
	private BookService bookService;
	
	//도서 등록 폼
	@RequestMapping(value="/sellBookWrite", method = RequestMethod.GET)
	public void sellBookWrite(){}

	@RequestMapping(value="/sellBookView")
	public String sellBookView(@RequestParam int num, Model model){
		try {
			bookService.sellBookView(num, model);
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
