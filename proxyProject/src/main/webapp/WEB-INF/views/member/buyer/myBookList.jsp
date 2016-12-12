<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>MY_BOOK_LIST</title>

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
	<div id="sub_3">
			<a href="myBookList?id=${member.id }"><button class="btn_d_2" id="btn4" tabindex="4">myBookList(내가 좋아요한 글)</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_2" id="btn5" tabindex="5">myBoardList</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_2" id="btn6" tabindex="6">myBuyList</button></a>
		</div>
	<div class="container">
	<div id="div_container_2">
	<div id="div_container_3">
		<div id="div_title"><h2>나의 좋아요 리스트</h2></div>
		<%-- <form action="findList" method="post" role="search">
			<div class="row">
				<div class="col-lg-2">
					<select name="type" class="form-control">
						<option value="title">TITLE</option>
						<option value="writer">WRITER</option>
						<option value="contents">CONTENTS</option>
					</select>
				</div>
				<div class="col-lg-3">
					<div class="input-group">
						<input type="hidden" name="board" value="${board}"> 
						<input type="text" name="find" class="form-control" placeholder="Search for...">
						<span ><input type="submit" ></span>
					</div>
				</div>
			</div>
		</form> --%>
		

		<div class="panel panel-default">
			<!-- Default panel contents -->
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>PRODUCT</th>
						<th>WRITER</th>
						<th>PRICE</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${booklist != null}">
							<c:forEach items="${booklist}" var="list">
								<tr>
									<td>${list.product}</td>
									<td>${list.id}</td>
									<td>${list.price }</td>
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
	<!-- Footer:S -->
	<!-- Footer:E -->	
	
</body>
</html>