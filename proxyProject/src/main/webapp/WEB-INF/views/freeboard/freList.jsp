<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.springframework.ui.Model"%>
<%@page
	import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@page import="com.choa.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		$('#stuck_container').tmStickUp({});
		$('.gallery .gall_item').touchTouch();

	});
</script>
<style type="text/css">
#pageing {
   width: 50%;
   height: 40px;
   margin: 0 auto;
   text-align : center;
}
.page {
   display: inline-block;
   border-radius: 0.2em;
   width: 7%;
   height: 30px;
   line-height: 35px;
   text-align: center;
   border: 1px solid #dbdada;
   background-color: #dbdada;
   color: white;
}
.mypage-menu {
	text-align: center;
	padding-top: 50px;
	min-height: 500px;
}
.mypage-content {
   width: 860px;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
   margin-bottom: 50px;
   margin: 0 auto;
}
.blacklist-header {
   width: 100%;
   float: left;
   border-bottom: 1px solid #d8d8d8;
}
#blacktitle {
   font-size: 24px;
   padding: 20px 0 20px 34px;
   float: left;
}
table{
	margin: 0 auto;
	width: 80%;
	padding-top: 20px;
}
hr{
	border: 2px solid #eee;
}
.td_1{
	border-bottom: 1px solid #eee;
	padding: 10px 10px;
	font-size: 14px;
}
.td_2{
	font-size: 16px;
	padding: 10px 10px;
}
#write{
	background-color: #6e9907;
	border: none;
	color: white;
	padding: 10px 10px;
	float: right;
	margin-bottom: 20px;
	margin-right: 80px;
}
#write:hover{
	background-color: #7dad09;
}
</style>
</head>
<body>
<!--=====================
          Content
======================-->
<section>
<div>
<!-- Header Start -->
		<%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
</div>
   <div class="mypage-menu" style="border: 1px solid red;">
   <div class="mypage-content">
      <div class="blacklist-header"><p id="blacktitle">Freeboard</p></div>

			<br>
			<table id="s_div1">
				<tr id="t1">
					<td class="td_2">NO</td>
					<td class="td_2">글제목</td>
					<td class="td_2">작성자</td>
					<td class="td_2">작성일</td>
				</tr>
				<tr>
					<td colspan="4"><hr></td>
				</tr>
				<c:set var="count" value="-1"/>
				<c:forEach var="FreeboardDTO" items="${freList}">
				<c:set var="count" value="${count+1}"/>	
					<tr class="t2">
						<td class="t21 td_1">${FreeboardDTO.no}</td>
						<td class="t22 td_1"><a href="freView?no=${FreeboardDTO.no}">
								${FreeboardDTO.title}
						</a>
							<c:if test="${replyCount[count]!='0'}">
								<span id="replyCount" class="pink">${replyCount[count]}</span> 
							</c:if>
						</td>
						<td class="t24 td_1">${FreeboardDTO.id}</td>
						<td class="t25 td_1">
						<fmt:formatDate
						value="${FreeboardDTO.date2}" pattern="yyyy-MM-dd" /></strong></td>
					</tr>
				</c:forEach>
			</table>
			<br>
				<button id="write" onclick="location.href='freWriteForm'">
					글쓰기</button>
			<div id="pageing">
				<c:if test="${page.linePerPage > 1 }">
					<a href="/proxyProject/freeboard/freList?page=${page.startNum-1}">[이전]&ensp;</a>
				</c:if>
				<c:forEach var="i" begin="${page.startNum}" end="${page.lastNum}"
					step="1">
					<a href="/proxyProject/freeboard/freList?page=${i}" class="page">${i}</a>
				</c:forEach>

				<c:if test="${page.linePerPage < page.totalBlock}">
					<a href="/proxyProject/freeboard/freList?page=${page.lastNum+1}">&ensp; [다음]</a>
				</c:if>
				<br> <br>


			</div>
		</div>
	</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</section>
</body>
</html>
