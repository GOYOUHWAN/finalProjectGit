<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<title>Insert title here</title>
<style type="text/css">
#info_div {
	width: 80%;
	margin: 0 auto;
	margin-top: 70px;
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
	margin: 0 auto;
}

#sub_div_1 {
	width: 100%;
	height: 70%;
}

#sub_div_2 {
	width: 100%;

}

table {
	border: 1px solid #cccccc;
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 80%;
	height: 500px;
	margin: 0 auto;
	color: #555;
}

.td_1 {
	width: 25%;
	height: 50px;
}
.td_2 {
	width: 70%;
	height: 50px;
	padding-left: 50px;
	padding-right: 50px;
}
#info_sub_3 {
	width: 64%;
	height: 100px;
	margin: 0 auto;	
}

.btn_d_02 {
	width: 150px;
	height: 50px;
	margin: 0 auto;
	margin-bottom: 50px;
	float: left;	
	font-size: 15px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
	margin-top: 20px;
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
			// HOME
			$("#btn4").click(function() {
				location.href = "${pageContext.request.contextPath}/blackList/blackListForm";
			});
			
 			// 회원 정보 변경
			$("#btn5").click(function() {
				location.href = "${pageContext.request.contextPath}/blackList/blackmView?id=${blackDTO.sid}";
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
		<p style="width: 100%; float: left; text-align: center; font-size: 24px; margin-bottom: 30px;">신고 내용</p>
		<div id="info_sub_2">		
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">사기꾼 아이디</td>
					<td id="getId">${ blackDTO.sid }</td>
				</tr>
				<!-- title -->
				<tr>
					<td class="td_1">제목</td>
					<td>${ blackDTO.title }</td>
				</tr>
				<!-- contents -->
				<tr>
					<td class="td_1">내용</td>
					<td class="td_2">${ blackDTO.contents}</td>
				</tr>
				<tr><td class="td_1"></td><td class="td_1"></td></tr>
			</table>
		</div>
		<div id="info_sub_3">
			<button class="btn_d_02" id="btn4">목록으로</button>
			<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<button class="btn_d_02" id="btn5">회원 정보</button>
			</c:if>
		</div>
	</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>