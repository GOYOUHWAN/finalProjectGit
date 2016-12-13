package com.choa.member;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.util.MemberPageMaker;
import com.choa.util.PageMaker;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "MemberMapper.";
	
	//관리자메뉴=================================================
	//회원정보열람
	public List<MemberDTO> memberInfo(MemberPageMaker mPageMaker) throws Exception{
		return sqlSession.selectList(namespace+"memberInfo", mPageMaker);
	}
	
	//전체회원수
	public int memberCount(int type) throws Exception{
		return sqlSession.selectOne(namespace+"memberCount", type);
	}
	
	//회원메뉴=================================================
		//id찾기
		public String findID(String find) throws Exception{
			find = sqlSession.selectOne(namespace+"findID", find);
			return find;
		}
		
		public int updatePW(String id, String pw) throws Exception{
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(id);
			memberDTO.setPw(pw);
			return sqlSession.update(namespace+"updatePW", memberDTO);
		}
		
		//id중복확인
		public int checkid(String id) throws Exception{
			return sqlSession.selectOne(namespace+"checkID", id);
		}
			
		//회원정보보기
		public MemberDTO memberView(String id) throws Exception{
			return sqlSession.selectOne(namespace+"memberView", id);
		}
		//회원가입
		public int memberJoin(MemberDTO memberDTO) throws Exception{
			return sqlSession.insert(namespace+"memberJoin", memberDTO);
		}
		//로그인
		public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
			return sqlSession.selectOne(namespace+"memberLogin", memberDTO);
		}
		
		//회원수정
		public int memberUpdate(MemberDTO memberDTO) throws Exception{
			return sqlSession.update(namespace+"memberUpdate", memberDTO);
		}
		
		//회원탈퇴
		public int memberDelete(String id) throws Exception{
			return sqlSession.delete(namespace+"memberDelete", id);
		}
	
	
	

}
