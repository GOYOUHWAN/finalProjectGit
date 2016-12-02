package com.choa.blackList;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.blackList.BlackDTO;

@Repository
public class BlackDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="BlackListMapper.";
	
	//±Û¾²±â//
	public int singoWrite(BlackDTO blackDTO) throws Exception {
		return sqlSession.insert(namespace+"singoWrite", blackDTO);
	}
	
}