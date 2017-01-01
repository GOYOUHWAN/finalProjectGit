<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- JavaScript 처리  시작 -->
	<script type="text/javascript">
	var idck=0; 
	var idck2=0;
	var pwck=0;
	function chID(){
		if(idck2==1){
			idck2 = 0;
			$("#useridspan").html("");
			$("#useridspan").css("display","inline");
		}
		var id = $("#id").val();
		 if(id==''){
			 $("#idspan").css("display","none");
			$("#useridspan").css("display","none");
		} 
		var num = id.search(/[0-9]/g);
		 var eng = id.search(/[a-z]/ig);
		 if(id.length < 5 || id.length > 19 ){
			 if(id.length == 0){
				 $("#idcheck").css("display","none");
			 }else{
			 $("#idcheck").css("display", "inline");
			 }
		 }else{
		 if(id.search(/₩s/) != -1){
			 $("#idcheck").css("display", "inline");
		 } 
		 if(num < 0 || eng < 0 ){
			 $("#idcheck").css("display", "inline");
		 }
		 else{
			 $("#idcheck").css("display", "none");
			 idck2=1;
			 $("#idspan").css("display", "none");
		 }
		 }
		
	}
		$(function() {
			$("#idcheck").css("display", "none");
			$("#pwcheck").css("display", "none");
			var id = $("#id").val();
			//home버튼
			$("#btn3").click(function() {
				location.href="../";
			});
			
			// 회원 가입 버튼
			$("#btn4").click(function (){
				if(idck==1 && idck2==1 && pwck==1){
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
				}else{
					alert("모든항목을 다 입력하세요");
				}
			});
			
			//ID중복체크
			$("#btn1").click(function () {
				if(idck2==1){
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
				}else{
					$("idspan").html("id를 올바르게 입력하세요.");
				}
			});
			//functino 끝
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
				if(pw1==''){
					$("#true").css("display", "none");
					$("#false").css("display", "none");
				}else{
					$("#true").css("display", "inline");
					$("#false").css("display", "none");
				}
			} else {
				$("#true").css("display", "none");
				$("#false").css("display", "inline");
			}
		}


		// 비밀번호 검사& 초기화
		function rePW() {
			var pw = $("#pw1").val();
			var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			 if(pw.length < 8 || pw.length > 20){
				 $("#pwcheck").css("display", "inline");
			 }else{
			 if(pw.search(/₩s/) != -1){
				 $("#pwcheck").css("display", "inline");
			 } if(num < 0 || eng < 0 || spe < 0 ){
				 $("#pwcheck").css("display", "inline");
			 }
			 else{
				 $("#pwcheck").css("display", "none");
				 pwck=1;
			 }
			 }
			$("#pw2").val("");
			$("#true").css("display", "none");
			$("#false").css("display", "none");
		}
		
		function showKeyCode(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
			{
				return;
			}
			else
			{
				return false;
			}
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
		<!-- 입력 부분 시작 -->
		<h2 style="text-align: center; margin-bottom: 20px; margin-top: 20px;">회원가입</h2>
		<div id="join_sub_1">
		<!-- <form action="memberJoin" method="post"> -->
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_1">아이디</td>
					<td>
						<input type="text" name="id" class="categ1 teduri" id="id" onkeyup="chID()"> 
						<button id="btn1" style="margin-left: 30px;">중복 확인</button><br>
						<span id="useridspan"></span>
						<span id="idspan"></span>
						<br><span id="idcheck">5~20자의 영문 소문자, 숫자만 사용 가능합니다.</span>
					</td>
				</tr>
				<!-- 비밀번호 -->
				<tr>
					<td class="td_1">비밀번호</td><!-- 아이디비밀번호길이제한특수문자입력 -->
					<td>
						<input type="password" class="categ1 teduri" id="pw1" onkeyup="rePW()">
						<br><span id="pwcheck">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
					</td>
				</tr>
				<!-- 비밀번호 재확인 -->
				<tr>
					<td class="td_1">비밀번호 재확인</td>
					<td>
						<input type="password" class="categ1 teduri" id="pw2" name="pw" onkeyup="equalPW()"> 
						<span id="false">비밀번호 불일치</span> 
						<span id="true">비밀번호 일치</span>
					</td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">이름</td>
					<td><input type="text" class="categ1 teduri" name="name" id="name"></td>
				</tr>
				<!-- 나이 -->
				<tr>
					<td class="td_1">생년 월일</td>
					<td>		
						<select class="categ2 teduri" id="year" name="year">
							<c:forEach begin="1" end="77" varStatus="status">
								<option>${ 2017-status.count }</option>
							</c:forEach>
						</select> 년
						<select class="categ3 teduri" id="month" name="month">
							<c:forEach begin="1" end="12" varStatus="status">
								<option>${ status.count }</option>
							</c:forEach>
						</select> 월
						<select class="categ3 teduri" id="day" name="day">
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
						<input type="text" class="categ3 teduri" id="pSecond" name="pSecond" maxlength="4" onkeydown="return showKeyCode(event)"> - 
						<input type="text" class="categ3 teduri" id="pThird" name="pThird" maxlength="4" onkeydown="return showKeyCode(event)">
					</td>
				</tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td>
					<td>
						<input type="text" class="categ2 teduri" id="email_1" name="email">
						@ 
						<select class="categ4 teduri" id="email_2">
							<option>hanmail.net</option>
							<option>naver.com</option>
							<option>nate.com</option>
							<option>gmail.com</option>
							<option>hotmail.com</option>
						</select>
						<br>
						<span style="color:red;">WARN : 이메일 오기입에 대한 책임은 당사자에게 있습니다.</span>
					</td>
				</tr>
				<!-- 주소 -->
				<tr>
					<td class="td_1">주소</td>
					<td>
						<input type="text" name="address" id="address" class="categ1 teduri"><br>
						<span style="color:red;">WARN : 주소 오기입에 대한 책임은 당사자에게 있습니다.</span>
					</td>
				</tr>
				
				<!-- 계좌번호 -->
				<tr>
					<td class="td_1">환불 계좌번호</td>
					<td>
						<div>
							<div class="form_wrap select card_type form_bg" >
								<select id="accountBank" class="teduri" style="margin-bottom: 7px; height: 20px;">
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
								<input id="accountName" class="teduri" type="text" maxlength="5" style="height: 20px;">
								<label for="lp_card_no1">계좌번호</label> 
								<input id="accountNum" class="teduri" type="text" maxlength="15" style="height: 20px;">
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
	<!-- Join 끝 -->
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>