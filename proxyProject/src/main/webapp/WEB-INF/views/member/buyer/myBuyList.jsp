<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 

<title>MY_BUY_LIST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ================================================-->	
<style>
/* #sub_3 {
	width: 50%;
	height: 100px;
	margin: 0 auto;
	border: 1px solid red;
} */
img, ul, li{
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
.center-block {
	margin-left: 40%;
}

tr, th {
	width: 227px;
	height: 40px;
	margin: 0 auto;

}

#div_th{
	float: left;
	margin-top: 20px;

}
#header_div_5{
	width : 100%;
	height : 50px;
	display: inline-block;
	text-align: center;
/* 	border: 1px solid red; */
}
#h_ul2{
	height: 35px;
}


</style>
</head>
<body >
<%@ include file = "../../common/header.jsp" %>
<div id="sub_3">
			<a href="myBookList?id=${member.id }"><button class="btn_d_2" id="btn4" tabindex="4">좋아요 내역</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_2" id="btn5" tabindex="5">게시판 글 내역</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_2" id="btn6" tabindex="6">구매 내역</button></a>
		</div>
	<div class="container">
	<div id="div_container_2">
	<div id="div_container_3">
		<div id="div_title"><h2>구매내역</h2></div>
		
	
		
		
		<div class="panel panel-default">
			<!-- Default panel contents -->
			
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>책 제목</th>
						<th>가격</th>
						<th>구매 날짜</th>
						<th>주문상태</th>
						<th>기타</th>
					
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when  test="${buylist != null}">
						<c:forEach items="${buylist}" var="list">
							<tr>
								
								<td><a href="<%=application.getContextPath()%>/sellBook/sellBookView?id=${list.id}&num=${list.num}">
										${list.product}</a></td>
								<td>${list.price }</td>
								<td>${list.buy_date}</td>
								<td>${list.status}</td>
								<td><a href="depositWrite?id=${member.id}&price=${list.price}&num=${list.num}&id=${list.id}"><button id="deposit"> 입금하기 </button></a>
								
							</tr>
						</c:forEach>
						</c:when>
							<c:otherwise>
							<h3>아직 구매중인 내역이 없습니다</h3>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		</div>
	 </div>
	 </div>
	<!-- Footer:S -->
	<!-- Footer:E -->	
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>