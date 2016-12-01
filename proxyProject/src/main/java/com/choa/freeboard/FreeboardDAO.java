package com.choa.freeboard;

import java.util.List;
import java.util.Map;

import com.choa.util.PageVo;

public interface FreeboardDAO{

	 // 게시물 작성
	   public void freWrite(FreeboardDTO dto);   
	   // 게시물 삭제
	   public void freDelete(int no);
	   // 게시물 보기
	   public FreeboardDTO freView(int no);
	   // 게시물 수정
	   public void freModify(FreeboardDTO dto);
	   // 머징
	   public int selectTotalCount();
	   // 게시물 나열
	   public List<FreeboardDTO> freList(PageVo vo);
	   
	   public List<FreeboardDTO> selectfreList(Map<String, Object> map);
	   // 게시물에 답변
	   public void freAnswer(FreeboardDTO dto);

}
