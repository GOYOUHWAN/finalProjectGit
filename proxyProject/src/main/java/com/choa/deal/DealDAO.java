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
	
	public List<Integer> dealNumBook()throws Exception{
		return sqlSession.selectList(namespace+"dealNumBook" );
	}
	
	
	//deal 하나 생성
	public int insertDeal(DealDTO dealDTO)throws Exception{
		return sqlSession.insert(namespace+"insertDeal"+dealDTO);
		
	}
	
	public List<DealDTO> manageDeal()throws Exception{
		return sqlSession.selectList(namespace+"ManageDeal");
	} 
	
	
}
