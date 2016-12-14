package com.choa.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	public int noticeWrite(NoticeDTO noticeDTO){
		return noticeDAO.noticeWrite(noticeDTO);
	}

}
