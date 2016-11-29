package com.choa.book;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class BookService {

	@Autowired
	private BookDAO bookDAO;
	

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
