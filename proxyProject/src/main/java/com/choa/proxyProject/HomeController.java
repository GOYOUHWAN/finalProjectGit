package com.choa.proxyProject;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.book.BookDTO;
import com.choa.book.BookService;
import com.choa.member.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private BookService bookService;
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		try {
			 bookService.BookLikes(model);
			 memberService.trust(model);
			 /*memberService.buyerTrust(model);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "index";
		
	}
	@RequestMapping(value="/test")
	public void test(){}
	
	
	@RequestMapping(value="/index")
	public void goindex(){}
	
	//로그아웃
		@RequestMapping(value="/memberLogout")
		public String memberLogout(HttpSession session){
			session.invalidate();
			return "index";
		}
		
}


