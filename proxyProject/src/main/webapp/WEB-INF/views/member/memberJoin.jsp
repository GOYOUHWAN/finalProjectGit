<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- JavaScript 처리  시작 -->
	<script type="text/javascript">
		$(function() {
			var idck=0;
			
			//home버튼
			$("#btn3").click(function() {
				location.href="../";
			});
			
			// 회원 가입 버튼
			$("#btn4").click(function (){
				if(idck!=0){
				$.post("memberJoin", {
					id : $("#id").val(),
					pw : $("#pw2").val(),
					name : $("#name").val(),
					year : $("#year").val()+"."
							+$("#month").val()+"."
							+$("#day").val(),
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
					alert("가입성공");
					location.href="../";
				});
				}
				else{
					alert("ID중복체크를 하세요.");
				}
			});
			
			//ID중복체크
			$("#btn1").click(function () {
				$("#useridspan").html("확인중입니다");
				var idd= $("#id").val();
				$.ajax({
					url:"checkID2",
					dataType : "json",
					type:"POST",
					data : {id:idd},
					success:function(data) {
						var d = data.KEY;
						$("#useridspan").html(d);
						if(d=="이미있는 id입니다."){
							idck=0;
						}else{
							idck=1;
						}
					},
				    error : function(jqXHR, textStatus, errorThrown) {
				        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				    }
				});
			});
		});
		
		// ID 얻기
		function getId(getId) {
			$("#id").val(getId);
		}

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
	<style type="text/css">
		
	</style>
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
	<!-- Join 시작 -->
	<div id="join_div">
		<!-- 입력 부분 시작 -->
		<h2>회원가입</h2>
		<div id="join_sub_1">
		<!-- <form action="memberJoin" method="post"> -->
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">아이디</td>
					<td>
						<input type="text" name="id" class="categ1" id="id"> 
						<button id="btn1">중복 확인</button><br>
						<span id="useridspan"></span>
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
					<td><input type="text" class="categ1" name="name" id="name"></td>
				</tr>
				<!-- 나이 -->
				<tr>
					<td class="td_1">생년 월일</td>
					<td>		
						<select class="categ2" id="year" name="year">
							<c:forEach begin="1" end="77" varStatus="status">
								<option>${ 2017-status.count }</option>
							</c:forEach>
						</select> 년
						<select class="categ3" id="month" name="month">
							<c:forEach begin="1" end="12" varStatus="status">
								<option>${ status.count }</option>
							</c:forEach>
						</select> 월
						<select class="categ3" id="day" name="day">
							<c:forEach begin="1" end="31" varStatus="status">
								<option>${ status.count }</option>
							</c:forEach>
						</select> 일						
					</td>
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
						<input type="text" class="categ3" id="pSecond" name="pSecond" maxlength="4"> - 
						<input type="text" class="categ3" id="pThird" name="pThird" maxlength="4">
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
				<!-- 주소 -->
				<tr>
					<td class="td_1">주소</td>
					<td><input type="text" name="address" id="address" class="categ1"></td>
				</tr>
				
				<!-- 계좌번호 -->
				<tr>
					<td class="td_1">환불 계좌번호</td>
					<td>
						<div>
							<div class="form_wrap select card_type form_bg" >
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
								<input id="accountName" type="text" maxlength="5">
								<label for="lp_card_no1">계좌번호</label> 
								<input id="accountNum" type="text" maxlength="15">
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
			<button class="btn2" id="btn4">가 입</button>
		</div>
	</div>
	<!-- Join 끝 -->
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>