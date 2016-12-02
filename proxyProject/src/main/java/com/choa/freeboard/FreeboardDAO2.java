package com.choa.freeboard;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeboardDAO2 {

	@Autowired
	private SqlSession sqlSession;
	private String namespace = "MyFreeboardMapper.";
	
	public List<FreeboardDTO> myBoardList(String id){
		return sqlSession.selectList(namespace+"myBoardList", id);
	}
	
	
}
