package com.choa.proxyProject;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.book.BookService;


@Controller
@RequestMapping(value="/sellBook")
public class SellBookController {
	
	@Autowired
	private BookService bookService;

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
