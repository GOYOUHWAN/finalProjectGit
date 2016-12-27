package com.choa.member;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.blackList.BlackDTO;
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
	
	public int approve(ApproveDTO approveDTO, ArrayList<String> fileNames) throws Exception{
		int result = 0;
		//result = sqlSession.insert(namespace+"approve", approveDTO);
		System.out.println("fileNames : "+fileNames.size());
		int fileNum = sqlSession.selectOne(namespace+"fileNum");
		Map<String, Object> data = new HashMap<String, Object>();
		for(int i=0;i<fileNames.size();i++){
			data.put("refNum", 10);
			data.put("fileName"+(i+1), fileNames.get(i));
			System.out.println("파일이름 : "+fileNames.get(i));
			
		}
		result = result + sqlSession.insert(namespace+"approve", data);
		System.out.println("result2 : "+result);
		return result;
	}
	
	//고유환이 만든부분 시작
	//index 에서 판매자seller_trust에 따라 순위 1~10위 보여주기
	public List<MemberDTO> sellerTrust()throws Exception{
		return sqlSession.selectList(namespace+"sellerTrust");
	}
	//index 에서 판매자 buyer_trust에 따라 순위 1~10위 보여주기
	public List<MemberDTO> buyerTrust()throws Exception{
		return sqlSession.selectList(namespace+"buyerTrust");
	}
	//고유환이 만든부분 끝
	
	
	
	//관리자메뉴=================================================
	//회원정보열람
	public List<MemberDTO> memberInfo(MemberPageMaker mPageMaker) throws Exception{
		return sqlSession.selectList(namespace+"memberInfo", mPageMaker);
	}
	
	//전체회원수
	public int memberCount(int type) throws Exception{
		return sqlSession.selectOne(namespace+"memberCount", type);
	}
	//신고글개수
	public int singoCount() throws Exception{
		return sqlSession.selectOne(namespace+"singoCount");
	}
	//신고글관리
	public List<BlackDTO> manageSingolist(PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"manageSingolist", pageMaker);
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
