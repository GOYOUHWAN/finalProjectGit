<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	color: #555;
}
#info_sub_3 {
	width: 60%;
	height: 100px;
	margin: 0 auto;	
}

.btn_d_02 {
	width: 150px;
	height: 50px;
	text-align: center;
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
.mypage-menu {
    display: inline-block;
    width: 234px;
    padding: 22px 0;
    border: 1px solid #d8d8d8;
    border-radius: 3px;
    margin: 30px 14px 50px 90px;
}

.mypage-menu-item {
   padding: 8px 36px;
   display: block;
   font-size: 16px;
   color: #1f1f1f
}
.mypage-menu-item2 {
   padding: 5px 60px;
   display: block;
   font-size: 14px;
   color: #1f1f1f
}

.mypage-menu-item.active {
   font-weight: bold;
   background-color: #f5f5f5
}

.mypage-menu-hr {
   border-top: 1px solid #d8d8d8;
   margin: 10px
}
.mypage-content {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
}
.td_1 {
	width: 5%;
	height: 50px;
	text-align: left;
	font-size: 15px;
	background-color: #eeeeee;
	padding-left: 2%;
}
.td_2{
	text-align: left;
	padding-bottom: 15px;
	padding-top: 15px;
	font-size: 14px;
	padding-left: 4%;
}
.td_3{
	width: 4%;
	text-align: justify;
	font-weight: bold;
	padding-left: 4%;
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
	<div class="mypage-menu">
		<a class="mypage-menu-item active" href="${pageContext.request.contextPath }/blackList/blackmView?id=${blackm.id}">블랙 회원 정보</a> 
		<div class="mypage-menu-item"><a href="${pageContext.request.contextPath }/blackList/singoView?sid=${blackm.id}" style="color: gray;">신고 글 보기</a></div>
	</div>
	<div class="mypage-content">
		<div class="mypage-header">블랙리스트 회원정보
<p style="color: gray; font-size:14px; margin-top: 10px;">신고되어 블랙리스트에 올라온 회원 정보입니다.</p></div>
<!-- 		<div id="info_sub_2"> -->
			<table>
<%-- 				<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<!-- type -->
				<tr>
					<td class="td_1">type</td>
					<td id="getType">${ blackm.type }</td>
				</tr>
				</c:if> --%>
				<!-- 아이디 -->
				<tr>
					<td class="td_3">기본정보</td>
					<td class="td_1">아이디</td>
				</tr>
				<tr>
					<td rowspan="8" class="bottom-hr"></td>
					<td id="getId" class="td_2" style="color: #C40303; font-size: 15px; font-weight: bold;">${ blackm.id }</td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">이름</td></tr>
				<tr><td class="td_2">${ blackm.name }</td>
				</tr>
				<!-- 휴대폰 번호 -->
				<tr>
					<td class="td_1">휴대폰 번호</td></tr>
				<tr><td class="td_2">${ blackm.tel }</td>
				</tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td></tr>
				<tr><td class="td_2">${ blackm.email }</td>
				</tr>
			</table>
		</div>
		<div id="info_sub_3">
			<button class="btn_d_02" id="btn4" style="margin-left: 90px;">목록으로</button>
			<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<button class="btn_d_02" id="btn5">TYPE 변경</button>
			</c:if>
		</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>