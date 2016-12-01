package com.choa.comment;

import java.util.List;

import com.choa.comment.CommentDTO;

public interface CommentDAO {
	// ???
	public int selectTotalCount();
	// 댓글삭제
	public int commentDelete(int no);
	// 댓글작성
	public int commentWrite(CommentDTO dto);
	// 댓글보기
	public List<CommentDTO> selectCommentList(CommentDTO cdto);
	// 댓글수정
	public void commentModify(CommentDTO dto);
	
}
