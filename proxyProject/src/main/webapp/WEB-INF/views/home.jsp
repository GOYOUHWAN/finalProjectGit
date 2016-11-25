<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript">
		if(${message} != ' '){
			alert('${message}')
		}
	</script>
	
	
</head>
<body>
<h1>
</h1>
	
<%-- <c:choose>
	<c:when test="${member !=null}">
		${member.name}님 환영합니다 --%>
		<!--  <a href="member/logout.mem">로그아웃</a>-->
		<!--  <a href="member/info.jsp">회원정보</a>-->
	
	

		
		
<!-- 일반 회원용 -->		
<c:if test="${member.type ==1}"> 
<a href="member/myPage?type=${member.type}">마이페이지</a>
	</c:if>
	
	<!--판매자용  -->
		<c:if test="${member.type =='2'}"> 
<a href="<%=application.getContextPath() %>member/seller/myBookList?id=${member.id}">마이페이지</a>
	</c:if> 
	
	<!-- 관리자용 -->
		<c:if test="${member.type =='3'}">
<a href="<%=application.getContextPath()%>member/sub/admin/myPage?id=${member.id}">마이페이지</a>
	</c:if>
	
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
		<a href="member/memberLogin">Login</a>
		<a href="member/memberJoin">SIGN UP</a>
<%-- 	</c:otherwise> --%>
<%-- </c:choose>	 --%>
	<a href="freeboard/freeboardList">freeboard</a>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
