<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MY_BOARD_LIST</title>

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
		<h2>myBoardList_for_seller</h2>

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
			<div class="panel-heading">MY_BOARD_LIST</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>PRODUCT</th>
						<th>WRITER</th>
						<th>PRICE</th>
						<th>DATE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${myBoardList}" var="list">
						<tr>
							<td>${list.id}</td>
							<td>${list.title}</td>
							<td>${list.content}</td>
							<td>${list.date2 }</td>
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