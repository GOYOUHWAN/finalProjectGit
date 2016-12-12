<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY_BUY_LIST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#div_status").hide();
	});

	$(function() {
		$("#order_status").mouseover(function() {
			$("#div_status").show();
		});
	});
	
	$(function() {
		$("#order_status").mouseout(function() {
			$("#div_status").hide();
		});
	});//btn
</script>	
<!--  ================================================-->	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
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
</style>
</head>
<body class="home">
<%@ include file = "../../common/header.jsp" %>
<div id="sub_3">
			<a href="myBookList?id=${member.id }"><button class="btn_d_2" id="btn4" tabindex="4">myBookList(내가 팔고있는 책들)</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_2" id="btn5" tabindex="5">myBoardList(내가 쓴 글들)</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_2" id="btn6" tabindex="6">myBuyList(내가 산 책들)</button></a>
		</div>

	<div class="container">
		<h2>myBuyList_for_seller</h2>

		<form action="findList" method="post" role="search">
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
						<span class="input-group-btn"><button type="submit" class="btn btn-default">Submit</button></span>
					</div>
				</div>
			</div>
		</form>
		
		
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">MY_BUY_LIST</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>구매 날짜</th>
						<th>책 제목</th>
						<th>가격</th>
						<th id="order_status">주문상태	</th>
						<th>
						<div id="div_status">
						-입금대기중<br>
						-결제완료<br>
						-배송준비중<br>
						-배송완료<br>
						-구매확정<br>
						</div></th>
					
					</tr>
				</thead>
			<tbody>
					<c:forEach items="${buylist}" var="list">
						<tr>
							<td>${list.buy_date}</td>
							<td>${list.product}</td>
							<td>${list.price }</td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	 </div>
	<!-- Footer:S -->
	<!-- Footer:E -->	
	
</body>
</html>