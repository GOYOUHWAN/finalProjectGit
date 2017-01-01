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
	
	
	public DealDTO selectDelivery(int num)throws Exception{
		System.out.println("num은 몇인가" + num);
		return sqlSession.selectOne(namespace+"selectDelivery", num);
	}
	
	
	public List<Integer> dealNumBook()throws Exception{
		return sqlSession.selectList(namespace+"dealNumBook" );
	}
	
	
	//deal 하나 생성
	public int insertDeal(DealDTO dealDTO)throws Exception{
		System.out.println("딜 디에오");
		System.out.println("책 번호 "+dealDTO.getNumBook());
		return sqlSession.insert(namespace+"insertDeal",dealDTO);
		
	}
	
	public List<DealDTO> manageDeal()throws Exception{
		return sqlSession.selectList(namespace+"ManageDeal");
	} 
	
	
}
