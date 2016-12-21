package com.choa.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.util.PageMaker;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	//조회수
	public void noticeView(NoticeDTO noticeDTO){
		noticeDAO.noticeView(noticeDTO);
	}
	
	//공지사항 작성
	public int noticeWrite(NoticeDTO noticeDTO){
		return noticeDAO.noticeWrite(noticeDTO);
	}
	
	//공지사항 목록
	public String noticeList(int curPage, int perPage, Model model){
		List<NoticeDTO> ar = null;
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		try {
			pageMaker.makePage(noticeDAO.noticeCount());
			ar = noticeDAO.noticeList(pageMaker);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("page", pageMaker);
		model.addAttribute("noticeList", ar);
		return "noticeList";
	}

}
