package com.choa.freeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class FreeboardService {

	@Autowired
	private FreeboardDAO2 freeboardDAO2;
	
	public List<FreeboardDTO> myBoardList(String id, Model model){
		List<FreeboardDTO> ar = freeboardDAO2.myBoardList(id);
		model.addAttribute("myBoardList", ar);
		return ar;
		
	}
	
	
}
