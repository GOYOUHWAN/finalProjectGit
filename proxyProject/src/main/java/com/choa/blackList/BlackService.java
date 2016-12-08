package com.choa.blackList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.member.MemberDAO;
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
		/*int totalCount = blackDAO.memberCount(type);*/
		MemberPageMaker mPageMaker = new MemberPageMaker();
		mPageMaker.setType(type);
		mPageMaker.setCurPage(curPage);
		mPageMaker.makeRow();
		
		model.addAttribute("memberInfo", blackDAO.memberInfo(mPageMaker));
		model.addAttribute("paging", mPageMaker);
	}
}
