package com.choa.member;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
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
		System.out.println("회원수정 service");
		return memberDAO.memberUpdate(memberDTO);
	}
	//회원탈퇴
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberDelete(memberDTO);
	}
	
	//회원정보보기
	public MemberDTO memberView(String id) throws Exception{
		return memberDAO.memberView(id);
	}

}
