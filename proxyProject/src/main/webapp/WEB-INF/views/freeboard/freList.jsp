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

<script>
	$(document).ready(function() {

		$().UItoTop({
			easingType : 'easeOutQuart'
		});
		$('#stuck_container').tmStickUp({});
		$('.gallery .gall_item').touchTouch();

	});
</script>
<style type="text/css">
</style>
</head>

<!--=====================
          Content
======================-->
<section>
	<div>
		<div>
			<h2>Freeboard</h2>

			<br>
			<table>
				<tr>
					<th><strong>NO</strong></th>
					<th><strong>글제목</strong></th>
					<th><strong>작성자</strong></th>
					<th><strong>작성일</strong></th>
				</tr>
				<c:set var="count" value="-1"/>
				<c:forEach var="FreeboardDTO" items="${freList}">
				<c:set var="count" value="${count+1}"/>	
					<tr>
						<td>${FreeboardDTO.no}</td>
						<td><a href="freView?no=${FreeboardDTO.no}">
								${FreeboardDTO.title}
						</a>
							<c:if test="${replyCount[count]!='0'}">
								<span id="replyCount" class="pink">${replyCount[count]}</span> 
							</c:if>
						</td>
						<td>${FreeboardDTO.id}</td>
						<td>
						<fmt:formatDate
						value="${FreeboardDTO.date2}" pattern="yyyy-MM-dd" /></strong></td>
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

				<button onclick="location.href='freWriteForm'">
					글쓰기</button>
		</div>
	</div>
</section>
</body>
</html>
