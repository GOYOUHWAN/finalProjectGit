package com.choa.proxyProject;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.choa.freeboard.FreeboardDTO;
import com.choa.freeboard.FreeboardService;

@Controller
@RequestMapping(value="/freeboard")
public class FreeboardController {
	
	@Autowired
	private FreeboardService freeboardService;
	
	
	
	@RequestMapping(value="/freeboardList")
	public String boardList(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage, Model model){
		try {
			freeboardService.boardList(curPage, perPage, model);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "freeboard/freeboardList";
	}
	
	@RequestMapping(value="freeboardView")
	public String boardView(FreeboardDTO freeboardDTO, Model model){
		try {
			freeboardService.fileView(freeboardDTO, model);
			model.addAttribute("view", freeboardService.boardView(freeboardDTO));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "freeboard/freeboardView";
	}
	
	//?��?��로�?겠다
	@RequestMapping(value="freeboardWrite", method=RequestMethod.GET)
	public void boardWrite(){}
	
	
	@RequestMapping(value="freeboardWrite", method=RequestMethod.POST)
	public String boardWrite(FreeboardDTO freeboardDTO, MultipartHttpServletRequest mr, HttpSession session){
		try {
			freeboardService.boardWrite(freeboardDTO, mr, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/freeboard/freeboardList";
	}
	
	@RequestMapping(value="freeboardUpdate", method=RequestMethod.POST)
	public String boardUpdate(FreeboardDTO freeboardDTO, MultipartHttpServletRequest mr, HttpSession session){
		
		try {
			freeboardService.boardUpdate(freeboardDTO, mr, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/freeboard/freeboardView?num="+freeboardDTO.getNum();
	}
}
