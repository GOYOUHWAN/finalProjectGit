package com.choa.proxyProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.choa.notice.NoticeDTO;
import com.choa.notice.NoticeService;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 글쓰기
	@RequestMapping(value="noticeWrite", method=RequestMethod.GET)
	public void noticeWrite(){}
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public void noticeWrite(@RequestParam String title, @RequestParam String content){
		String message = "";
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setTitle(title);
		noticeDTO.setContent(content);
		int result = noticeService.noticeWrite(noticeDTO);
		if(result>0){
			message="글등록성공";
		}else{
			message="등록 실패";
		}
		System.out.println(message);
	}
		
	//공지사항 글하나보기
	@RequestMapping(value="noticeView", method=RequestMethod.GET)
	public void noticeView(){}

	//공지사항 목록
	@RequestMapping(value="noticeList", method=RequestMethod.GET)
	public void noticeList(){}
	
	//공지사항 수정
	@RequestMapping(value="noticeMod", method=RequestMethod.GET)
	public void noticeMod(){}
	
	//공지사항 글 삭제
	@RequestMapping(value="noticeDel", method=RequestMethod.GET)
	public void noticeDel(){}
}