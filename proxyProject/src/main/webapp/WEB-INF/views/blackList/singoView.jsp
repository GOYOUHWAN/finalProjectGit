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

#sub_div_1 {
	width: 100%;
	height: 70%;
}

#sub_div_2 {
	width: 100%;

}

table {
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	margin: 0 auto;
	color: #555;
}

.td_1 {
	width: 10%;
	height: 50px;
	text-align: center;
	font-size: 15px;
	background-color: #eeeeee;
}
.td_2{
	text-align: left;
	padding-bottom: 20px;
	padding-top: 20px;
	font-size: 14px;
	padding-left: 4%;
	padding-right: 4%;
	border-bottom: 1px solid #eee;
}
.td_3{
	width: 20%;
	text-align: justify;
	font-weight: bold;
	padding-left: 2%;
	font-size: 18px;
	padding-top: 6px;
	color: #C40303;
}
#info_sub_3 {
	width: 45%;
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
	<div class="mypage-menu">
		<a class="mypage-menu-item" href="${pageContext.request.contextPath }/blackList/blackmView?id=${blackDTO.sid}" style="color:gray;">블랙 회원 정보</a> 
		<div class="mypage-menu-item active"><a href="${pageContext.request.contextPath }/blackList/singoView?sid=${blackDTO.sid}" style="color: gray;">신고 글 보기</a></div>
	</div>
	<div class="mypage-content">
		<div class="mypage-header">신고글 내용</div>
			<table>
				<!-- 아이디 -->
				<tr>
					<td id="getId" class="td_3">${ blackDTO.sid }<p style="color: gray; font-size: 12px;">(사기꾼 아이디)</p></td>
					<td class="td_1">날짜</td>
					<td class="td_2">${blackDTO.reg_date }</td>
				</tr>
				<tr>
					<td class="td_3" rowspan="6"></td>
					<td class="td_1">제목</td>
					<td class="td_2">${ blackDTO.title }</td>
				</tr>
				<!-- contents -->
				<tr>
					<td class="td_1">내용</td>
					<td class="td_2" style="line-height:200%">${ blackDTO.contents}</td>
				</tr>
			</table>
		</div>
		<div id="info_sub_3">
			<button class="btn_d_02" id="btn4">목록으로</button>
			<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<button class="btn_d_02" id="btn5">회원 정보</button>
			</c:if>
		</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>