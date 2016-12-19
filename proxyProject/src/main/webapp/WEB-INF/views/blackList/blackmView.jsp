<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#info_div {
	width: 80%;
	height: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

#info_sub_1 {
	width: 80%;
	height: 100px;
	margin: 0 auto;
}

.btn_d_1 {
	width: 33.3%;
	height: 50px;
	margin: 0 auto;
	margin-top: 50px;
	float: left;	
	font-size: 20px;
	background-color: #A5E0EB;
	border: 1px solid #A5E0EB;
	color: #555;
	outline: none;
}

.btn_d_1:HOVER {
	background-color: #00ace6;
	border: 1px solid #00ace6;
	color: white;
}

#info_sub_2 {
	width: 80%;
	height: 600px;
	margin: 0 auto;
}

#sub_div_1 {
	width: 100%;
	height: 70%;
}

#sub_div_2 {
	width: 100%;
	height: 30%;
}

table {
	border: 1px solid #cccccc;
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 80%;
	height: 100%;
	margin: 0 auto;
	color: #555;
}

.img_1 {
	margin-left: 0px;
}

.sub_table_2 {
	border: 1px solid #cccccc;
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	color: #555;
}

.td_1 {
	width: 25%;
	height: 50px;
}

#like1 {
	font-weight: bold;
	font-size: 20px;
	float: left;
	margin-left: 75px;
	color: black;
}

#like2 {
	font-weight: bold;
	font-size: 20px;
	float: left;
	margin-left: 65px;
	color: black;
}

.like3 {
	font-size: 13px;
	float: right;
	color: red;
	margin-right: 30px;	
}

.categ1 {
	margin-left: 20px;
	width: 60%;
	height: 20px;
}

.categ2 {
	margin-left: 20px;
	width: 100px;
	height: 20px;
}

.categ3 {
	width: 90px;
	height: 20px;
}	

#info_sub_3 {
	width: 80%;
	height: 100px;
	margin: 0 auto;	
}

.btn_d_02 {
	width: 150px;
	height: 50px;
	margin: 0 auto;
	margin-top:20px;
	margin-bottom: 50px;
	float: left;	
	font-size: 15px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
}

.btn_d_02:HOVER {
	background-color: #737373;
	border: 1px solid white;
	color: white;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
		$(function() {
			
			$("#btn1").css("background-color", "#00ace6");
			$("#btn1").css("color", "white");
	
			//목록으로
			$("#btn4").click(function() {
				location.href = "blackListForm";
			});
	
			// 회원 정보 변경
			$("#btn5").click(function() {
				location.href = "blackmUpdate?id=${blackm.id}";
			});
		});
	</script>
	
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
<!-- info -->
	<div id="info_div">
<h2 style="text-align: center;margin-bottom:30px;">회원정보</h2>
		<div id="info_sub_2">
			<table>
				<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<!-- type -->
				<tr>
					<td class="td_1">type</td>
					<td id="getType">${ blackm.type }</td>
				</tr>
				</c:if>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">아이디</td>
					<td id="getId">${ blackm.id }</td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">이름</td>
					<td>${ blackm.name }</td>
				</tr>
				<!-- 나이 -->
				<tr>
					<td class="td_1">생년월일</td>
					<td>${ blackm.year }</td>
				</tr>
				<!-- 휴대폰 번호 -->
				<tr>
					<td class="td_1">휴대폰 번호</td>
					<td>${ blackm.tel }</td>
				</tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td>
					<td>${ blackm.email }</td>
				</tr>
				<!-- 주소 -->
				<tr>
					<td class="td_1">Address</td>
					<td>${ blackm.address }</td>
				</tr>
			</table>
		</div>
		<div id="info_sub_3">
			<button class="btn_d_02" id="btn4" style="margin-left: 90px;">목록으로</button>
			<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<button class="btn_d_02" id="btn5">정보 변경</button>
			</c:if>
		</div>
	</div>
</body>
</html>