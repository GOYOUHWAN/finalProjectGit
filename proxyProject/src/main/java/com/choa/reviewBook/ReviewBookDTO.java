package com.choa.reviewBook;

import java.sql.Date;
import java.sql.Timestamp;

public class ReviewBookDTO {
   private int num;
   private int num_review;
   private String id;
   private String contents;
   private Date redate;
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public int getNum_review() {
	return num_review;
}
public void setNum_review(int num_review) {
	this.num_review = num_review;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public Date getRedate() {
	return redate;
}
public void setRedate(Date redate) {
	this.redate = redate;
}
   
   
   

}