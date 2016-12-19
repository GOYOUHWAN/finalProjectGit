package com.choa.proxyProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.deal.DealService;

@Controller
@RequestMapping(value="/member/manager")
public class DealController {

	@Autowired
	private DealService dealService;
		
		@RequestMapping(value="/manageDeal")
	   public String manageDeal(Model model){
		   try {
			dealService.manageDeal(model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return "/member/manager/manageDeal";
	   }
	   
	
}
