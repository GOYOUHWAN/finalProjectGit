package com.choa.proxyProject;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.freeboard.FreeboardAnswerDAO;
import com.choa.freeboard.FreeboardAnswerDTO;
import com.choa.freeboard.FreeboardDAO;
import com.choa.freeboard.FreeboardDTO;
import com.choa.util.Const;
import com.choa.util.PageVo;
import com.choa.util.PhotoVo;


@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
   DataSource dataSource;
   private final int LINE_PER_PAGE = 10;
   
   @Autowired
   private SqlSession sqlSession;
      
   @RequestMapping("/file_uploader")   // 스마트에디터를 위한것?
   public String fileUploader(HttpServletRequest request, PhotoVo vo){
      String callback = vo.getCallback();
      System.out.println("callback : "+ callback);
      String callback_func = vo.getCallback_func();
      String file_result = "";
      try{
         if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
            String original_name = vo.getFiledata().getOriginalFilename();
            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
            String defaultPath =  request.getSession().getServletContext().getRealPath("/");
            String path = defaultPath + "resources" + File.separator + "upload" + File.separator;
            File file1 = new File(path);
            System.out.println("path : " + path);
            if(!file1.exists()){
               file1.mkdirs();
            }
            String realname = UUID.randomUUID().toString() + "." + ext;
            vo.getFiledata().transferTo(new File(path + realname));
            file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/proxyProject/resources/upload/" + realname;         
         }else{
            file_result += "&errstr=error";
         }
      }catch(Exception e){
         e.printStackTrace();
      }
      System.out.println("redirect:" + callback + "?callback_func=" + callback_func + file_result);
      return "redirect:" + callback + "?callback_func=" +callback_func + file_result;
   }
   
   
   
   
   
   
   
   
   //  PAGING
   @RequestMapping("/freList")
   public String selectfreList(Model model, @RequestParam(value = "page", defaultValue = "1")int page){
	   FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
      int totalCount = dao.selectTotalCount();
      PageVo p = new PageVo(page, 10, totalCount);
      List<FreeboardDTO> list = dao.freList(p);
      
      model.addAttribute("freList", list);
      model.addAttribute("page", p);
      return "freeboard/freList";
   }
   
   //  게시물 답변폼
   @RequestMapping("/freAnswerForm")
   public String freAnswerForm(){
	      
	   return "freeboard/freAnswer";
   }
   //  게시물 답변쓰기
   @RequestMapping("/freAnswer")
   public String freAnswerWrite(FreeboardAnswerDTO dto, Model model){
	   FreeboardAnswerDAO dao = sqlSession.getMapper(FreeboardAnswerDAO.class);
	   dao.freAnswerWrite(dto);
	   return "redirect:freList";
   }
   //  글쓰기폼
   @RequestMapping("/freWriteForm")
   public String freWriteForm(){
      
      return "freeboard/freWrite";
   }
   
   //  글쓰기   
   @RequestMapping("/freWrite")
   public String freWrite(FreeboardDTO dto, Model model){
	   FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
	   dao.freWrite(dto);
	   
	   return "redirect:freList";
   }
   //  게시물 보기 
   @RequestMapping("/freView")
   public String freView(HttpServletRequest request, Model model){
	   FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
	   FreeboardDTO dto = dao.freView(Integer.parseInt(request.getParameter("no")));
      model.addAttribute("dto",dto);
      
      return "freeboard/freView";
   }
   //  게시물 수정
   @RequestMapping("/freModify")
   public String freModify(FreeboardDTO dto, Model model){
	   FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
      dao.freModify(dto);
      return "redirect:freList";
   }
   
   //  게시물 수정폼?
   @RequestMapping("/freModifyForm")
   public String freModifyForm(HttpServletRequest request, Model model){
	   FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
	   FreeboardDTO dto = dao.freView(Integer.parseInt(request.getParameter("no")));
      model.addAttribute("dto", dto);
      
      return "freeboard/freModify";
   }
   
   //  게시물 삭제하기
   @RequestMapping("/freDelete")
   public String freDelete(@RequestParam("no")int no, Model model){
	   FreeboardDAO dao = sqlSession.getMapper(FreeboardDAO.class);
      dao.freDelete(no);
      return "redirect:freList";
   }
   
   
}