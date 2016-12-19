package com.choa.blackList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.member.MemberDAO;
import com.choa.member.MemberDTO;
import com.choa.blackList.BlackDAO;
import com.choa.util.MemberPageMaker;

@Service
public class BlackService {
	@Autowired
	private BlackDAO blackDAO;
	
	//신고 글 작성
	public int singoWrite(BlackDTO blackDTO) throws Exception {
		return blackDAO.singoWrite(blackDTO);
	}
	//신고 글 삭제
	public int singoDelete(String sid)throws Exception{
		return blackDAO.singoDelete(sid);
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
	//신고 글 보기
	public BlackDTO singoView(String sid, Model model) throws Exception{
		 BlackDTO blackDTO = blackDAO.singoView(sid);
	     model.addAttribute("blackDTO",blackDTO);
	     
	     return blackDTO;
	}
	//블랙멤버 정보보기
	public MemberDTO blackmView(String id, Model model) throws Exception{
		MemberDTO memberDTO = blackDAO.blackmView(id);
	     model.addAttribute("blackm",memberDTO);
	     
	     return memberDTO;
	}
	//회원수정
	public int blackmUpdate(MemberDTO memberDTO)throws Exception{
		return blackDAO.blackmUpdate(memberDTO);
	}
}
