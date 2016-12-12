package com.choa.blackList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.member.MemberDAO;
import com.choa.member.MemberDTO;
import com.choa.util.MemberPageMaker;

@Service
public class BlackService {
	@Autowired
	private BlackDAO blackDAO;
	
	public int singoWrite(BlackDTO blackDTO) throws Exception {
		return blackDAO.singoWrite(blackDTO);
	}
	//회원정보열람
	public void memberInfo(int curPage, int perPage, Model model, int type) throws Exception{
		
		int totalCount = blackDAO.memberCount(type);
		MemberPageMaker mPageMaker = new MemberPageMaker();
		mPageMaker.setType(type);
		mPageMaker.setCurPage(curPage);
		mPageMaker.setPerPage(perPage);
		mPageMaker.makeRow();
		List<MemberDTO> ar = null;
		
		try{
			mPageMaker.makePage(totalCount);
			ar = blackDAO.memberInfo(mPageMaker);
		}catch (Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("memberInfo", ar);
		model.addAttribute("paging", mPageMaker);
	}
}
