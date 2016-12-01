package com.choa.proxyProject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choa.comment.CommentDAO;
import com.choa.comment.CommentDTO;
import com.choa.freeboard.FreeboardDAO;
import com.choa.freeboard.FreeboardDTO;
import com.choa.util.Const;



@Controller
@RequestMapping("/comment")
public class CommentController {
	DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		Const.dataSource = this.dataSource;
	}

	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 리스트
	@RequestMapping("/commentList")
	public @ResponseBody List<CommentDTO> getCommentList(HttpServletRequest request, Model model){
		CommentDTO dto = new CommentDTO();
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		List<CommentDTO> ar = dao.selectCommentList(dto);
		return ar;
	}
	// 댓글 수정
	@RequestMapping("/commentModify")
	public @ResponseBody void commentModify(HttpServletRequest request, Model model){
		CommentDTO dto = new CommentDTO();
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		dto.setReviewno(Integer.parseInt(request.getParameter("reviewno")));
		dto.setContents(request.getParameter("contents"));
		dao.commentModify(dto);
	}
	// 댓글 삭제
	@RequestMapping("/commentDelete")
	public @ResponseBody void commentDelete(@RequestParam("reviewno")int reviewno, Model model){
		CommentDTO dto = new CommentDTO();
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		dao.commentDelete(reviewno);
		FreeboardDAO qdao = sqlSession.getMapper(FreeboardDAO.class);
		FreeboardDTO qdto = qdao.freView(dto.getNo());
		model.addAttribute("dto", qdto);
	}
	// 댓글 달기
	@RequestMapping("/commentWrite")
	public @ResponseBody void commentWrite(HttpServletRequest request, Model model){
		CommentDTO dto = new CommentDTO();
		dto.setNo(Integer.parseInt(request.getParameter("no")));
		dto.setWriter(request.getParameter("writer"));
		dto.setContents(request.getParameter("contents"));
		CommentDAO dao = sqlSession.getMapper(CommentDAO.class);
		dao.commentWrite(dto);
	}	
}
