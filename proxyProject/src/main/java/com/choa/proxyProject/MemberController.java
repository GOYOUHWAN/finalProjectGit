package com.choa.proxyProject;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.book.BookDTO;
import com.choa.book.BookService;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;


@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BookService bookService;
	

	@RequestMapping(value="/buyer/myBookList")
	public String myBookList(@RequestParam String id, Model model){
			try {
				bookService.myBookList(id, model);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("id는 " +id);
			
		return "/member/buyer/myBookList";
	}
	
	@ResponseBody
	@RequestMapping(value = "checkID2", method = RequestMethod.POST)
	public HashMap<String, Object> checkId(@RequestParam HashMap<String, Object> param, @RequestParam String id) {
	     
	    System.out.println(param);
	    System.out.println("id is "+param.get("id"));
	 
	    //your logic
	    int result=0;
	    String res="";
	    try {
			result = memberService.checkid(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    HashMap<String, Object> hashmap = new HashMap<String, Object>();
	    if(result>0){
	    	res="이미있는 id입니다.";
	    }else{
	    	res="사용가능한 id입니다.";
	    }
	    hashmap.put("KEY", res);
	    
	    return hashmap;
	}
	//회원가입view
	@RequestMapping(value="/memberJoin", method=RequestMethod.GET)
	public void memberJoin(){}
	//회원가입
	@RequestMapping(value="/memberJoin", produces="application/json; charset=utf-8")
	public String memberJoin(MemberDTO memberDTO, RedirectAttributes rd){
		int result=0;
		String path="";
		String message="";
		try {
			result =memberService.memberJoin(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			path="redirect:/";
			message="가입성공";
		}else {
			path="redirect:/";
			message="가입실패";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.GET)
	public void memberLogin(){}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, Model model){
		System.out.println(memberDTO.getId()+"/"+memberDTO.getPw());
		try {
			memberDTO=memberService.memberLogin(memberDTO);	
			System.out.println("로그인성공");
			
		} catch (Exception e) {
			memberDTO= null;	
			System.out.println("로그인실패");
			e.printStackTrace();
		}

		return "redirect:/";
		
	}
	
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
}
