package com.choa.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.util.PageMaker;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "NoticeMapper.";
	
	//공지사항 글 하나 보기
	public void noticeView(NoticeDTO noticeDTO){
		//조회수 증가
		sqlSession.update(namespace+"noticeHits", noticeDTO);
		sqlSession.selectOne(namespace+"noticeView", noticeDTO);
	}
	
	//공지사항 작성
	public int noticeWrite(NoticeDTO noticeDTO){
		System.out.println(noticeDTO.getContent()+"공지사항DAO"+noticeDTO.getTitle());
		return sqlSession.insert(namespace+"noticeWrite", noticeDTO);
	}
	
	//공지사항 목록
	public List<NoticeDTO> noticeList(PageMaker pageMaker){
		System.out.println("noticeDAO"+pageMaker.getCurPage());
		List<NoticeDTO> ar = null;
		ar = sqlSession.selectList(namespace+"noticeList", pageMaker);
		return ar;
		
	}
	//공지사항 수정
	public void noticeMod(NoticeDTO noticeDTO){}
	//공지사항 글 삭제
	public void noticeDelte(int no){}
	
	//전체 글 개수
	public int noticeCount() throws Exception {
		return sqlSession.selectOne(namespace + "noticeCount");
	}
}
