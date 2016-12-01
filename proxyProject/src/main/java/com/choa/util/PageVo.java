package com.choa.util;

import org.apache.ibatis.session.SqlSession;

public class PageVo {
      private SqlSession sqlSession;
      
      
       private int startRow;//rownnum
       private int lastRow; //rownum
       private int startNum;//占쏙옙占쏙옙징 
       private int lastNum;//占쏙옙占쏙옙징
       
       private int linePerPage;
       private int totalBlock;
       private int totalPage;
       private int block;
       
      

      public PageVo(int page, int linePerPage, int totalCount) {
           this.linePerPage = linePerPage;
           this.startRow = page*linePerPage-9;
           this.lastRow = page*linePerPage;
           if(page %5 ==0){
              block=page/5;
              
           }else{
              block=page/5+1;
           }
           result(page, totalCount);
       }
      
       //start, last page 占쏙옙占� 占싹댐옙 占쌨쇽옙占쏙옙
       public void result(int curPage, int totalCount){
          if(curPage%5==0){
             linePerPage = curPage/5;
          } else{
             linePerPage = curPage/5+1;
          }
          if(totalCount %10 == 0){
             totalPage = totalCount/10;
          }else{
             totalPage = totalCount/10+1;
          }
          startNum = block*5-4;
          lastNum = block*5;
          if(lastNum >= totalPage){
             lastNum = totalPage;
          }
          //占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占싹댐옙 
          if(totalPage%5 == 0 ){
             totalBlock = totalPage/5;
          } else{
             totalBlock = totalPage/5+1;
          }
       }

      public SqlSession getSqlSession() {
         return sqlSession;
      }

      public void setSqlSession(SqlSession sqlSession) {
         this.sqlSession = sqlSession;
      }


       public int getTotalPage() {
         return totalPage;
      }

      public void setTotalPage(int totalPage) {
         this.totalPage = totalPage;
      }

      public int getBlock() {
         return block;
      }

      public void setBlock(int block) {
         this.block = block;
      }
      public int getStartRow() {
         return startRow;
      }

      public void setStartRow(int startRow) {
         this.startRow = startRow;
      }

      public int getLastRow() {
         return lastRow;
      }

      public void setLastRow(int lastRow) {
         this.lastRow = lastRow;
      }

      public int getStartNum() {
         return startNum;
      }

      public void setStartNum(int startNum) {
         this.startNum = startNum;
      }

      public int getLastNum() {
         return lastNum;
      }

      public void setLastNum(int lastNum) {
         this.lastNum = lastNum;
      }

      public int getLinePerPage() {
         return linePerPage;
      }

      public void setLinePerPage(int linePerPage) {
         this.linePerPage = linePerPage;
      }

      public int getTotalBlock() {
         return totalBlock;
      }

      public void setTotalBlock(int totalBlock) {
         this.totalBlock = totalBlock;
      } 
}