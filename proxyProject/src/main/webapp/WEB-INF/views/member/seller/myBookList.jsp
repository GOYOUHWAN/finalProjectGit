<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</style>
</head>
<body class="home">
	<div class="container">
		<h2>myBookList_for_seller</h2>

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
			<div class="panel-heading">MY_BOOK_LIST_forSeller</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>PRODUCT</th>
						<th>PRICE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${booklist}" var="list">
						<tr>
							<td>${list.product}</td>
							<td>${list.price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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