package com.choa.deal;

import java.sql.Date;

public class DealDTO {
	
	/*private int num;*/
	private int numBook;
	private String product;
	private String idSeller;
	private String idBuyer;
	/*private Date dealDate;*/
	private String status;

	private String name;
	private String tel;
	private String email;
	private String address;
	private Date dealdate;
	
	
	/*public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}*/
	
	public Date getDealdate() {
		return dealdate;
	}
	public void setDealdate(Date dealdate) {
		this.dealdate = dealdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNumBook() {
		return numBook;
	}
	public void setNumBook(int numBook) {
		this.numBook = numBook;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getIdSeller() {
		return idSeller;
	}
	public void setIdSeller(String idSeller) {
		this.idSeller = idSeller;
	}
	public String getIdBuyer() {
		return idBuyer;
	}
	public void setIdBuyer(String idBuyer) {
		this.idBuyer = idBuyer;
	}
	/*public Date getDealDate() {
		return dealDate;
	}
	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}*/
	/*public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
