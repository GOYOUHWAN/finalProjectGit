<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<style type="text/css">
#s_div1{
	width: 100%;
	height: 200px;
	padding-left: 11%;
}
.s_div2{
	width: 18%;
	height: 100%;
	margin-left: 6%;
	background-color: pink; /*  */
	float: left;
	text-align: center;
}

</style>
</head>
<body>
<div>
	<!-- Header Start -->
		<%@ include file = "common/header.jsp" %>
	<!-- Header End -->
	
	<!--section 시작  -->
	<section id="section_wrap">
	<nav id="nav_all">
		<nav id="nav_1">
			<div id="div_1">
				<a href="restaurant/restaurantlist.res"><img src="" id="logo"></a>
			</div>
		</nav>
		<div id="s_div1">
			<div class="s_div2">
				인기도
			</div>
			<div class="s_div2">
				판매자 신용도
			</div>
			<div class="s_div2">
				구매자 신용도
			</div>
		</div>
	</nav>
	</section>	
	<!--section 끝  -->
	
	<!-- Footer Start -->
		<%@ include file = "common/footer.jsp" %>
	<!-- Footer End -->
</div>
</body>
</html>