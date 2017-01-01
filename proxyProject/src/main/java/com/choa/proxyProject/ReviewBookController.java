package com.choa.proxyProject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.reviewBook.ReviewBookDAO;
import com.choa.reviewBook.ReviewBookDTO;



@Controller
@RequestMapping("/reviewBook")
public class ReviewBookController {

	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 리스트
	@RequestMapping("/reviewBookList")
	public @ResponseBody List<ReviewBookDTO> reviewBookList(HttpServletRequest request, Model model){
		ReviewBookDTO dto = new ReviewBookDTO();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		ReviewBookDAO dao = sqlSession.getMapper(ReviewBookDAO.class);
		List<ReviewBookDTO> ar = dao.reviewBookList(dto);
		return ar;
	}
	// 댓글 수정
	@RequestMapping("/reviewBookModify")
	public @ResponseBody void reviewBookModify(HttpServletRequest request, Model model){
		ReviewBookDTO dto = new ReviewBookDTO();
		ReviewBookDAO dao = sqlSession.getMapper(ReviewBookDAO.class);
		dto.setNum_review(Integer.parseInt(request.getParameter("num_review")));
		dto.setContents(request.getParameter("contents"));
		dao.reviewBookModify(dto);
	}
	// 댓글 삭제
	@RequestMapping("/reviewBookDelete")
	public @ResponseBody void reivewBookDelete(@RequestParam("num_review")int num_review, Model model){
		ReviewBookDTO dto = new ReviewBookDTO();
		ReviewBookDAO dao = sqlSession.getMapper(ReviewBookDAO.class);
		dao.reviewBookDelete(num_review);
		/*FreeboardDAO fdao = sqlSession.getMapper(FreeboardDAO.class);
		FreeboardDTO fdto = fdao.freView(dto.getNo());*/
		/*model.addAttribute("dto", fdto);*/
	}
	// 댓글 달기
	@RequestMapping("/reviewBookWrite")
	public @ResponseBody void reviewBookWrite(HttpServletRequest request, Model model){
		ReviewBookDTO dto = new ReviewBookDTO();
		dto.setNum(Integer.parseInt(request.getParameter("no")));
		dto.setId(request.getParameter("id"));
		dto.setContents(request.getParameter("contents"));
		ReviewBookDAO dao = sqlSession.getMapper(ReviewBookDAO.class);
		dao.reviewBookWrite(dto);
	}	
}
