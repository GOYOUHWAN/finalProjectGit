<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.choa.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		var message='${message}';
		if(message!=''){
			alert(message);
		}
});
</script>
</head>
<body>
	<!-- Header Start -->
		<%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
	<div style="height: 200px;"></div>	
	<section>
		<div>
			<h2>blackList~</h2><br>
			<table>
				<tr>
					<th><strong>NO</strong></th>
					<th><strong>아이디</strong></th>
					<th><strong>연락처</strong></th>
					<th><strong>작성일</strong></th>
				</tr>
				<c:forEach var="BlackDTO" items="${blackList}">
					<tr>
						<td>${BlackDTO.no}</td>
						<td><a href="blackView?no=${BlackDTO.no}">
								${BlackDTO.title}
						</a></td>
						<td>${BlackDTO.id}</td>
						<td>
						<fmt:formatDate
						value="${BlackDTO.reg_date}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</c:forEach>
			</table>

			<br>
			<div>
				<c:if test="${page.linePerPage > 1 }">
					<a href="/proxyProject/freeboard/freList?page=${page.startNum-1}">[이전]&ensp;</a>
				</c:if>
				<c:forEach var="i" begin="${page.startNum}" end="${page.lastNum}"
					step="1">
					<a href="/proxyProject/freeboard/freList?page=${i}">${i}</a>
				</c:forEach>

				<c:if test="${page.linePerPage < page.totalBlock}">
					<a href="/proxyProject/freeboard/freList?page=${page.lastNum+1}">&ensp; [다음]</a>
				</c:if>
				<br> <br>
			</div>
		</div>
	</section>
	<a href="singoForm">신고하기</a>
</body>
</html>