package com.choa.deal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class DealService {
	
	@Autowired
	private DealDAO dealDAO;
	
	public List<DealDTO> manageDeal(Model model)throws Exception{
		List<DealDTO> ar = null;
		ar = dealDAO.manageDeal();
		model.addAttribute("dealList", ar);
		return ar;
	}
	
	
}
