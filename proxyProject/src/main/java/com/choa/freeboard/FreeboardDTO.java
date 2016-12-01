package com.choa.freeboard;

import java.sql.Timestamp;

public class FreeboardDTO {
	private int no;
	private String id;
	private String title;
	private String content;
	private Timestamp date2;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate2() {
		return date2;
	}
	public void setDate2(Timestamp date2) {
		this.date2 = date2;
	}
	
	
}
