<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css" rel="stylesheet">
<script type="text/javascript">
 	var message = "${message}";
	if(message != ''){
		alert(message);
	}
	$(function(){
		$("#wrBtn").click(function(){
			location.href="${pageContext.request.contextPath}/freeboard/freeboardWrite";
		});
	}); 
</script>
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
	<div class="container">
		<h2>자유게시판입니다.</h2>

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
			<div class="panel-heading">FREEBOARD</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>DATE</th>
						<th>VIEW</th>
						<th>CATEGORY</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.num}</td>
							<td><c:forEach begin="1" end="${list.depth}">
						&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach> <a
								href="${pageContext.request.contextPath}/freeboard/freeboardView?num=${list.num}">${list.title}</a>
							</td>
							<td>${list.writer}</td>
							<td>${list.reg_date}</td>
							<td>${list.counts}</td>
							<td>${list.category}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="${pageContext.request.contextPath}/freeboard/freeboardWrite">글쓰기</a>
		</div>
		<div class="center-block">
			<!-- PAGINATIOIN:S -->
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><c:if test="${paging.curBlock > 1}">
							<a class="N_pageing"
								href="freeboardList?curPage=${paging.startNum-1}&perPage=10">&laquo;</a>
						</c:if></li>
					<li><c:forEach begin="${paging.startNum}" step="1"
							end="${paging.lastNum}" var="i">
							<a class="N_pageing"
								href="freeboardList?curPage=${i}&perPage=10">${i}</a>

						</c:forEach></li>
					<li><c:if test="${paging.curBlock < paging.totalBlock}">
							<a class="N_pageing"
								href="freeboardList?curPage=${paging.lastNum+1}&perPage=10">&raquo;</a>
						</c:if></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<!-- PAGINATIOIN:E -->
		</div>
		<c:if test="${sessionScope.member ne null }">
		<div class="col-md-4">
			<input type="button" value="글쓰기" id="wrBtn" class="btn btn-info">
		</div>
		</c:if>
	</div>
	<!-- Footer:S -->
	<!-- Footer:E -->	
	
</body>
</html>