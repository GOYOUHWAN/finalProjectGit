<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="java.text.*" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/visitedbook.css">

<title>PROXY : 대한민국 대표 중고도서</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(function () {
	var message='${message}';
	if(message != ''){
		alert(message);
	}
});

</script>


<style type="text/css">


#listTable{
	width : 80%;
	margin : 0 auto;
	margin-top: 50px;
/* 	border: 1px solid black; */
}
#tr_list{
	width: 100%;
}
.td_book{
	height: 400px;
	width : 25%;
	margin-left: 100px;
	margin-top: 100px;
/* 	border: 1px solid yellow; */
}
#div_img{
	width: 100%;
	height: 300px;
/* 	border: 1px solid red;  */
}
#img{
	border-radius : 0px;
	size: inherit; 
	width: 80%;
	height: 100%;
	margin-left: 25px;
/* 	 border: 1px solid green;  */
	}
#body_sellbooklist{
	height: 1200px;
}
.pad{
	margin : 0 auto;
	width : 80%;
	text-align: left;
/* 	border : 1px solid green;  */
	margin-top: 15px;

}
.name{
	font-size: 16px;
}
.zzim{
	width: 20px;
	height: 20px;
}
#div_likes{
	height : 30px;
	margin-top : 30px;
	margin: 0 auto;
	margin-bottom: 60px;
/* 	border: 1px solid red;   */
	text-align: center;
}
.img_likes{
	margin-top : 15px;
	border-radius : 0px;
	width: 20px;
	height: 20px;
}

#p_won{
	font-size: 13px;
	color: gray;
	display: inline-block;
	
	margin-top: 6px;
}
#line_order{
	border-bottom: 1px;
	border-bottom-color: gray;
	border-bottom-style: solid;
	width: 80%;
	margin: 0 auto;
	margin-top: 70px;
}
.order{
	width : 100px;
	height: 25px;
	color: gray;
	background-color: white;
	border: 1px solid #bfbfbf;
	border-radius: 15px;
	text-align: center;
	display: inline-block;
}

.order:hover{
	color: white;
	background-color:#6e9907;
	border-color: #6e9907;
}
.paging_text{
	font-size: 23px;
	color: gray;
}
#img_blur{
	z-index: 10;
	
}
#span_sellingprice{
	font-size: 24px;
	float: right;
}
	</style>
</head>
<body id="body_sellbooklist">

<%@ include file = "../common/header.jsp" %>


<c:if test="${list[count] != null }">
<!--정렬 시작  -->
<div id="line_order">
	<a href="${pageContext.request.contextPath}/sellBook/sellBookList2?id=${member.id}" class="a_order"><div id="order_1" class="order">낮은가격순</div></a> 
	<a href="${pageContext.request.contextPath}/sellBook/sellBookList3?id=${member.id}" class="a_order"><div id="order_2" class="order">높은가격순</div></a>
	<a href="${pageContext.request.contextPath}/sellBook/sellBookList4?id=${member.id}" class="a_order"><div id="order_3" class="order"> 최신순</div></a>
	<a href="${pageContext.request.contextPath}/sellBook/sellBookList5?id=${member.id}" class="a_order"><div id="order_4" class="order"> 좋아요순</div></a> 
</div>
<!--정렬 끝  -->
</c:if>
		<c:if test="${member != null}">
<!-- 리스트 시작 -->
   	<c:set var="size" value="${listsize%4 }"/>

          <table id="listTable">
         <c:forEach begin="0" end="${listsize/4}">
               <c:forEach begin="0" end="3">
               <c:if test="${check}">  
	                  <c:if test="${listsize =='0' }">
	                 	 <c:set var="no" value="true"/>
	                  </c:if>
	                  
	                  <c:if test="${listsize !='0' }">
	                     <td class="td_book">
	                     <!--id 보여주는 곳  -->
	                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="span_id">${list[count].id}</span>
	                 
	                        <div id="div_img">
	                     <!--책 img 보여주는곳  -->	
	<!-- blur 처리 하는 부분 시작 -->			
		
								<c:set var="boole" value="true"/>				
								<c:forEach begin="1" end="${nSize }" var="nB" >
								
									
									<c:if test="${boole == true }">
							
									   	<c:if test="${numBook[nB-1].numBook == list[count].num }"> 
									   		<!-- 첫번째 -->
											 <img class="img1" id="img" src="${pageContext.request.contextPath}/resources/image/altbook2.png" > 
											<c:set var="boole" value="false"/>										
										</c:if>
									</c:if>
									</c:forEach>
									
									<c:if test="${boole == true }">		
							
										<c:if test="${numBook[nB-1].numBook != list[count].num }">
										<!-- 두번째 -->
											  <a href="sellBookView?num=${list[count].num}&id=${member.id}"> 
		                     		    	<img class="img1" id="img"src="${pageContext.request.contextPath}/resources/upload/${list[count].files1}"></a> 			
										</c:if>  
									</c:if>	
	<!--blur 끝나는 부분  -->			
	                       </div>
	                       
	                        <div class="pad">
	                        <!--각 책에대한 설명  -->
	                       
	                         	<span class="pink name">${list[count].product}</span><br><br>
	                         	<p id="p_price">${list[count].price}원 </p><br><div id="span_sellingprice">${list[count].sellingprice }원</div>
	                         	<div> <c:set var="num1"  value="${list[count].sellingprice / list[count].price *100}" /> 
	                         				<c:set var="number" value="${num1-(num1%1) }"></c:set>
	                      
	                         	${100- number }% <p style="font-weight: bold; display: inline-block;">↓</p></div> <!-- <p id="p_won">원</p> -->
	                    	  	&nbsp;&nbsp;&nbsp;&nbsp;
	                    	  	<!--하트 모양과 likes 숫자 표현  -->
	                    	  	<div id="div_likes" > 
	                    	 		<c:set var="bool" value="false"/>
		                    	  	<c:forEach var="num" begin="0" end="${heartSize }">
		                    	  		<c:set var="number"  value="${list[count].num }" />
				                    	  	<c:if test="${number == heart[num]}">
				                    	  		<img src="/proxyProject/resources/image/heart.jpg" class="img_likes" id="img_heart${list[count].num }" onclick="change_img_to_red(${list[count].num})" data-src="0">
				         	  					<c:set var="bool" value="true"/>
				         	  				</c:if>
		         	  				</c:forEach>
			         	  					<c:if test="${bool == false}">
			         	  						<img src="/proxyProject/resources/image/black_heart.png" class="img_likes" id="img_heart${list[count].num }" onclick="change_img_to_red(${list[count].num})" data-src="1">
											</c:if>&nbsp;&nbsp; <span class="spanLikes" id="spanLikes${list[count].num }">${list[count].likes}</span>
	                    
	                    	  	
	                    	  	<script>
	                    		var likess = "${list[count].likes}";
                	  			var id = "${member.id}";

                	  		  	 function change_img_to_red(num) {
                	  		          
	                    	  	/* 	var heart = document.getElementById("img_heart"+num).src; */
	                    	  		var heart = $("#img_heart"+num).attr("src").toString();
	                    	  	
										if(heart =="${pageContext.request.contextPath}/resources/image/black_heart.png"){
										 	 	document.getElementById("img_heart"+num).src = "${pageContext.request.contextPath}/resources/image/heart.jpg"; 
										 		$.ajax({
			                    					url:'changeLikesBlack',
			                    					type:'POST',
			                    					data : {id:id, num:num}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴(bookDTO)을 의미
			                    						$("#spanLikes"+num).html(result.likes);             
			                    					},
			                    					error:function(e){
			                    						alert("eeeeeeeeeeeeeee");
			                    					}
			                    				});
										 	 }else{
										 		//여기로 들어오면 memberLikeBooks에 한줄 삭제하고 , books에 likes -1
										 		document.getElementById("img_heart"+num).src="${pageContext.request.contextPath}/resources/image/black_heart.png";
										 		$.ajax({
			                    					url:"changeLikesRed",
			                    					type:"POST",
			                    					data : {id:id, num:num}, 	
			                    					success:function(result) {
			                    						$("#spanLikes"+num).html(result.likes);        
			                    					},
			                    				});
										 	 }	                      	 	
	                    	  	 }
	                	 
									 </script>
	                    	  	</div>
	                    	  
	                    	  	<!--하... 스크립트로 클릭하면 하트 모양 또는 색깔 바꾸기   -->
	                        </div>
	              
	                     </td>
	        
	                   
	                  </c:if>
              	  </c:if>  
                  <c:if test="${(count+1) ==listsize}">
                     <c:set var="check" value="false"/>
                  </c:if>
               <c:set var="count" value="${count+1}"/>
               </c:forEach>
            <!--4개씩 보여지기 때문에 listsize를 4로 나눈 나머지가 생기면 list 모양이 깨져보임  에 대한 해결 = td 개수맞춰 더해주기  -->   
             <c:choose>
   				<c:when test="${size ==1 }">
   					   <td class="td_book"></td>
	                   <td class="td_book"></td>
	                   <td class="td_book"></td>
   				</c:when>
   				<c:when test="${size == 2 }">
   					   <td class="td_book"></td>
	                   <td class="td_book"></td>
   				</c:when>
   				<c:when test="${ size == 3}">
   					  <td class="td_book"></td>
   				</c:when>
   			</c:choose>
            </tr>
            
            <!-- 최근 본 상품 목록 시작 -->
          <div class="hm-visited-wrapper">
         	<div class="hm-visited-items">
				<div class="hm-visited-title">최근 본 상품</div>
				<!-- 이미지 영역 -->
					<div>
						<%	//쿠키여러개꺼내오기
							Cookie[] cookies = request.getCookies(); //몇갠지 모르니까 배열로 만든거다
							int size = cookies.length;
							if (cookies != null) {
								%><c:set var="doneLoop" value="false" /><%
								for (int i =size-1 ; i>=0 ; i--) {
									if(cookies[i].getName().contains("JSESSIONID")){
									}else{
						%>
								<c:if test="${not doneLoop}">
								<div ng-repeat="order in currentItems">
									<a href="sellBookView?num=<%=cookies[i].getValue()%>&id=${member.id}">
										<div class="hm-visited-image">
										<img src="<%=application.getContextPath() %>/resources/upload/<%=cookies[i].getName()%>">
								</div>
							</a>
						</div>
						<%if(i==size-6){ %>
							<c:set var="doneLoop" value="true" />
						<%} %>
						</c:if>
							<%}
							}
						}%>
					</div>
				</div>
         </div> 
         <!-- 최근 본 상품 목록 끝 -->
         </c:forEach>
         
         </table>
               
         <!-- 리스트 끝 -->
         <c:if test="${no}">
          <p id="tagisp"><img src="${pageContext.request.contextPath}/resources/image/warn.png"><br><br>
          	조회된 결과가 없습니다. 다른 조건으로 검색해보세요!</p>
         </c:if> 
         
         
    
	
<!--paging  시작 -->
	<c:if test="${list != null}">
	<c:if test="${paging != null }">
		<!-- 목차, 글쓰기 -->
		<div id="listnum">
		<!-- 뒤로가기 -->
		<c:if test="${paging.curBlock>'1'}">
			<a href="sellBookList?curPage=${paging.startNum-1}&id=${member.id}" class="paging_text"> 이전 </a>
		</c:if>
		<!-- 목차번호 -->
		<c:forEach begin="${paging.startNum}" end="${paging.lastNum}" step="1" var="i">
			<a href="sellBookList?curPage=${i}&id=${member.id}" class="paging_text">${i}</a>
		</c:forEach>
	
		<!-- 앞으로 가기 -->
		<c:if test="${paging.curBlock < paging.totalBlock}">
			<a href="sellBookList?curPage=${paging.lastNum+1}&id=${member.id}" class="paging_text"> 다음 </a>
		</c:if>
			
		</div>
		</c:if>
		</c:if>
<!--paging 끝 -->
         </c:if>
         
         	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
         
</body>
</html>
