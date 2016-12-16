package com.choa.proxyProject;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.blackList.BlackDTO;
import com.choa.blackList.BlackService;
import com.choa.freeboard.FreeboardDAO;
import com.choa.freeboard.FreeboardDTO;
import com.choa.member.MemberDTO;

@Controller
@RequestMapping(value="/blackList")
public class BlackListController {
	@Autowired
	private BlackService blackService;
	
	@RequestMapping(value="/singoForm")
	public void singoForm(){}
	
	//신고 글 작성
	@RequestMapping(value="/singoWrite", method=RequestMethod.POST)
	public String singowrite(BlackDTO blackDTO, RedirectAttributes rd){
		int result=0;
		String path="";
		String message="";
		try {
			result = blackService.singoWrite(blackDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			path="redirect:/blackList/blackListForm";
			message="신고가 접수되었습니다.";
		}else {
			path="redirect:/blackList/blackListForm";
			message="신고 접수 실패";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	//블랙리스트
	@RequestMapping(value ="/blackListForm")
	public String memberInfo(@RequestParam(defaultValue = "1") int curPage,
		@RequestParam(defaultValue = 
		"10") int perPage, Model model,@RequestParam(defaultValue = "4") int type) {
		try {
			blackService.memberInfo(curPage, perPage, model, type);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/blackList/blackListForm";
	}
	//신고 글 보기
   @RequestMapping("/singoView")
   public String singoView(Model model,@RequestParam String sid){
	   try {
		blackService.singoView(sid, model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      return "blackList/singoView";
   }
   //블랙회원 정보보기
   @RequestMapping("/blackmView")
   public String blackmView(Model model,@RequestParam String id){
	   try {
		blackService.blackmView(id, model);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      return "blackList/blackmView";
   }
   // 회원수정view
   @RequestMapping(value = "/blackmUpdate", method = RequestMethod.GET)
   public void memberUpdate() {
   }

   // 회원수정
   @RequestMapping(value = "/blackmUpdate", produces = "application/json; charset=utf-8")
   public void memberUpdate(MemberDTO memberDTO, HttpServletResponse response) throws Exception {
      String message = "";
      int result = blackService.blackmUpdate(memberDTO);
      PrintWriter writer = response.getWriter();
      if (result > 0) {
         message = "수정되었습니다.";
      } else {
         message = "수정실패";
      }
      writer.println("<script>alert('" + message + "'); </script>");
   }
}