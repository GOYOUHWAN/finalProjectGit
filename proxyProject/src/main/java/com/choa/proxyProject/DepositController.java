package com.choa.proxyProject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.book.BookDAO;
import com.choa.book.BookDTO;
import com.choa.book.BookService;
import com.choa.deposit.DepositDAO;
import com.choa.deposit.DepositDTO;
import com.choa.freeboard.FreeboardDAO;
import com.choa.freeboard.FreeboardDTO;


@Controller
@RequestMapping("/deposit")
public class DepositController {

	
	@Autowired
	   private SqlSession sqlSession;
	@Autowired
		private BookService bookService; 
	
	 //  글쓰기폼
	   @RequestMapping("/DepositWriteForm")
	   public String depositWriteForm(){
	      
	      return "buyer/deposit";
	   }
	   
	   //  글쓰기   
	   @RequestMapping("/DepositWrite")
	   public String depositWrite(DepositDTO dto, Model model){
		   DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		   dao.depositWrite(dto);
		   try {
			   System.out.println(dto.getNum());
			bookService.statusDeposit(dto.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		   return "redirect:depositResult";
	   }

}
