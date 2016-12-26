<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#join_div {
	width: 70%;
	margin: 0 auto;
	margin-top: 50px;
}

#join_sub_1 {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
}

table {
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
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
.teduri{
	border: 1px solid #BDBDBD;
}

#join_sub_2 {
	width: 40%;
	height: 50px;
	margin: 0 auto;
	margin-top: 30px;
}

.btn2 {
	width: 45%;
	height: 100%;
	float: left;
	font-size: 14px;
}

#btn3{
	border: 1px solid gray;
	background-color: white;
	color: gray;
	outline: none;
}
#btn3:HOVER {
	border: 1px solid gray;
	background-color: gray;
	color: white;
}
#btn4 {
	border: 1px solid gray;
	background-color: white;
	color: gray;
	outline: none;
}

#btn4:HOVER {
	border: 1px solid gray;
	background-color: gray;
	color: white;
	outline: none;
}
.mypage-menu-item {
   padding: 8px 36px;
   display: block;
   font-size: 16px;
   color: #1f1f1f
}
.mypage-menu-item2 {
   padding: 5px 60px;
   display: block;
   font-size: 14px;
   color: #1f1f1f
}
.mypage-menu-hr {
   border-top: 1px solid #d8d8d8;
   margin: 10px
}
.mypage-menu {
    display: inline-block;
    width: 234px;
    padding: 22px 0;
    border: 1px solid #d8d8d8;
    border-radius: 3px;
    margin: 30px 14px 50px 90px;
}
.mypage-menu-item.active {
   font-weight: bold;
   background-color: #f5f5f5
}
.td_1 {
	width: 5%;
	height: 50px;
	text-align: left;
	font-size: 15px;
	background-color: #eeeeee;
	padding-left: 2%;
}
.td_2{
	text-align: left;
	padding-bottom: 15px;
	padding-top: 15px;
	font-size: 14px;
	padding-left: 4%;
}
.td_3{
	width: 4%;
	text-align: justify;
	font-weight: bold;
	padding-left: 4%;
}
.boxsetting{
	height: 20px;
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
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
					address : $("#address").val(),
					account : $("#accountBank").val()+","
							+$("#accountName").val()+","
							+$("#accountNum").val()
				}, function(data) {
					alert("수정되었습니다.");
					location.href="../";
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
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
<!-- Join 시작 -->
	<div class="mypage-menu">
		<a class="mypage-menu-item active" href="${pageContext.request.contextPath}/member/memberView">회원정보</a> 
		<div class="mypage-menu-hr"></div>
		<div class="mypage-menu-item">마이페이지</div>
		<a class="mypage-menu-item2" href="<%=application.getContextPath() %>/member/seller/myBookList?type=${member.type}&id=${member.id}">- 좋아요 내역</a>
		<a class="mypage-menu-item2" href="<%=application.getContextPath() %>/member/seller/myBoardList?id=${member.id }">- 게시판 글 내역</a>
		<a class="mypage-menu-item2" href="<%=application.getContextPath() %>/member/seller/myBuyList?id=${member.id }">- 구매 내역</a>
	</div>
		<!-- 입력 부분 시작 -->
		<div id="join_sub_1">
		<div class="mypage-header">정보 변경</div>	
		<!-- <form action="memberJoin" method="post"> -->
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_3">기본정보</td>
					<td class="td_1">아이디</td>
				</tr>
				<tr>
					<td rowspan="11" class="bottom-hr"></td>
					<td class="td_2">
						<input type="text" value="${member.id }" id="id" readonly="readonly"> 
					</td>
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td class="td_1">비밀번호</td></tr>
				<tr><td class="td_2"><input type="password" class="categ1 teduri" id="pw1" onkeyup="rePW()"></td>
				</tr>
				<!-- 비밀번호 재확인 -->
				<tr>
					<td class="td_1">비밀번호 재확인</td></tr>
				<tr><td class="td_2">
						<input type="password" class="categ1 teduri" id="pw2" name="pw" onkeyup="equalPW()"> 
						<span id="false">비밀번호 불일치</span> 
						<span id="true">비밀번호 일치</span>
					</td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">이름</td>
				</tr>
				<tr>
					<td class="td_2"><input type="text" class="categ1" value="${member.name }" id="name" readonly="readonly"></td>
				</tr>
				
				<!-- 휴대폰 번호 -->
				<tr>
					<td class="td_1">휴대폰 번호</td></tr>
				<tr><td class="td_2">
						<select class="categ2 teduri" id="tel" name="tel">
							<option>SKT</option>
							<option>KT</option>
							<option>LGU+</option>
						</select> 
						<select class="categ3 teduri" id="pFirst" name="pFirst">
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>019</option>
						</select> - 
						<input type="text" class="categ3 teduri" id="pSecond" name="pSecond" > - 
						<input type="text" class="categ3 teduri" id="pThird" name="pThird">
					</td>
				</tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td></tr>
				<tr><td class="td_2">
						<input type="text" class="categ2 teduri" id="email_1" name="email">
						@ 
						<select class="categ4 teduri" id="email_2">
							<option>hanmail.net</option>
							<option>naver.com</option>
							<option>nate.com</option>
							<option>gmail.com</option>
							<option>hotmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_3">배송정보</td>
					<td class="td_1">Address</td></tr>
					<tr><td rowspan="1" class="bottom-hr"></td>
					<td class="td_2"><input type="text" name="address" class="teduri boxsetting" id="address" value="${member.address }"></td>
				</tr>
				<tr>
					<td class="td_3">계좌정보</td>
					<td class="td_1">환불 계좌번호</td></tr>
				<tr><td rowspan="1" class="bottom-hr"></td>
					<td class="td_2">
						<div>
							<div class="teduri boxsetting" style="width: 135px;margin-bottom: 7px;">
								<select id="accountBank">
									<option>은행을 선택하세요</option>
									<option id="NH농협">NH농협</option>
									<option id="국민은행">국민은행</option>
									<option id="신한은행">신한은행</option>
									<option id="우리은행">우리은행</option>
									<option id="기업은행">기업은행</option>
									<option id="SC은행">SC은행</option>
									<option id="부산은행">부산은행</option>
									<option id="경남은행">경남은행</option>
									<option id="우체국">우체국</option>
								</select>
							</div>
						</div>
						<div>
							<div class="form_wrap text card_no form_bg" >
								<label for="lp_card_no1">예금주명</label> 
								<input id="accountName" class="teduri boxsetting" type="text" maxlength="5">
								<label for="lp_card_no1">계좌번호</label> 
								<input id="accountNum" class="teduri boxsetting" type="text" maxlength="15">
							</div>
						</div>
					</td>
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
	<!-- Join 끝 -->
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>