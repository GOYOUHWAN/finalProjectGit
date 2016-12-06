<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<style type="text/css">
.btn_d_2 {
	width: 25%;
	height: 50px;
	margin: 0 auto;
	margin-top: 50px;
	float: left;
	font-size: 15px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
}

.btn_d_2:HOVER {
	background-color: #737373;
	border: 1px solid white;
	color: white; 
	outline: none;
}
</style>
</head>
<body>
<!-- Header Start -->
		<%@ include file = "../../common/header.jsp" %>
	<!-- Header End -->

<h2> 판매자용 myPage</h2>
		<div id="sub_3">
			<a href="myBookList?id=${member.id }"><button class="btn_d_2" id="btn4" tabindex="4">myBookList(내가 팔고있는 책들)</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_2" id="btn5" tabindex="5">myBoardList(내가 쓴 글들)</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_2" id="btn6" tabindex="6">myBuyList(내가 산 책들)</button></a>
			<a href="/proxyProject"><button class="btn_d_2" id="btn7" tabindex="7">HOME</button></a>
		</div>


<!-- Footer Start -->
		<%@ include file = "../../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>