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
<%@ include file = "../common/header.jsp" %>
   <div class="mypage-menu">
   <div class="mypage-content">
      <div class="blacklist-header"><p id="blacktitle">공지사항</p></div>
				<!-- 상단 -->
			     <div class="mypage-body ng-scope2">
		         <div class="mypageodr-table-header">
		         <div class="mypageodr-header-info2"></div><div class="mypageodr-header-info2"></div>
		            <div class="mypageodr-header-info">NO</div>
		            <div class="mypageodr-header-state">제목</div>
		            <div class="mypageodr-header-tel">작성일</div>
		            <div class="mypageodr-header-tel2">조회수</div>
				</div>
		<!-- 목록 -->
		<div class="mypage-item-wrapper ng-scope">
			<c:set var="count" value="-1"/>
				<c:forEach var="notice" items="${noticeList}">
				<c:set var="count" value="${count+1}"/>	
					<div style="border-bottom: 1px solid #eee; text-align: left; padding-left: 50px;">
                     <div class="mypageodr-item-state mypageodr-item-state-title ng-binding">${notice.no}</div>
                     <div class="mypageodr-header-info2"></div>
                     <div class="mypageodr-item-tel mypageodr-item-state-title ng-binding">
                        <a href="noticeView?no=${notice.no}">${notice.title}</a></div>
                        <!-- <div class="mypageodr-header-info2"></div> -->
                     <div class="mypageodr-item-price mypageodr-item-state-title ng-binding">
                     <fmt:formatDate value="${notice.reg_date}" pattern="yyyy.MM.dd" /></div>
					 <div class="mypageodr-item-price mypageodr-item-state-title ng-binding">${notice.hits}</div>
					</div>
				</c:forEach>
			</div>
							<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<button id="write" onclick="location.href='noticeWrite'">
					글쓰기</button>
				</c:if>
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
			</div>
		</div>
	</div>
	</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>