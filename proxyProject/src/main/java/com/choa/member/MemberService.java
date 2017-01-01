package com.choa.member;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.choa.blackList.BlackDTO;
import com.choa.book.BookDAO;
import com.choa.util.MemberPageMaker;
import com.choa.util.PageMaker;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	
	//구매자가 판매자 승인 신청요청
	public int approve(ApproveDTO approveDTO,  MultipartRequest mr,HttpSession session) throws Exception{
		String path = session.getServletContext().getRealPath("resources/upload");
		List<MultipartFile> files = mr.getFiles("identitycard");
		files.add(mr.getFile("bank"));
		ArrayList<String> fileNames = new ArrayList<String>();
		for(int i = 0; i<files.size(); i++){
			MultipartFile mf = files.get(i);
			String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
			System.out.println("memberService "+fileName);
			File file  = new File(path, fileName);
			mf.transferTo(file);
			fileNames.add(fileName);
		}
		return memberDAO.approve(approveDTO, fileNames);
	}

	public int addPointBuyer(int num, Model model)throws Exception{
		int number = memberDAO.addPointBuyer(num);
		
		String success = null;
		if(number >0){
			success = "구매자의 신용도를 +1 하였습니다!";
		}else{
			success = "실패!";
		}
		model.addAttribute("success", success);
		return number;
	}
	public int addPointSeller(int num, Model model)throws Exception{
		int number = memberDAO.addPointSeller(num);
		
		String success = null;
		if(number >0){
			success = "판매자의 신용도를 +1 하였습니다!";
		}else{
			success = "실패!";
		}
		model.addAttribute("success", success);
		return number;
	}
	public int downPointBuyer(int num, Model model)throws Exception{
		int number = memberDAO.downPointBuyer(num);
		
		String success = null;
		if(number >0){
			success = "구매자의 신용도를 -1 하였습니다!";
		}else{
			success = "실패!";
		}
		model.addAttribute("success", success);
		return number;
	}
	public int downPointSeller(int num, Model model)throws Exception{
		int number = memberDAO.downPointSeller(num);
		
		String success = null;
		if(number >0){
			success = "판매자의 신용도를 -1 하였습니다!";
		}else{
			success = "실패!";
		}
		model.addAttribute("success", success);
		return number;
	}
	
	
	//고유환이 만든부분 시작
	//sellerTrust로 index에서 1~10위 보여주기
	public List<MemberDTO> trust(Model model)throws Exception{
		 List<MemberDTO> ar = memberDAO.trust();
		model.addAttribute("trust", ar);
		model.addAttribute("countT", 0);
		model.addAttribute("listsizeT", ar.size());
		return ar;
	}
	
	//buyerTrust로 index 에서 1~10위 보여쥐
/*	public List<MemberDTO> buyerTrust(Model model)throws Exception{
		List<MemberDTO> ar = memberDAO.buyerTrust();
		model.addAttribute("buyerTrust", ar);
		model.addAttribute("countB", 0);
		model.addAttribute("listsizeB", ar.size());
		return ar;
	}*/
	//고유환인 만든부분 끝
	
	
	
	//관리자메뉴=================================================
	//판매자 승인
	public int memberApprove(String id) throws Exception{
		return memberDAO.memberApprove(id);
	}
	
	//관리자가 판매자 승인리스트
	public void manageApprove(int curPage, int perPage, Model model)throws Exception{	
		System.out.println("memberService");
		int totalCount = memberDAO.appCount();
		System.out.println("totalCount : "+totalCount);
		List<ApproveDTO> ar = null;
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		ar = memberDAO.approveInfo(pageMaker);
		System.out.println("ar id: "+ar.get(0).getId());
		System.out.println("ar 1: "+ar.get(0).getFilename1());
		System.out.println("ar 2: "+ar.get(0).getFilename2());
		model.addAttribute("approveInfo", ar);
		
		model.addAttribute("paging", pageMaker);
	}
	//회원정보열람
	public void memberInfo(int curPage, int perPage, Model model, int type) throws Exception{		
		int totalCount = memberDAO.memberCount(type);
		List<MemberDTO> ar = null;
		MemberPageMaker mPageMaker = new MemberPageMaker();
		mPageMaker.setType(type);
		mPageMaker.setCurPage(curPage);
		mPageMaker.setPerPage(perPage);
		mPageMaker.makeRow();
		mPageMaker.makePage(totalCount);
		ar = memberDAO.memberInfo(mPageMaker);
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
	public void findID(MemberDTO memberDTO, Model model) throws Exception {
		System.out.println("memberService"+memberDTO.getName()+memberDTO.getEmail()+memberDTO.getTel());
		
		model.addAttribute("find", memberDAO.findID(memberDTO));
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
