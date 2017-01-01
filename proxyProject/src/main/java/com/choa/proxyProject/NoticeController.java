package com.choa.proxyProject;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.freeboard.FreeboardDAO;
import com.choa.freeboard.FreeboardDTO;
import com.choa.notice.NoticeDAO;
import com.choa.notice.NoticeDTO;
import com.choa.notice.NoticeService;
import com.choa.util.PageVo;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	private String namespace = "NoticeMapper.";
	
	//공지사항 글쓰기
	@RequestMapping(value="noticeWrite", method=RequestMethod.GET)
	public void noticeWrite(){}
	
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public String noticeWrite(@RequestParam String title, @RequestParam String content, RedirectAttributes rd){
		String message = "";
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setTitle(title);
		noticeDTO.setContent(content);
		int result = noticeService.noticeWrite(noticeDTO);
		if(result>0){
			message="글 등록 성공";
		}else{
			message="등록 실패";
		}
		System.out.println(message);
		rd.addFlashAttribute("message", message);
		return "redirect:noticeList";
	}
		
	
	//공지사항 글하나보기 
	@RequestMapping(value="noticeView")
	public String noticeView(int no, Model model){
		noticeService.noticeView(no, model);
		return "notice/noticeView";
	}

	
	//공지사항 목록
	@RequestMapping(value = "noticeList")
	public String noticeList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		noticeService.noticeList(curPage, perPage, model);
		return "notice/noticeList";
	}
	
	
	//공지사항 수정
	@RequestMapping(value="noticeMod", method=RequestMethod.GET)
	public void noticeMod(){}
	
	//공지사항 글 삭제
	@RequestMapping(value = "noticeDel")
	public String noticeDelete(@RequestParam int no){
		System.out.println("noticeController"+no);
		int result = noticeService.noticeDel(no);
		System.out.println("result : "+result);
		return "notice/noticeList";
	}
}
