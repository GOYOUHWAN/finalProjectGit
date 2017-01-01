package com.choa.proxyProject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.book.BookDAO;
import com.choa.book.BookDTO;
import com.choa.book.BookService;
import com.choa.deal.DealDTO;
import com.choa.deal.DealService;
import com.choa.deposit.DepositDAO;
import com.choa.deposit.DepositDTO;
import com.choa.freeboard.FreeboardDAO;
import com.choa.freeboard.FreeboardDTO;


@Controller
@RequestMapping("/deposit")
public class DepositController {

/*	
	@Autowired
	   private SqlSession sqlSession;
	@Autowired
		private BookService bookService; 
	@Autowired
		private DealService dealService;
	
	 //  글쓰기폼
	   @RequestMapping("/depositWriteForm")
	   public String depositWriteForm(@RequestParam int num){
		   System.out.println("여기 걸리나?");
	      return "depositWrite";
	   }
	   
	   //  글쓰기   
	   @RequestMapping("/depositWrite")
	   public String depositWrite(DepositDTO dto, DealDTO dealDTO, Model model){
		   System.out.println("여기로 들어오는가");
		   DepositDAO dao = sqlSession.getMapper(DepositDAO.class);
		   dao.depositWrite(dto);
		   try {
			   System.out.println(dto.getNum());
			bookService.statusDeposit(dto.getNum());
			dealService.insertDeal(dealDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		   return "redirect:depositResult";
	   }
*/
}
