package com.choa.member;

import static org.hamcrest.CoreMatchers.nullValue;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="MemberMapper.";
	
	//회원가입
	public int memberJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(namespace+"memberJoin", memberDTO);
	}
	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(namespace+"memberLogin", memberDTO);
	}
	//회원수정
	public int memberUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(namespace+"memberUpdate", memberDTO);
	}
	
	//탈퇴
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(namespace+"memberDelete", memberDTO);
	}

}
