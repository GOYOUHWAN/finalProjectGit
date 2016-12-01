<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#sub_3 {
	width: 80%;
	height: 100px;
	margin: 0 auto;
}

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
<h2> 판매자용 myPage</h2>
<div id="sub_3">
			<a href="myBookList?id=${member.id }"><button class="btn_d_2" id="btn4" tabindex="4">myBookList(내가 팔고있는 책들)</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_2" id="btn5" tabindex="5">myBoardList(내가 쓴 글들)</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_2" id="btn6" tabindex="6">myBuyList(내가 산 책들)</button></a>
			<a href="/proxyProject"><button class="btn_d_2" id="btn7" tabindex="7">HOME</button></a>
		</div>




</body>
</html>