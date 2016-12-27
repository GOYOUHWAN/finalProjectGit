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
<%@ include file = "../common/header.jsp" %>
   <div class="mypage-menu">
   <div class="mypage-content">
      <div class="blacklist-header"><p id="blacktitle">블랙리스트</p></div>
				<!-- 상단 -->
			     <div class="mypage-body ng-scope2">
		         <div class="mypageodr-table-header">
		         <div class="mypageodr-header-info2"></div><div class="mypageodr-header-info2"></div>
		            <div class="mypageodr-header-info">NO</div>
		            <div class="mypageodr-header-info">제목</div>
		            <div class="mypageodr-header-info-tel">작성일</div>
		            <div class="mypageodr-header-info-tel">조회수</div>
		<!-- 목록 -->
		<c:set var="count" value="-1"/>
				<c:forEach var="notice" items="${noticeList}">
				<c:set var="count" value="${count+1}"/>	
					<tr>
						<td class="num">${notice.no}</td>
						<td class="subject">
							<span>
								<a href="noticeView?no=${notice.no}">
									<span>${notice.title}</span>   
								</a>
							</span>
						</td>
						<td class="date">
							<fmt:formatDate value="${notice.reg_date}" pattern="yyyy.MM.dd" />
						</td>
						<td class="hits">${notice.hits}</td>
				</c:forEach>
				</div>
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
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>