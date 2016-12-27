<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>MY_BOOK_LIST_BUYER</title>

<style>
body{
	line-height: 1;
    color: #414141;
    font-family: "Helvetica", "Arial", sans-serif;
    /* background: #f5f5f5; */
}
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
a:hover{
	text-decoration: underline;
	color: white;
}
</style>
</head>
<body class="home">
<%@ include file = "../../common/header.jsp" %>
<div id="div_page">
	<div id="sub_4">
			<a href="myBookList?id=${member.id }"><button class="btn_d_3" id="btn4" tabindex="4">좋아요 내역</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_3" id="btn5" tabindex="5">게시판 글 내역</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_3" id="btn6" tabindex="6">구매 내역</button></a>
			<a href="buyerUpgrade?id=${member.id }"><button class="btn_d_3" id="btn7" tabindex="7">판매자등록</button></a>
		</div>
	<div class="container">
	<div id="div_container_2">
	<div id="div_container_3">
		<div id="div_title"><h2>나의 좋아요 리스트</h2></div>
	

		<div class="panel panel-default">
			<!-- Default panel contents -->
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>책</th>
						<th>판매자ID</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${booklist != null}">
							<c:forEach items="${booklist}" var="list">
								<tr>
									<td><a href="../../sellBook/sellBookView?num=${list.num}&id=${list.id}">${list.product}</a></td>
									<td>${list.id}</td>
									<td>${list.price }원</td>
								</tr>
							</c:forEach>
					</c:when>
					<c:otherwise>
						<h3>아직 좋아요 리스트가 없습니다.</h3>
					</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	 	</div>
	 	</div>
	 	</div>
	 </div>
	<!-- Footer:S -->
	<!-- Footer:E -->	
	<%@ include file = "../../common/footer.jsp" %>
</body>
</html>