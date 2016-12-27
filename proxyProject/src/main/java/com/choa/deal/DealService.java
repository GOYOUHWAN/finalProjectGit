package com.choa.deal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class DealService {
	
	@Autowired
	private DealDAO dealDAO;
	
	//deal 하나 만들기
	public void insertDeal(DealDTO dealDTO)throws Exception{
			dealDAO.insertDeal(dealDTO);
	}
	
	public List<DealDTO> manageDeal(Model model)throws Exception{
		List<DealDTO> ar = null;
		ar = dealDAO.manageDeal();
		model.addAttribute("dealList", ar);
		return ar;
	}
	
	public List<Integer> dealNumBook(Model model)throws Exception{
		List<Integer> ar = null;
		ar= dealDAO.dealNumBook();
		model.addAttribute("numBook", ar);
		model.addAttribute("nSize", ar.size());
		return ar;
	}
	
	
}
