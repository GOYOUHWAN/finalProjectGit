<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#login_div {
	width: 80%;
	height: 350px;
	margin: 0 auto;
	margin-top: 50px;
}

#login_sub_1 {
	width: 80%;
	height: 50px;
	margin: 0 auto;
	margin-top: 50px;
	border-bottom: 1px solid #737373;
	background-color: rgba(255,247,229,0.5);
	color: #737373;
	font-size: 15px;
}

#login_sub_2 {
	width: 80%;
	height: 150px;
	margin: 0 auto;
	margin-top: 50px;
}

.sub_div_1 {
	width: 35%;
	height: 100px;
	margin-left: 81px;
	margin-top: 25px;
	float: left;
}

table {
	border: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	width: 55%;
	height: 150px;
	float: left;
}

.td_1 {
	width: 20%;
	height: 20px;
	text-align: center;
	font-size: 16px;
}

.categ1 {
	margin-left: 20px;
	width: 80%;
	height: 30px;
	border: 1px solid #bdbdbd;
	padding-left: 8px;
}

#img_div {
	width: 45%;
	height: 150px;
	float: right;
}

#btn3 {
	width: 100px;
	height: 110px;
	font-size: 20px;
	background-color: #6E9907;
	color: white;
	outline: none;
}

#btn3:ACTIVE {
	border: 1px solid #6E9907;
	background-color: white;
	color: #6E9907;
}

#login_sub_3 {
	width: 80%;
	height: 100px;
	margin: 0 auto;
}

.btn_d_3 {
	width: 20%;
	height: 50px;
	margin: 0 auto;
	margin-top: 50px;
	float: left;
	font-size: 15px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
}

.btn_d_3:HOVER {
	background-color: #737373;
	border: 1px solid white;
	color: white;
	outline: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	// HOME
	$("#btn7").click(function() {
		alert("home");
		location.href = "../";
	});
	
	var message=${message};
	if(message!=''){
		alert("message");
		alert(message);
	}
	$("#id").focus();

	// 로그인
	$("#btn3").click(function() {
		if ($("#id").val() == "") {
			alert("아이디를 입력하세요");
			$("#id").focus();
			return;
		}

		if ($("#pw").val() == "") {
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return;
		}
		
		$.ajax({
			url : "memberLogin",
			type : "POST",
			data : {
				id : $("#id").val(),
				pw : $("#pw").val()
			},
			success : function(result){
			}
		});	
	});

	// ID 찾기
	$("#btn4").click(function() {
				// Opener 사용
				var newWindow = window.open("${pageContext.request.contextPath}/member/findID.jsp?", 
						"newWindow",
						"height=150, width=500, resizable=yes");
				$("#id").focus();
			});

	// 비밀번호 찾기
	$("#btn5").click(
			function() {
				var id = $("#id").val();
				// Opener 사용
				var newWindow = window
						.open("../member/findPW.jsp?", "newWindow",
								"height=150, width=450, resizable=yes");
				$("#id").focus();
			});

	// 회원 가입
	$("#btn6").click(function() {
		location.href = "memberJoin";
	});
}); 
	
	
	
</script>
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
	<!-- Login 시작-->
	<div id="login_div">
		<!-- 버튼 처리 부분 -->
		<div id="login_sub_1">
			<h1>로그인</h1>
		</div>
		<!-- 로그인, 소셜 로그인 -->
		<div id="login_sub_2">
			<!-- ////////// AJAX 처리 부분 /////////// -->
			<!-- 임시로 해놓은 부분 -->
			<form action="memberLogin" method="post">
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">아이디</td>
					<td><input type="text" class="categ1" id="id" name="id"
						placeholder="ID 입력" tabindex="1"></td>
					<td rowspan="2"><!-- <button id="btn3" tabindex="3">로그인</button> -->
					<input type="submit" id="btn3" tabindex="3" value="LOGIN">
					</td>
					
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td class="td_1">비밀번호</td>
					<td><input type="password" class="categ1" id="pw" name="pw"
						placeholder="PW 입력" tabindex="2"></td>
				</tr>
			</table>
			</form>
			<!-- ////////// 여기 까지 AJAX 처리 부분 /////////// -->
			<div id="img_div"></div>
		</div>
		<!-- 회원가입, HOME -->


	</div>
	<!-- Login 끝 -->
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>