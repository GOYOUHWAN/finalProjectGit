<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
//최근 본 상품 저장
$(function () {
	$.ajax({
		url : "sellBookCookieProcess",
		type : "POST",
		data : {
			pic:$("#viewpic").val(),
			num:$("#viewnum").val()
		},
		success : function(result){
		}
	});
});

</script>
<title>PROXY : 대한민국 대표 중고도서</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/visitedbook.css">
<style type="text/css">
.mySlides {
	display:none;
	width: 500px;
	height: 500px;
	}
.demo {
	cursor:pointer;
	}
.view_img{
	width: 100px;
	height: 100px;
	margin-left: 5px;
	display: inline;
	}
.view_div{
	margin-top: 10px;
}
.view_div_img{
	width: 90%;
	margin: 0 auto;
/* 	border: 1px solid blue; */
}
#view_div_1{
	margin-top: 100px;
/* 	border: 1px solid red; */
	display: inline-block;
	float: left;
}
#view_div_outside{
	width: 100%;
	height: 1000px;
	padding-top: 0px;
/* 	border: 1px solid black; */
}
#view_div_inside{
	width: 80%;
	height: 100%;
/* 	border: 1px solid yellow; */
	margin: 0 auto;
}
#div_name{
	width: 50%;
	height: 500px;
/* 	border: 1px solid green; */
	display: inline-block;
	float: left;
	margin-top: 200px;
}
#view_table{
	width : 90%;
	float : right;
/* 	border: 1px solid red; */
}

.view_button{
	width: 40%;
	height: 40px;
	border: 1px solid #6e9907;

}
#img_face{
	width: 50px;
	height: 50px;
	float: left;
	border-radius: 100%;
}
#p_product{
	font-size: 30px;
}
#p_price{
	font-size: 50px;

	float: left;
}
#td_space{
	height: 30px;
}
.gray{
	color: gray;
	font-size: 16px;
}
#img_heart{
	border-radius : 0px;
	width: 20px;
	height: 20px;
	margin: 0 auto;
	margin-top: 40px;
}
#div_button{
	width: 80%;
	height: 100%;
	margin: 0 auto;
	
}
#view_button1{
	background-color:  white;
}
#view_button2{
	float: right;
	background-color:  #6e9907;
	color: white;
}
#div_likes{
	border: 0.5px solid gray;
	width: 100px;
	height: 100px;
	border-radius: 100%;
	text-align: center;
	margin: 0 auto;
	vertical-align: middle;
}
	

#p_id{
	font-size: 20px;
}
#won{
	margin-top : 10px;
	font-size: 30px;
}
.img_likes{
	border-radius : 0px;
	width: 20px;
	height: 20px;
	margin-top : 100px;
/* 	border: 1px solid red; */
}
#spanLikes{
	margin-right: 10px;
	float: right;
	display: inline-block;
	border-radius: 0px;
    width: 20px;
    height: 20px;
    margin: 0 auto;
    margin-top: 40px;
}
#div_likes2{
/* 	border: 1px solid green; */
	height: 20px;
	width: 80%;
	margin: 0 auto;
}
</style>

</head>
<body>
<!-- 본 상품 이미지파일 쿠키에 저장 -->
<input type="hidden" value="${viewPicture.files1 }" id="viewpic">
<input type="hidden" value="${view.num }" id="viewnum">
<%@ include file = "../common/header.jsp" %>

<div id="view_div_outside">
<div id="view_div_inside">
	<div id="view_div_1"class="w3-content" style="max-width:500px">
	  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/${viewPicture.files1 }" alt="the book images are here">
	  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/${viewPicture.files2 }" alt="the book images are here">
	  <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/${viewPicture.files3 }" alt="the book images are here">
	    <img class="mySlides" src="${pageContext.request.contextPath}/resources/upload/${viewPicture.files4 }" alt="the book images are here">
	
	  <div class="view_div w3-row-padding w3-section">
	    <div class="view_div_img  w3-col s4">
	  	 	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files1 }" onclick="currentDiv(1)">
	    	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files2 }" onclick="currentDiv(2)">
	   	 	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files3 }" onclick="currentDiv(3)">
	  		<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files4 }" onclick="currentDiv(4)">
	    </div>
	  </div>
	</div>

	<div id="div_name">
		<table id="view_table">
			<tr>
				<td><img src="/proxyProject/resources/upload/lim.jpg" id="img_face"><p id="p_id">&nbsp;&nbsp;${view.id }</p>
								<p class="gray">&nbsp;&nbsp;&nbsp;판매자 신용도  ${viewMember.seller_trust }</p>
				</td>
			</tr>
			<tr>
				<td id="td_space"></td>
			</tr>
			<tr>
				<td><p id="p_product">${view.product }</p>
								<p class="gray">구매 날짜 :  ${view.buy_date}</p>
				</td>
				
			</tr>
			<tr>

			<%-- 	<td><h3>가격 : ${view.price } 원</h3></td> --%>

				<td id="td_space"></td>

			</tr>
			<tr>

				<td><h3>책 소개 <br></h3><span class="gray">${view.contents }</span></td>

			<%-- 	<td><p class="gray">${view.contents }</p></td> --%>

			</tr>
			<tr>

				<%-- <td><h3>좋아요 : ${view.likes }</h3></td> --%>

				<td id="td_space"></td>

			</tr>
			<tr>
				<td><p id="p_price">${view.price } </p><p id="won">원</p></td>
			</tr>
		
			<tr>
				<td id="td_space"></td>
			</tr>
			<tr>
				<td><div id="div_button"><a href="buyBook"><input type="submit"  id="view_button2"class="view_button" value="구매하기"></a><a href="sellBookList?id=${member.id }"><input type="submit" class="view_button" id="view_button1" value="목록으로" style="border: 1px solid gray;"></a></div></td>
			</tr>
			<tr>
				<td id="td_space"></td>
			</tr>
			<tr>
				<td><%-- <div id="div_likes"><p class="gray"><br><br><img src="/proxyProject/resources/image/black_heart.png" id="img_heart" onclick="change_img_to_red(${view.num})"><br><span id="spanLikes">${view.likes }</span></p></div> --%>
				   	 <div id="div_likes">
				   	  <c:set var="bool" value="false"/>
				   	  <c:set var="number"  value="${view.num }" />
		                    	  	<c:forEach var="num" begin="0" end="${heartSize }">
				                    	  	<c:if test="${number == heartV[num]}">
				                    	  		<img src="/proxyProject/resources/image/heart.jpg" class="img_likes" id="img_heart" onclick="change_img_to_red(${view.num})">
				  						<c:set var="bool" value="true"/>
				         	  				</c:if>
		         	  				</c:forEach>
	         	  					<c:if test="${bool == false}">
	         	  						<div id="div_likes2"><img src="/proxyProject/resources/image/black_heart.png" class="img_likes" id="img_heart" onclick="change_img_to_red(${view.num})"><div class="spanLike" id="spanLikes">${view.likes}</div>
									</div>
									</c:if>
									
				   	  </div>
				   	  	<script>
	                    	
                	  			var id = "${member.id}";

	                    	  	 function change_img_to_red(num) {
	          					 	
	                    /* 	  		var heart = document.getElementById("img_heart").src; */
	                    		var heart = $("#img_heart").attr("src").toString();
	                 
										if(heart =="${pageContext.request.contextPath}/resources/image/black_heart.png"){
										 	 	document.getElementById("img_heart").src = "${pageContext.request.contextPath}/resources/image/heart.jpg"; 
										 		$.ajax({
			                    					url:'changeLikesBlack',
			                    					type:'POST',
			                    					data : {id:id, num:num}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴(bookDTO)을 의미
			                    						$("#spanLikes").html(result.likes);             
			                    					},
			                    					error:function(e){
			                    						alert("eeeeeeeeeeeeeee");
			                    					}
			                    				});
										 	 }else{
										 		//여기로 들어오면 memberLikeBooks에 한줄 삭제하고 , books에 likes -1
										 		document.getElementById("img_heart").src="${pageContext.request.contextPath}/resources/image/black_heart.png";
										 		$.ajax({
			                    					url:"changeLikesRed",
			                    					type:"POST",
			                    					data : {id:id, num:num}, 	
			                    					success:function(result) {
			                    						$("#spanLikes").html(result.likes);        
			                    					},
			                    					error:function(e){
			                    						alert("eeeeeeeeeeeeeee");
			                    					}
			                    				});
										 	 }	                      	 	
	                    	  	 }
	                	 
									 </script>
									 
				</td>
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
		</table>
	</div>
	
	
</div>
</div>



<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>


	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>