package com.choa.comment;

import java.sql.Date;
import java.sql.Timestamp;

public class CommentDTO {
   private int no;
   private int reviewno;
   private String id;
   private String contents;
   private Date redate;
   
   
   

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public int getReviewno() {
      return reviewno;
   }
   public void setReviewno(int reviewno) {
      this.reviewno = reviewno;
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