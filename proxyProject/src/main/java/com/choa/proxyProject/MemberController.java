package com.choa.proxyProject;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.member.MemberDTO;
import com.choa.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/memberJoin", method=RequestMethod.GET)
	public void memberJoin(){}
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, RedirectAttributes rd){
		int result=0;
		String path="";
		String message="";
		try {
			result =memberService.memerberJoin(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			path="redirect:/";
			message="회원 가입 성공";
		}else {
			path="redirect:/";
			message="회원 가입 실패";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.GET)
	public void memberLogin(){}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, Model model){
		
		try {
			memberDTO=memberService.memberLogin(memberDTO);		
		} catch (Exception e) {
			memberDTO= null;	
			e.printStackTrace();
		}
		model.addAttribute("member", memberDTO);
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	

}
