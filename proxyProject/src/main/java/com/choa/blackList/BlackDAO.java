package com.choa.blackList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.blackList.BlackDTO;
import com.choa.member.MemberDTO;
import com.choa.util.MemberPageMaker;

@Repository
public class BlackDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="BlackListMapper.";
	
	//글쓰기//
	public int singoWrite(BlackDTO blackDTO) throws Exception {
		return sqlSession.insert(namespace+"singoWrite", blackDTO);
	}
	//회원정보열람
	public List<MemberDTO> memberInfo(MemberPageMaker mPageMaker) throws Exception{
		return sqlSession.selectList(namespace+"memberInfo", mPageMaker);
	}	
	//전체회원수
	public int memberCount(int type) throws Exception{
		return sqlSession.selectOne(namespace+"memberCount", type);
	}
}