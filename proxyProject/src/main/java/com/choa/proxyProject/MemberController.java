package com.choa.proxyProject;

import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.choa.book.BookDTO;
import com.choa.book.BookService;
import com.choa.freeboard.FreeboardService;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;
import com.choa.member.ApproveDTO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	

   @Autowired
   private MemberService memberService;
   @Autowired
   private BookService bookService;
   
   @ResponseBody
   @RequestMapping(value="/buyer/confirm")
   public void confirm(@RequestParam int num){
	   try {
		bookService.confirm(num);
	} catch (Exception e) {
		e.printStackTrace();
	}
   }
   
   @ResponseBody
	@RequestMapping(value="/seller/delivery")
	public void delivery(@RequestParam int num){
	   try {
			bookService.delivery(num );
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
   
   
   
   
   //Manager=======================================================
   //관리자페이지
   @RequestMapping(value="/manager/manageMember")
   public void myPageM(){}
   
   @Autowired
   private FreeboardService freeboardService;

   

   
   @RequestMapping(value = "/manager/manageSeller")
   public String sellerInfo(@RequestParam(defaultValue = "1") int curPage,
         @RequestParam(defaultValue = "10") int perPage, Model model) {
      try {
         memberService.memberInfo(curPage, perPage, model,2);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "member/manager/manageSeller";
   }

	//블랙리스트
	@RequestMapping(value ="/manager/manageBlacklist")
	public String memberInfo(@RequestParam(defaultValue = "1") int curPage,
		@RequestParam(defaultValue = 
		"10") int perPage, Model model,@RequestParam(defaultValue = "4") int type) {
		try {
			memberService.memberInfo(curPage, perPage, model, type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/member/manager/manageBlacklist";
	}
	//신고글리스트
	@RequestMapping(value ="/manager/manageSingolist")
	public String manageSingolist(@RequestParam(defaultValue = "1") int curPage,
		@RequestParam(defaultValue = 
		"10") int perPage, Model model) {
		try {
			memberService.manageSingolist(curPage, perPage, model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/member/manager/manageSingolist";
	}

   
   

   // buyer 용
   // ==================================================================
   @RequestMapping(value = "/buyer/myPage")
   public void myPageB() {
   }

   @RequestMapping(value = "/buyer/myBoardList")
   public String myBoardListB(@RequestParam String id, Model model) {
      try {
         freeboardService.myBoardList(id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/member/buyer/myBoardList";
   }

   @RequestMapping(value = "/buyer/myBuyList")
   public String myBuyListB(@RequestParam String id, Model model) {
      try {
         bookService.myBuyList(id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/member/buyer/myBuyList";
   }

   @RequestMapping(value = "/buyer/myBookList")
   public String myBookListB(@RequestParam String id, Model model) {
      try {
         bookService.myBookList(id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }

      return "/member/buyer/myBookList";
   }


   //구매자->판매자로 신청form
   @RequestMapping(value="/buyer/buyerUpgrade", method=RequestMethod.GET)
   public void buyerUpgrade(){}
   
   @RequestMapping(value="/buyer/buyerUpgrade", method=RequestMethod.POST)
   public void buyerUpgrade(ApproveDTO approveDTO, MultipartRequest mr, HttpSession session, Model model){
	   int result = 0;
	   try {
		result = memberService.approve(approveDTO, mr, session);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
   }

   // =========================================================
   @RequestMapping(value = "/seller/myBoardList")
   public String myBoardListS(@RequestParam String id, Model model) {
      try {
         freeboardService.myBoardList(id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/member/seller/myBoardList";
   }

   @RequestMapping(value="/seller/mySellList")
   public String mySellList(@RequestParam String id, Model model ){
	   try {
		bookService.mySellList(id, model);
	} catch (Exception e) {
		e.printStackTrace();
	}
	   return "/member/seller/mySellList";
   }

   @RequestMapping(value="/seller/myPage")
   public void myPageS(){}
   
   
   @RequestMapping(value="/seller/myBuyList")
   public String myBuyListS(@RequestParam String id, Model model){

      try {
         bookService.myBuyList(id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/member/seller/myBuyList";
   }

   @RequestMapping(value = "/seller/myBookList")
   public String myBookListS(@RequestParam String id, Model model) {
      try {
         bookService.myBookList(id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/member/seller/myBookList";
   }



   @RequestMapping(value="/buyer/depositWrite")
   public String deposit(@RequestParam int num, String id,  Model model){

      try {
         bookService.deposit(num, id, model);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/member/buyer/depositWrite";
   }
   
   // ============================================================



   // MEMBER============================================================
   
   
   //ID찾기
   @RequestMapping(value="findID", method=RequestMethod.GET)
   public void findID(){}
   //ID찾기
   @RequestMapping(value="findID", method=RequestMethod.POST)
   public String findID(@RequestParam String tel,@RequestParam String pFirst,@RequestParam String pSecond,@RequestParam String pThird, 
		   @RequestParam String email_1, @RequestParam String email_2, @RequestParam int ch, Model model){
	   String find = "";
	   String page = "";
	   if(pThird!=null){
		   find = "["+tel+"]"+pFirst+"-"+pSecond+"-"+ pThird;
		   find = find.replace(",","");
	   }else{
		   find = email_1+"@"+email_2;
		   find = find.replace(",","");
	   }
	   
	   try {
		memberService.findID(find, model);
	} catch (Exception e) {
		e.printStackTrace();
	}
	   if(ch=='1'){
		   page = "member/findIDResult";
	   }else{
		   page = "member/findPWResult";
	   }
	  return page;
   }
   
   //ID찾기결과
   @RequestMapping(value="findIDResult", method=RequestMethod.GET)
   public void findIDResult(){}
   //PW찾기
   @RequestMapping(value="findPW", method=RequestMethod.GET)
   public void findPW(){}
   //PW찾기결과
   @RequestMapping(value="findPWResult", method=RequestMethod.POST)
   public String findPWResult(@RequestParam String id, @RequestParam String pw, Model model, HttpServletResponse response )throws Exception{
	   int result = 0;
	   String message= "";
	   response.setContentType("text/html;charset=UTF-8");
		   PrintWriter writer = response.getWriter();
		  result = memberService.updatePW(id, pw);
		  if(result>0){
			   message = "수정완료";
		   }else{
			   message="수정실패";
		   }
		  model.addAttribute("message", message);
		  writer.println("<script type='text/javascript'>");
		  writer.println("alert('안녕'); </script>");
	
	   return "redirect:/";
   }
   // ID중복체크
   @ResponseBody
   @RequestMapping(value = "checkID2", method = RequestMethod.POST)
   public HashMap<String, Object> checkId(@RequestParam HashMap<String, Object> param, @RequestParam String id) {
      int result = 0;
      String res = "";
      try {
         result = memberService.checkid(id);
      } catch (Exception e) {
         e.printStackTrace();
      }
      HashMap<String, Object> hashmap = new HashMap<String, Object>();
      if (result > 0) {
         res = "이미있는 id입니다.";
      } else {
         res = "사용가능한 id입니다.";
      }
      hashmap.put("KEY", res);
      return hashmap;
   }

   // 회원가입view
   @RequestMapping(value = "/memberJoin", method = RequestMethod.GET)
   public void memberJoin() {
   }

   // 회원가입
   @RequestMapping(value = "/memberJoin", produces = "application/json; charset=utf-8")
   public void memberJoin(MemberDTO memberDTO, HttpServletResponse response) throws Exception {
      int result = 0;
      String message = "";
      PrintWriter writer = response.getWriter();
      result = memberService.memberJoin(memberDTO);
      if (result > 0) {
         message = "가입되었습니다.";
      } else {
         message = "가입실패";
      }
      writer.println("<script>alert('" + message + "'); </script>");
   }

   // 로그인 view
   @RequestMapping(value = "/memberLogin", method = RequestMethod.GET)
   public void memberLogin() {
   }

   // 로그인
   @RequestMapping(value = "/memberLogin", produces = "application/json; charset=utf-8")
   public void memberLogin(MemberDTO memberDTO, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      memberDTO = memberService.memberLogin(memberDTO);
      session.setAttribute("member", memberDTO);
      chmember(memberDTO);
      PrintWriter writer = response.getWriter();
      writer.println("<script>location.href='../';</script>");
   }
   
   //회원 체크
   private MemberDTO chmember(MemberDTO memberDTO){
	   return memberDTO;
   }
   
   // 회원정보view
   @RequestMapping(value = "/memberView", method = RequestMethod.GET)
   public void memberView() { 
   }

   // 회원수정view
   @RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
   public void memberUpdate() {
   }

   // 회원수정
   @RequestMapping(value = "/memberUpdate", produces = "application/json; charset=utf-8")
   public void memberUpdate(MemberDTO memberDTO, HttpServletResponse response) throws Exception {
      String message = "";
      int result = memberService.memberUpdate(memberDTO);
      PrintWriter writer = response.getWriter();
      if (result > 0) {
         message = "수정되었습니다.";
      } else {
         message = "수정실패";
      }
      writer.println("<script>alert('" + message + "'); </script>");
   }

   // 회원탈퇴
   @RequestMapping(value = "/memberDelete", method = { RequestMethod.GET, RequestMethod.POST })
   public void memberDelete(String id, HttpServletResponse response, HttpServletRequest request, Model model)
         throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      int result = memberService.memberDelete(id);
      System.out.println("result : " + result + "/" + id);
      PrintWriter writer = response.getWriter();
      String message = "";
      if (result > 0) {
         message = "탈퇴되었습니다.<br>이용해주셔서 감사합니다.";

      } else {
         message = "ERROR";
      }
      model.addAttribute("message", message);
      writer.println("<script>alert('" + message + "'); </script>");
      writer.println("<script>location.href='../';</script>");
   }
}