package com.choa.proxyProject;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.member.MemberDTO;
import com.choa.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//id중복확인
	@RequestMapping(value="/checkID", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> checkid(@RequestParam String id){
		int result = 0;
		String message="이미 있는 ID입니다.";
		try {
			result = memberService.checkid(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="이미 있는 ID입니다.";
		}else{
			message="사용가능한 ID입니다.";
		}
		System.out.println("컨트롤러 : "+message);
		return new ResponseEntity<String>(message, HttpStatus.OK);
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
		model.addAttribute("member", memberDTO);
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
}
