package com.choa.deal;

import java.sql.Date;

public class DealDTO {
	
	private int num;
	private int num_book;
	private String product;
	private String id_seller;
	private String id_buyer;
	private Date deal_date;
	private String status;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum_book() {
		return num_book;
	}
	public void setNum_book(int num_book) {
		this.num_book = num_book;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getId_buyer() {
		return id_buyer;
	}
	public void setId_buyer(String id_buyer) {
		this.id_buyer = id_buyer;
	}
	public String getId_seller() {
		return id_seller;
	}
	public void setId_seller(String id_seller) {
		this.id_seller = id_seller;
	}
	public Date getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(Date deal_date) {
		this.deal_date = deal_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
