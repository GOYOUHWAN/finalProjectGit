package com.choa.freeboard;

import com.choa.freeboard.FreeboardAnswerDTO;

public interface FreeboardAnswerDAO {

	// 답변 게시물 작성
		public void freAnswerWrite(FreeboardAnswerDTO dto);
		// 답변 게시물 삭제
		public void freAnswerDelete(int no);

}
