package com.choa.member;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.util.MemberPageMaker;
import com.choa.util.PageMaker;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	//관리자메뉴=================================================
	//회원정보열람
	public void memberInfo(int curPage, int perPage, Model model, int type) throws Exception{
		int totalCount = memberDAO.memberCount(type);
		MemberPageMaker mPageMaker = new MemberPageMaker();
		mPageMaker.setType(type);
		mPageMaker.setCurPage(curPage);
		mPageMaker.setPerPage(perPage);
		mPageMaker.makeRow();
		mPageMaker.makePage(totalCount);
		System.out.println("curPage"+mPageMaker.getCurPage());
		System.out.println("perPage"+mPageMaker.getPerPage());
		System.out.println("StartNum"+mPageMaker.getStartNum());
		System.out.println("LastNum"+mPageMaker.getLastNum());
		System.out.println("CurBlock"+mPageMaker.getCurBlock());
		System.out.println("LastLowNum"+mPageMaker.getLastLowNum());
		System.out.println("StartRowNum"+mPageMaker.getStartRowNum());
		System.out.println("TotalBlock"+mPageMaker.getTotalBlock());
		
		model.addAttribute("memberInfo", memberDAO.memberInfo(mPageMaker));
		model.addAttribute("paging", mPageMaker);
	}
	
	
	//회원메뉴=================================================
	//아이디중복확인
	public int checkid(String id) throws Exception{
		return memberDAO.checkid(id);
	}
	
	//회원가입
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberLogin(memberDTO);
	}
	//회원수정
	public int memberUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberUpdate(memberDTO);
	}
	//회원탈퇴
	public int memberDelete(String id)throws Exception{
		return memberDAO.memberDelete(id);
	}
	
	//회원정보보기
	public MemberDTO memberView(String id) throws Exception{
		return memberDAO.memberView(id);
	}
	
	

}
