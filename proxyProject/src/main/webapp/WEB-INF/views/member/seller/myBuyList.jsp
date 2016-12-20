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
<!-- <script type="text/javascript">
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
	
	
	
</script>	 -->
<!--  ================================================-->	
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

</style>
</head>
<body class="home">
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
						<span class="input-group-btn"><button type="submit" class="btn btn-default">Submit</button></span>
					</div>
				</div>
			</div>
		</form> --%>
		
		
		<div class="panel panel-default">
			<!-- Default panel contents -->
			
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>책 제목</th>
						<th>가격</th>
						<th>구매 날짜</th>
						
						<th><div id="div_th">주문상태</div><div class="dropup"><button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						  
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						   	  <li role="presentation">- 입금대기중</li>
						      <li role="presentation">- 결제완료</li>
						      <li role="presentation">- 배송중</li>
						      <li role="presentation">- 구매확정</li>
						    </ul>
						  </div>
					<!-- 	<div id="div_status">
						-입금대기중<br>
						-결제완료<br>
						-배송준비중<br>
						-배송완료<br>
						-구매확정<br>
						</div> --></th>
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
								<td><a href="deposit?id=${member.id}&price=${list.price}&num=${list.num}&id=${list.id}"><button id="deposit"> 입금하기 </button></a>
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
	<%@ include file = "../../common/footer.jsp" %>
	<!-- Footer:E -->	
	
</body>
</html>