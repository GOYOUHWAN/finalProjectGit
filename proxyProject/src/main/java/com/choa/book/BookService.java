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
		
		System.out.println("service에서 id 는 : " + id);
		model.addAttribute("booklist", ar);
		return ar;
	}
	
}
