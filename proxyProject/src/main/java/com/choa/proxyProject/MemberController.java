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

import com.choa.book.BookService;
import com.choa.freeboard.FreeboardService;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

   @Autowired
   private MemberService memberService;
   @Autowired
   private BookService bookService;
   
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
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "member/manager/manageSeller";
   }
   
   @RequestMapping(value = "/manager/manageBlacklist")
   public String blackInfo(@RequestParam(defaultValue = "1") int curPage,
         @RequestParam(defaultValue = "10") int perPage, Model model) {
      try {
         memberService.memberInfo(curPage, perPage, model,4);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "member/manager/manageBlacklist";
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
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/member/buyer/myBoardList";
   }

   @RequestMapping(value = "/buyer/myBuyList")
   public String myBuyListB(@RequestParam String id, Model model) {
      try {
         bookService.myBuyList(id, model);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/member/buyer/myBuyList";
   }

   @RequestMapping(value = "/buyer/myBookList")
   public String myBookListB(@RequestParam String id, Model model) {
      try {
         bookService.myBookList(id, model);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return "/member/buyer/myBookList";
   }


   // =========================================================
   @RequestMapping(value = "/seller/myBoardList")
   public String myBoardListS(@RequestParam String id, Model model) {
      try {
         freeboardService.myBoardList(id, model);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/member/seller/myBoardList";
   }


   @RequestMapping(value="/seller/myPage")
   public void myPageS(){}
   
   
   @RequestMapping(value="/seller/myBuyList")
   public String myBuyListS(@RequestParam String id, Model model){

      try {
         bookService.myBuyList(id, model);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/member/seller/myBuyList";
   }

   @RequestMapping(value = "/seller/myBookList")
   public String myBookListS(@RequestParam String id, Model model) {
      try {
         bookService.myBookList(id, model);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/member/seller/myBookList";
   }

   @RequestMapping(value="/buyer/deposit")
   public String deposit(@RequestParam int num, String id,  Model model){

      try {
         bookService.deposit(num, id, model);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "/member/buyer/deposit";
   }
   
   // ============================================================
   // ID중복체크
   @ResponseBody
   @RequestMapping(value = "checkID2", method = RequestMethod.POST)
   public HashMap<String, Object> checkId(@RequestParam HashMap<String, Object> param, @RequestParam String id) {
      int result = 0;
      String res = "";
      try {
         result = memberService.checkid(id);
      } catch (Exception e) {
         // TODO Auto-generated catch block
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
   public void memberLogin(MemberDTO memberDTO, HttpSession session, HttpServletResponse response,
         HttpServletRequest request) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      memberDTO = memberService.memberLogin(memberDTO);
      session.setAttribute("member", memberDTO);
      PrintWriter writer = response.getWriter();
      writer.println("<script>location.href='../';</script>");
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
         message = "탈퇴안됨 가지마";
      }
      model.addAttribute("message", message);
      writer.println("<script>alert('" + message + "'); </script>");

   }
}