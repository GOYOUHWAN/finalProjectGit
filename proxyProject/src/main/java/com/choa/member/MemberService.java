package com.choa.member;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.choa.blackList.BlackDTO;
import com.choa.util.MemberPageMaker;
import com.choa.util.PageMaker;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;

	//고유환이 만든부분 시작
	//sellerTrust로 index에서 1~10위 보여주기
	public List<MemberDTO> sellerTrust(Model model)throws Exception{
		 List<MemberDTO> ar = memberDAO.sellerTrust();
		model.addAttribute("sellerTrust", ar);
		model.addAttribute("countT", 0);
		model.addAttribute("listsizeT", ar.size());
		return ar;
	}
	
	//buyerTrust로 index 에서 1~10위 보여쥐
	public List<MemberDTO> buyerTrust(Model model)throws Exception{
		List<MemberDTO> ar = memberDAO.buyerTrust();
		model.addAttribute("buyerTrust", ar);
		model.addAttribute("countB", 0);
		model.addAttribute("listsizeB", ar.size());
		return ar;
	}
	//고유환인 만든부분 끝
	
	
	
	//관리자메뉴=================================================
	//회원정보열람
	public void memberInfo(int curPage, int perPage, Model model, int type) throws Exception{		
		int totalCount = memberDAO.memberCount(type);
		MemberPageMaker mPageMaker = new MemberPageMaker();
		mPageMaker.setType(type);
		mPageMaker.setCurPage(curPage);
		mPageMaker.setPerPage(perPage);
		mPageMaker.makeRow();
		List<MemberDTO> ar = null;
		
		try{
			mPageMaker.makePage(totalCount);
			ar = memberDAO.memberInfo(mPageMaker);
		}catch (Exception e){
			e.printStackTrace();
		}
		
		model.addAttribute("memberInfo", ar);
		model.addAttribute("paging", mPageMaker);
	}
	//신고 글 보기
		public void manageSingolist(int curPage, int perPage, Model model) throws Exception{		
			int totalCount = memberDAO.singoCount();
			MemberPageMaker pageMaker = new MemberPageMaker();
			pageMaker.setCurPage(curPage);
			pageMaker.setPerPage(perPage);
			pageMaker.makeRow();
			List<BlackDTO> ar = null;
			
			try{
				pageMaker.makePage(totalCount);
				ar = memberDAO.manageSingolist(pageMaker);
			}catch (Exception e){
				e.printStackTrace();
			}
			
			model.addAttribute("manageSingolist", ar);
			model.addAttribute("paging", pageMaker);
		}
	
	// 회원메뉴=================================================
	// ID찾기
	public void findID(String find, Model model) throws Exception {
		model.addAttribute("find", memberDAO.findID(find));
	}
	
	// PW변경
	public int updatePW(String id, String pw) throws Exception {
		return memberDAO.updatePW(id, pw);
	}
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
