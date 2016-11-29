<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- JavaScript 처리  시작 -->
	<script type="text/javascript">
		$(function() {
			// 회원 수정 버튼
			$("#btn4").click(function (){
				$.post("memberUpdate", {
					id : $("#id").val(),
					pw : $("#pw2").val(),
					name : $("#name").val(),
					tel : "["+$("#tel").val()+"]"
							+ $("#pFirst").val()+"-"
							+ $("#pSecond").val()+"-"
							+ $("#pThird").val(),
					email : $("#email_1").val()+"@"
							+ $("#email_2").val(),
					address : $("#address").val()
				}, function(data) {
				});
				
			});
			
		});
		
		
		// PW 일치, 불일치
		function equalPW() {
			var pw1 = $("#pw1").val();
			var pw2 = $("#pw2").val();

			if (pw1 == pw2) {
				$("#true").css("display", "inline");
				$("#false").css("display", "none");
			} else {
				$("#true").css("display", "none");
				$("#false").css("display", "inline");
			}
		}

		// 비밀번호 초기화
		function rePW() {
			$("#pw2").val("");
			$("#true").css("display", "none");
			$("#false").css("display", "none");
		}
	</script>
	<!-- JavaScript 처리 끝 -->
<style>
#join_div {
	width: 80%;
	height: 800px;
	margin: 0 auto;
	margin-top: 50px;
}

#join_sub_1 {
	width: 80%;
	height: 700px;
	margin: 0 auto;
}

table {
	border: 1px solid #cccccc;
	border-spacing: 0px;
	border-collapse: collapse;
	width: 80%;
	height: 100%;
	margin: 0 auto;
	color: #555;
}

.td_1 {
	width: 25%;
	height: 50px;
	text-align: center;
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
	margin-left: 20px;
	width: 60%;
	height: 20px;
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
	width: 45%;
	height: 60px;
	margin: 0 auto;
	margin-top: 30px;
}

.btn2 {
	width: 40%;
	height: 100%;
	margin-left: 30px;
	float: left;
	border: 1px solid #00ace6;
	background-color: #00ace6;
	font-size: 20px;
	color: white;
}

.btn2:HOVER {
	border: 1px solid #00ace6;
	background-color: white;
	color: #00ace6;
}

#btn3 {
	border: 1px solid #737373;
	background-color: #737373;
	outline: none;
}

#btn3:HOVER {
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>
<body>
<h2>회원수정</h2>
<!-- Join 시작 -->
	<div id="join_div">
		<!-- 입력 부분 시작 -->
		<div id="join_sub_1">
		<!-- <form action="memberJoin" method="post"> -->
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">아이디</td>
					<td>
						<input type="text" value="${member.id }" class="categ1" id="id" readonly="readonly"> 
					</td>
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td class="td_1">비밀번호</td>
					<td><input type="password" class="categ1" id="pw1" onkeyup="rePW()"></td>
				</tr>
				<!-- 비밀번호 재확인 -->
				<tr>
					<td class="td_1">비밀번호 재확인</td>
					<td>
						<input type="password" class="categ1" id="pw2" name="pw" onkeyup="equalPW()"> 
						<span id="false">비밀번호 불일치</span> 
						<span id="true">비밀번호 일치</span>
					</td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">이름</td>
					<td><input type="text" class="categ1" value="${member.name }" id="name" readonly="readonly"></td>
				</tr>
				
				<!-- 휴대폰 번호 -->
				<tr>
					<td class="td_1">휴대폰 번호</td>
					<td>
						<select class="categ2" id="tel" name="tel">
							<option>SKT</option>
							<option>KT</option>
							<option>LGU+</option>
						</select> 
						<select class="categ3" id="pFirst" name="pFirst">
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>019</option>
						</select> - 
						<input type="text" class="categ3" id="pSecond" name="pSecond" > - 
						<input type="text" class="categ3" id="pThird" name="pThird">
					</td>
				</tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td>
					<td>
						<input type="text" class="categ2" id="email_1" name="email">
						@ 
						<select class="categ4" id="email_2">
							<option>hanmail.net</option>
							<option>naver.com</option>
							<option>nate.com</option>
							<option>gmail.com</option>
							<option>hotmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_1">address</td>
					<td><input type="text" name="address" id="address" value="${member.address }"></td>
				</tr>
			</table>
			<!-- <input type="submit" class="btn2" id="btn4" value="JOIN">
			</form> -->
		</div>
		<!-- 버튼처리 부분 -->
		<div id="join_sub_2">
			<button class="btn2" id="btn3">HOME</button> 
			<button class="btn2" id="btn4">수정완료</button>
		</div>
	</div>
	<!-- Join 끝 -->
</body>
</html>