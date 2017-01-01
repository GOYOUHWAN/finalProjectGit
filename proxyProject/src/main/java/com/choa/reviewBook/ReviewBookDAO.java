package com.choa.reviewBook;

import java.util.List;

import com.choa.comment.CommentDTO;

public interface ReviewBookDAO {
	// ???
	public int selectTotalCount();
	// 댓글삭제
	public int reviewBookDelete(int num);
	// 댓글작성
	public int reviewBookWrite(ReviewBookDTO dto);
	// 댓글보기
	public List<ReviewBookDTO> reviewBookList(ReviewBookDTO cdto);
	// 댓글수정
	public void reviewBookModify(ReviewBookDTO dto);
	
}
