package com.choa.proxyProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.choa.member.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void memberJoin(){}
	

}
