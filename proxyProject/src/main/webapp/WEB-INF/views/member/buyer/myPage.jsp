<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<title>Insert title here</title>
<style type="text/css">
#sub_3 {
	width: 60%;
	height: 100px;
	margin: 0 auto;
}


.btn_d_2 {
	float : left;
	width: 33.333333%;
	height: 50px;
	margin: 0 auto;
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
<%@ include file = "../../common/header.jsp" %>
	
		<div id="sub_3">
			<a href="myBookList?id=${member.id }"><button class="btn_d_2" id="btn4" tabindex="4">myBookList(내가 좋아요한 글)</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_2" id="btn5" tabindex="5">myBoardList</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_2" id="btn6" tabindex="6">myBuyList</button></a>
		</div>





</body>
</html>