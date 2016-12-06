<jsp:useBean id="message" class="java.lang.String" scope="request" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>

<body>
 <c:choose>
	<c:when test="${member !=null}">
		
<h2>${member.name}님 환영합니다</h2> 
		 
 <a href="memberLogout">로그아웃</a>

  <a href="member/memberView">회원정보</a>

<!-- 일반 회원용 -->		
<c:if test="${member.type =='1'}"> 
<a href="<%=application.getContextPath() %>/member/buyer/myPage?type=${member.type}&id=${member.id}">마이페이지</a>
	<a href="${pageContext.request.contextPath}/freeboard/freList">freeboard</a>
<a href="member/buyer/myBookList?id=${member.id }"> myBookList</a>
	</c:if>
	
	<!--판매자용  -->
		<c:if test="${member.type =='2'}"> 
<a href="<%=application.getContextPath() %>/member/seller/myPage?type=${member.type}&id=${member.id}">마이페이지</a>
	<a href="${pageContext.request.contextPath}/freeboard/freList">freeboard</a>
<a href="member/buyer/myBookList?id=${member.id }"> myBookList</a>
	</c:if> 
	
	<!-- 관리자용 -->
		<c:if test="${member.type =='3'}">
<a href="<%=application.getContextPath()%>/member/manager/manageMember?type=${member.type}&id=${member.id}">관리자페이지</a>
	</c:if>
	
	</c:when>
	<c:otherwise>
		<a href="member/memberLogin">Login</a>
		<a href="member/memberJoin">SIGN UP</a>
	</c:otherwise>
</c:choose>	

	<a href="freeboard/freeboardList">freeboard</a>


	<a href="sellBook/sellBookList">sellBookList</a> 

	 <a href="member/buyer/myBookList?id=${member.id }"> myBookList</a>
	<a href="sellBook/sellBookList">sellBookList</a>


	
<<<<<<< HEAD
<%-- 	</c:otherwise> --%>
<%-- </c:choose>	 --%>
=======

	<a href="${pageContext.request.contextPath}/freeboard/freList">freeboard</a>
>>>>>>> branch 'master' of https://github.com/GOYOUHWAN/finalProjectGit.git




<a href="index">index</a>
\
<a href="test">test_for_ajax</a>


</body>
</html>
