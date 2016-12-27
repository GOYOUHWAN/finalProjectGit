

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#join_div {
	width: 100%;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
}

#join_sub_1 {
	width: 80%;
	margin: 0 auto;
}

table {
	border-spacing: 0px;
	border-collapse: collapse;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	color: #555;
}
.td_1 {
	width: 20%;
	height: 50px;
	text-align: center;
	font-size: 15px;
	background-color: #eeeeee;
	border: 1px solid #dbdada;
}
.td_2{
	text-align: left;
	padding-bottom: 15px;
	padding-top: 15px;
	font-size: 14px;
	padding-left: 4%;
	border: 1px solid #cccccc;
}
#btn1 {
	width: 80px;
	height: 30px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	font-weight: bold;
	outline: none;
}

#btn1:HOVER {
	border: 1px solid white;
	background-color: #737373;
	color: white;
}



#true, #false {
	display: none;
	color: red;
	margin-left: 10px;
}

#true {
	color: blue;
}
#useridspan{
	width:30px;
	height:30px;
}
.categ1 {
	width: 60%;
	height: 20px;
	font-size: 19px;
}

.categ2 {
	margin-left: 20px;
	width: 80px;
	height: 20px;
}

.categ3 {
	width: 60px;
	height: 20px;
}

.categ4 {
	width: 105px;
	height: 20px;
}


#join_sub_2 {
	width: 40%;
	height: 50px;
	margin: 0 auto;
	margin-top: 30px;
}

.btn2 {
	width: 30%;
	height: 80%;
	margin-left: 30px;
	float: left;
	border: 1px solid #6E9907;
	background-color: #6E9907;
	font-size: 20px;
	color: white;
}

.btn2:HOVER {
	border: 1px solid #6E9907;
	background-color: white;
	color: #6E9907;
}

#btn3 {
	border: 1px solid #737373;
	background-color: white;
	color : #737373;
	outline: none;
}

#btn3:HOVER {
	border: 1px solid white;
	background-color: #737373;
	color: white;
	outline: none;
}
.mypage-content {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    text-align: left;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- JavaScript 처리  시작 -->
	<script type="text/javascript">
		$(function() {
			//home버튼
			$("#btn3").click(function() {
				location.href="../";
			});
			
			// 회원 수정 버튼
			$("#btn4").click(function(){
				$.post("blackmUpdate", {
					id : $("#id").val(),
					type : $("#type").val()
				}, function(data) {
					alert("수정되었습니다.");
					location.href="../";
				}); 
				
			});
			
		});
	</script>
	<!-- JavaScript 처리 끝 -->
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
<div id="join_div">
<!-- Join 시작 -->
		<!-- 입력 부분 시작 -->
		<div class="mypage-content">
		<div class="mypage-header">TYPE 변경</div>
		<!-- <form action="memberJoin" method="post"> -->
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">아이디</td>
					<td class="td_2">
						<input type="text" value="${param.id }" class="categ1" id="id" readonly="readonly"> 
					</td>
				</tr>
				<!-- type -->
				<tr>
					<td class="td_1">type</td>
					<td class="td_2">
						<input type="text" placeholder="ex) 4" id="type" style="border: 1px solid #dbdada;height: 25px;"> 
					</td>
				</tr>
				<tr>
					<td class="td_1"></td>
					<td class="td_2"><p style="color: #C40303;">**숫자만 입력 바랍니다**</p><br>
					&nbsp;- type 1 = 구매자<br>&nbsp;- type 2 = 판매자<br>&nbsp;- type 4 = 블랙리스트</td>
				</tr>
			</table>
	</div>
		<!-- 버튼처리 부분 -->
		<div id="join_sub_2">
			<button class="btn2" id="btn3">HOME</button>
			<button class="btn2" id="btn4">수정완료</button>
		</div>
	</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>