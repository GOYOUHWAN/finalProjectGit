<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div class="content_wrap">
		<div id="n2_nboard">
			<div class="option"></div>
			<div class="n2_skin_wrap">
				<!-- 상단 -->
				<div class="skin">
					<div class="subject">제목</div>
					<div class="date">작성일</div>
					<div class="hits">조회수</div>
				</div>
				<!-- 목록 -->
				<ul class="list">
				<c:set var="count" value="-1"/>
				<c:forEach var="notice" items="${noticeList}">
				<c:set var="count" value="${count+1}"/>	
					<li>
						<em class="num">${notice.no}</em>
						<div class="subject">
							<span>
								<a href="noticeView?no=${notice.no}">
									<span>${notice.title}</span>   
								</a>
							</span>
						</div>
						<em class="date">
							<fmt:formatDate value="${notice.reg_date}" pattern="yyyy.MM.dd" />
						</em>
						<em class="hits">${notice.hits}</em>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div id="pageing">
				<c:if test="${page.curBlock > 1 }">
					<a href="/proxyProject/notice/noticeList?page=${page.startNum-1}">[이전]&ensp;</a>
				</c:if>
				<c:forEach var="i" begin="${page.startNum}" end="${page.lastNum}"
					step="1">
					<a href="/proxyProject/notice/noticeList?page=${i}" class="page">${i}</a>
				</c:forEach>

				<c:if test="${page.curBlock < page.totalBlock}">
					<a href="/proxyProject/notice/noticeList?page=${page.lastNum+1}">&ensp; [다음]</a>
				</c:if>
				<br> <br>

				<button id="write" onclick="location.href='noticeWrite'">
					글쓰기</button>
			</div>
		</div>
	</div>
</body>
</html>