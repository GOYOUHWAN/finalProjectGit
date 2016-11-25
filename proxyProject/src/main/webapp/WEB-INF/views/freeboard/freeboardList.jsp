<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src=${pageContext.request.contextPath}/js/main/main.js"></script>

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
<script type="text/javascript">
	
window.onload = function() {	
	$(".page").each(function() {
		if ($(this).text() == "${curPage}") {
			$(this).css("background-color", "#FF6E57");
			$(this).css("color", "white");
		}
	});
};
</script>
<style type="text/css">
<
style type ="text/css">table a {
	color: #00e6e6;
	font-size: 20px;
	font-weight: bolder;
}

#table {
	margin: 0 auto;
	width: 80%;
	height: 300px;
	border-collapse: collapse;
	border-spacing: 0px;
	border: none;
}
#pageing {
   width: 50%;
   height: 40px;
   margin: 0 auto;
   text-align : center;
}
#div_table {
	width: 1000px;
	height: 1000px;
	margin: 0 auto;
	margin-top: 100px;
}

#td1_table2 {
	width: 70%;
}

#td1_table1 {
	width: 20%;
}
#td1_table3{
	width: 10%;
}
#td_table_bottom {
	border-bottom: 3px solid white;
	margin-bottom: 100px;
	text-align: right;
}

#textarea {
	width: 100%;
	height: 100%;
	font-family: 맑은 고딕;
	background-color: #e6e6e6;
	font-size: 30px;
	font-stretch: narrower;
	border: 0px solid red;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow-x: hidden;
	overflow-y: hidden;
}

#td_textarea {
	width: 75%;
	height: 150px;
	max-height: 150px;
	font-size: 16px;
	overflow: hidden;
}

#td_submit {
	height: 80px;
	text-align: center;
}

#td_page {
	text-align: center;
}

#qna_title {
	font-size: 40px;
	text-align: center;
	margin-top: 100px;
}
.page {
   display: inline-block;
   color: black;
   border-radius: 0.2em;
   width: 7%;
   height: 40px;
   line-height: 35px;
   text-align: center;
   border: 1px solid #B4B4B4;
}
#t1 td {
	border-bottom: 1px solid black;
	padding: 12px;
	padding-left: 20px;
	text-align:center;
}
.t21{
	width:7%;
	color:gray;
	text-align:center;
}
.t22{
	width:55%;
	margin-left: 30px;
}
.t23,.t24,.t25{
	text-align:center;
	color:gray;
}

</style>

</head>
<!-- header -->
<div id="div_all">
	<div id="div_table">
		<h2 id="qna_title">자유게시판</h2>

		<table id="table">
			<thead>
				<tr id="t1">
					<td>NUM</td>
					<td>TITLE</td>
					<td>WRITER</td>
					<td>DATE</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td class="t21">${list.num}</td>
						<td class="t22"><c:forEach begin="1" end="${list.depth}">
				</c:forEach> <a
							href="${pageContext.request.contextPath}/freeboard/freeboardView?num=${list.num}">${list.title}</a>
						</td>
						<td class="t24">${list.writer}</td>
						<td class="t23">${list.reg_date}</td>
						
					</tr>
				</c:forEach>
			</tbody>
			
		
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/freeboard/freeboardWrite">
					<input type="submit" value="글 작성" class="button">
			</a>
			</div>
		<div id="pageing">
		<c:if test="${listsize != '0' }">
			<c:if test="${paging.curBlock > 1}">
					<a 
						href="freeboardList?curPage=${paging.startNum-1}&perPage=10">이전</a>
				</c:if> <c:forEach begin="${paging.startNum}" step="1"
					end="${paging.lastNum}" var="i">
					<a class="page" href="freeboardList?curPage=${i}&perPage=10">${i}</a>

				</c:forEach> <c:if test="${paging.curBlock < paging.totalBlock}">
					<a 
						href="freeboardList?curPage=${paging.lastNum+1}&perPage=10">다음</a>
				</c:if> <a href="#" aria-label="Next"> <span aria-hidden="true"></span>
			</a>
			<!-- PAGINATIOIN:E -->
			</c:if>
		</div>
		<%-- <c:if test="${sessionScope.member ne null }">
			<div>
				<input type="button" value="글쓰기" id="wrBtn" class="btn btn-info">
			</div>
		</c:if> --%>
	</div>
</div>

<!-- Footer:S -->
<!-- Footer:E -->

</body>
</html>