package com.choa.deal;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DealDAO {

	@Autowired
	private SqlSession sqlSession;
	private String namespace="DealMapper.";
	
	public List<DealDTO> manageDeal()throws Exception{
		return sqlSession.selectList(namespace+"ManageDeal");
	} 
	
	
}
