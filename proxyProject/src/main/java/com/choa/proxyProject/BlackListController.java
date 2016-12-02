package com.choa.proxyProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.blackList.BlackDTO;
import com.choa.blackList.BlackService;

@Controller
@RequestMapping(value="/blackList")
public class BlackListController {
	@Autowired
	private BlackService blackService;
	
	@RequestMapping(value="/singoForm")
	public void singoForm(){}
	
	@RequestMapping(value="/singoWrite", method=RequestMethod.POST)
	public String singowrite(BlackDTO blackDTO, RedirectAttributes rd){
		int result=0;
		String path="";
		String message="";
		try {
			result = blackService.singoWrite(blackDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			path="redirect:/blackList/blackListForm";
			message="��ϼ���";
		}else {
			path="redirect:/blackList/blackListForm";
			message="��Ͻ���";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	@RequestMapping(value="/blackListForm")
	public void blackListForm(){}
}