<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
</h1>
<c:choose>
	<c:when test="${member !=null}">
		${member.name}님 환영합니다
		<!--  <a href="member/logout.mem">로그아웃</a>-->
		<!--  <a href="member/info.jsp">회원정보</a>-->
	</c:when>
	<c:otherwise>
	<a href="member/memberLogin">Login</a>
	<a href="member/memberJoin">SIGN UP</a>
	</c:otherwise>
</c:choose>	
	<a href="freeboard/freeboardList">freeboard</a>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
