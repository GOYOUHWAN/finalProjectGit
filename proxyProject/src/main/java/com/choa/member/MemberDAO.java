package com.choa.member;

import static org.hamcrest.CoreMatchers.nullValue;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "MemberMapper.";
	
	
	
	//1.JOIN//
		public int memberJoin(MemberDTO memberDTO) throws Exception{
			return sqlSession.insert(namespace+"memberJoin", memberDTO);
		}
	//2.LOGIN//
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(namespace+"memberLogin", memberDTO);
	}
	
	//3.UPDATE//
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(namespace+"memberUpdate", memberDTO);
	}
	
	//4.DELETE//
	public int memberDelete(String id) throws Exception{
		return sqlSession.delete(namespace+"memberDelete", id);
	}
	
	//5.id중복확인
	public int checkid(String id) throws Exception{
		return sqlSession.selectOne(namespace+"checkID", id);
	}
	
	//회원정보보기
	public MemberDTO memberView(String id) throws Exception{
		return sqlSession.selectOne(namespace+"memberView", id);
	}
	

}
