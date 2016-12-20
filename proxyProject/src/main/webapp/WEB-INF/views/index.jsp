<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">

<style type="text/css">
#s_div1{
	width: 100%;
	height: 300px;
	margin-top: 150px;
	/* border: 1px solid green; */
}
.s_div2{
	width:  200px;
	height: 100%;
	margin-left: 6%;
	float: left;
	text-align: center;
	border-radius : 15px;
	background-color : #f2f2f2;
	background-color: rgba(242, 242, 242, 0.2);
		 text-shadow: 1px 1px gray;
	
 /* 	border: 1px solid red;  */
}
#s_div3{
	width: 90%;
	height: 100%;
	margin: 0 auto;
/* 	border: 1px solid yellow; */
}
.mySlides{
	width: 200px;
	height: 250px;


}
.p_text{
	color: white;
	margin-top: 10px;
}
.class_text{
	color: white;
	 text-shadow: 1px 1px black;
}
#h3_for_black{
	font-size:  30px;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
/* 	border: 1px solid red; */
}
#p_black{
	margin-top : 100px;
	font-size: 15px;
	color: white;/* #4d4d4d; */
	margin: 0 auto;
	width: 80%;
	height: 100px;
	text-align: center;

	/* border: 1px solid red; */
}
#img_black{
	margin: 0 auto;
	margin-top: 50px;
	width: 100%;
	height: 100%;
}
#p_img{
	width: 50%;
	height: 150px;
	margin: 0 auto;
	margin-top: 100px;
/* 	border: 1px solid green; */
}
</style>
</head>
<!--  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">   -->

<body>



<div>
	<!-- Header Start -->
		
	<!-- Header End -->
	
	<!--section 시작  -->
	<section id="section_wrap">

	

	<nav id="nav_all">
	<%@ include file = "common/header.jsp" %>
	<c:if test="${member.type != '4'}">
	<div id="s_div1">
	
		<div id="s_div3">
			<div class="w3-content w3-section s_div2" style="max-width:200px" >
			<h3 class="class_text">추천</h3>
			  <img class="mySlides" src="/proxyProject/resources/upload/dogani.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/osaka.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/blood.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/harry.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/mar.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/power.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/three.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/axe.jpg" style="width:100%">
		</div>
			<script>
					var myIndex = 0;
					carousel();
					
					function carousel() {
					    var i;
					    var x = document.getElementsByClassName("mySlides");
					    for (i = 0; i < x.length; i++) {
					       x[i].style.display = "none";  
					    }
					    myIndex++;
					    if (myIndex > x.length) {myIndex = 1}    
					    x[myIndex-1].style.display = "block";  
					    setTimeout(carousel, 2500); // Change image every 2.5 seconds
					}
				</script>
			<div class="s_div2">
				<h3 class="class_text">도서 인기도</h3>
				<c:if test="${listsize >10 }">
					<c:set var="listsize" value="10"/>
				</c:if>
				<c:forEach begin="1" end="${listsize}">
					<p class="p_text"><a href="sellBook/sellBookView?num=${bookLikes[count].num}&id=${bookLikes[count].id}" class="p_text">${count+1}위&nbsp; ${bookLikes[count].product}</a></p>
						<c:set var="count" value="${count+1 }"/>
				</c:forEach>
			</div>
			<div class="s_div2">
				<h3 class="class_text">판매자 신용도</h3>
				<c:forEach begin="1" end="${listsizeT}">
					<p class="p_text">${countT+1}위&nbsp; ${sellerTrust[countT].id}</p>
						<c:set var="countT" value="${countT+1 }"/>
				</c:forEach>
			</div>
			<div class="s_div2">
				<h3 class="class_text">구매자 신용도</h3>
				<c:forEach begin="1" end="${listsizeB }">
					<p class="p_text">${countB+1 }위&nbsp; ${buyerTrust[countB].id }</p>
						<c:set var="countB" value="${countB+1 }"/>				
				</c:forEach>
			</div>
			</div>
		</div>
		</c:if>
		<c:if test="${member.type == '4' }">
			<p id="p_img"><img src="/proxyProject/resources/image/blacklist.jpg" id="img_black"></p>
			<h3 id="h3_for_black">당신은 블랙리스트입니다</h3>
			<p id="p_black">이의 신청은 02)123-1234로 전화바랍니다</p>
		</c:if>
	</nav>
	</section>	
	<!--section 끝  -->
	
	<!-- Footer Start -->
		<%@ include file = "common/footer.jsp" %>
	<!-- Footer End -->
</div>
</body>
</html>