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
#s_div1{
	width: 100%;
	height: 300px;
	margin-top: 280px;
	border: 1px solid green;
}
#write{
	width: 10%;
	float: right;
	background-color: #6e9907;
	color: white;
	border: none;
	padding: 10px 10px;
}
#write:hover{
	background-color: #7dad09;
}
#pageing {
   width: 50%;
   height: 40px;
   margin: 0 auto;
   text-align : center;
}
.page {
   display: inline-block;
   color: black;
   border-radius: 0.2em;
   width: 7%;
   height: 40px;
   line-height: 35px;
   text-align: center;
   border: 1px solid #B4B4B4;
}
#t1 td {
	border-bottom: 1px solid black;
	padding: 12px;
	padding-left: 20px;
	text-align:center;
}

.t2 td {
	border-bottom: 1px dotted gray;
	padding: 12px;
	padding-left: 20px;
}

.t21{
	width:7%;
	color:gray;
	text-align:center;
}
.t22{
	width:55%;
	margin-left: 30px;
	
}
.t23,.t24{
	text-align:center;
	color:gray;
}
.t25{
	width:15%;
	color : gray;
	text-align :center;
}
table {
	width: 90%;
	margin: 0px auto;
	border-spacing: 0px;
	border-collapse: collapse;
}
</style>
</head>

<!--=====================
          Content
======================-->
<section>
<div>
<!-- Header Start -->
		<%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
</div>
	
		<div>
			<h2>Freeboard</h2>

			<br>
			<table id="s_div1">
				<tr id="t1">
					<td>NO</td>
					<td>글제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<c:set var="count" value="-1"/>
				<c:forEach var="FreeboardDTO" items="${freList}">
				<c:set var="count" value="${count+1}"/>	
					<tr class="t2">
						<td class="t21">${FreeboardDTO.no}</td>
						<td class="t22"><a href="freView?no=${FreeboardDTO.no}">
								${FreeboardDTO.title}
						</a>
							<c:if test="${replyCount[count]!='0'}">
								<span id="replyCount" class="pink">${replyCount[count]}</span> 
							</c:if>
						</td>
						<td class="t24">${FreeboardDTO.id}</td>
						<td class="t25">
						<fmt:formatDate
						value="${FreeboardDTO.date2}" pattern="yyyy-MM-dd" /></strong></td>
					</tr>
				</c:forEach>
			</table>

			<br>
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

				<button id="write" onclick="location.href='freWriteForm'">
					글쓰기</button>
		</div>
	</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</section>
</body>
</html>
