package com.choa.inter;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.choa.member.MemberDTO;

public class LoginInterCeptor extends HandlerInterceptorAdapter {
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Map<String, Object> mp= modelAndView.getModel();
		MemberDTO memberDTO = (MemberDTO)mp.get("member");
		if(memberDTO != null){
			request.getSession().setAttribute("member", memberDTO);
		}
		System.out.println("현재 자신의 절대 경로 : "+this.getClass().getResource("").getPath()); // 현재 자신의 절대 경로
		
	}


}
