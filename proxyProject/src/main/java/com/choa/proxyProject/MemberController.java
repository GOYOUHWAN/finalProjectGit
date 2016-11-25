package com.choa.proxyProject;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.freeboard.FreeboardService;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Inject
	private FreeboardService freeboardService;
	
	//my페이지 관련-----------------------------------

	@RequestMapping(value="/seller/myBookList", method=RequestMethod.GET)
	public String myBookList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		try {
			freeboardService.myBookList(curPage, perPage, model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/seller/myBookList";
	}
	
	@RequestMapping(value="/seller/myPage1", method=RequestMethod.GET)
	public void myPage(){
		
	}
	//--------------------------------------------------------------------------------------
	
	
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
			message="ȸ�� ���� ����";
		}else {
			path="redirect:/";
			message="ȸ�� ���� ����";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.GET)
	public void memberLogin(){}
	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, Model model, HttpSession session){
		
		try {
			memberDTO=memberService.memberLogin(memberDTO);		
		} catch (Exception e) {
			memberDTO= null;	
			e.printStackTrace();
		}
		model.addAttribute("member", memberDTO);
		session.setAttribute("member", memberDTO);
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
}
