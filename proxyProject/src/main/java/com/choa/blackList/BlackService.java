package com.choa.blackList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BlackService {
	@Autowired
	private BlackDAO blackDAO;
	
	public int singoWrite(BlackDTO blackDTO) throws Exception {
		return blackDAO.singoWrite(blackDTO);
	}
}
