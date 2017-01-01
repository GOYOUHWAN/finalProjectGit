<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
.td_1 {
	width: 10%;
	height: 50px;
	text-align: center;
	font-size: 15px;
	background-color: #eeeeee;
}
.td_2{
	text-align: left;
	padding-bottom: 15px;
	padding-top: 15px;
	font-size: 14px;
	padding-left: 4%;
	line-height: 200%;
}
.td_3{
	width: 30%;
	text-align: justify;
	padding-left: 4%;
}
.td_4{
	height: 200px;
}
#fre-section{
	margin: 0 auto;
	padding-top: 30px;
	padding-bottom: 30px;
	text-align: center;
}
.mypage-content {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-bottom: 30px;
   margin-top: 70px;
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
    text-align: left;
    margin: 0 auto;
}
#s_div1 {
	width: 100%;
	margin: 0 auto;
}
.btnhere{
	text-align: center;
}
.btn{
	text-decoration: none;
	border: 1px solid gray;
	background-color: white;
	padding: 5px 10px;
	color: gray;
	font-size: 18px;
}
.btn:hover{
	background-color: gray;
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
<%@ include file = "../common/header.jsp" %>
<section id="fre-section">
<%-- 			<!-- 목록버튼 -->
			<div class="option">
				<a href="noticeList" class="list_button">
					<img src = "${pageContext.request.contextPath}/resources/image/btn_list.gif">
				</a>
			</div> --%>
<div class="mypage-content">
	<div class="mypage-header">공지사항</div>
	<table id="s_div1">
	<c:set var="n" value="${noticeDTO}"/>	
		<tr>
			<%-- <td class="td_3">작성자 : ${dto.id}</td> --%>
			<td class="td_1">제목</td>
			<td class="td_2">${n.title}</td>
		</tr>
		<tr>
			<!-- <td rowspan="2" class="td_3"></td> -->
			<td class="td_1">날짜</td>
			<td class="td_2">${n.reg_date}</td>
		</tr>
		<tr>
			<td class="td_1 td_4">내용</td>
			<td class="td_2 td_4">${n.content}</td>
		</tr>
		
	</table>
	</div>
	<div class="btnhere">
		<c:if test="${sessionScope.member.type eq '3'}">
			<a href="noticeDel?no=${n.no}"
				onclick="return confirm('정말 삭제하시겠습니까?')" class="btn">삭제</a>
		</c:if>
		<a href="noticeList" class="btn">목록</a>
	</div>
<!-- 			<div class="list">
				<div class="list_paging">
					<ul class="list_ul">
						<li>
							<span class="status">
								<a href="#">이전</a>
							</span>
						</li>
						<li>[복구완료] 12/12 (월), '백과사전' 서비스의 장애 현상이 정상화
								되었음을 알려드립니다.</li>
						<li>
							<span class="status">
								<a href="#">다음</a>
							</span>
						</li>
					</ul>
				</div>
			</div> -->
</section>
<%@ include file = "../common/footer.jsp" %>
</body>
</html>