package com.choa.deposit;

import java.util.Date;

public class DepositDTO {

	private int num;
	private String id;
	private Date ddate;
	private int price;
	private int book2_num;
	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBook2_num() {
		return book2_num;
	}
	public void setBook2_num(int book2_num) {
		this.book2_num = book2_num;
	}
}
