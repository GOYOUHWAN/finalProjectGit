<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
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
		<div id="div_title"><h2>내가 쓴 글 리스트</h2></div>
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
						<th>글번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>

				<c:when test="${myBoardList != null}">
					<c:forEach items="${myBoardList}" var="list">
						<tr>
							<td>${list.no}</td>
							<td>${list.title}</td>
							<td>${list.content }</td>
							<td>${list.date2 }</td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<td><h3>아직 작성한 글이 없습니다.</h3></td>
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
	<%@ include file = "../../common/footer.jsp" %>
	<!-- Footer:E -->	
	
</body>
</html>