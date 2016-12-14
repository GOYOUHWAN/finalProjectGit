package com.choa.notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "NoticeMapper.";
	
	//공지사항 작성
	public int noticeWrite(NoticeDTO noticeDTO){
		System.out.println(noticeDTO.getContent()+"공지사항DAO"+noticeDTO.getTitle());
		return sqlSession.insert(namespace+"noticeWrite", noticeDTO);
	}
	//공지사항 글 하나 보기
	public void noticeView(int no){}
	//공지사항 목록
	public void noticeList(NoticeDTO noticeDTO){}
	//공지사항 수정
	public void noticeMod(NoticeDTO noticeDTO){}
	//공지사항 글 삭제
	public void noticeDelte(int no){}
}
