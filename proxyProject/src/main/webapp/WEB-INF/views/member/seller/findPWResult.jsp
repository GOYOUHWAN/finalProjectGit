<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/help_inquiry.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#true").css("display", "none");
	$("#false").css("display", "none");
});
//pw초기화
function rePW(){
	$("#pw2").val("");
	$("#true").css("display", "none");
	$("#false").css("display", "none");
}
//PW 일치, 불일치
function equalPW(){
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
</script>
</head>
<body>
<section id="container" class="wrap_leave">
	<div id="content" class="inquiry non_sign">
		<div class="content_header">
			<h2>
				<img alt="findid" src="${pageContext.request.contextPath}/resources/image/h_find_pw.gif">
			</h2>
			<ol class="process">
				<li>01. 본인 확인<span>></span></li>
				<li class="on">02. 비밀번호 재설정</li>
			</ol>
		</div>
		<p class="content_summary">
		"새로 사용할 비밀번호를 입력해 주세요." <br> "사용하시던 비밀번호는 PROXY도 알 수 없습니다. 비밀번호를 새로 설정해 주세요."
		</p>
		<div class="section_find">
			<form action="findPWResult" method="post">
				<div class="box6">
					<dl class="n_id box_inn">
						<dt> ID <input type="hidden" name="id" value="${find }"> </dt>
						<dd> ${find } </dd>
						
					</dl>
					<dl>
						<!-- 비밀번호 -->
						<dt>
							<label class="td_1"></label>
							<input type="password" class="input_txt" id="pw1" placeholder="새 비밀번호"
								onkeyup="rePW()">
						</dt>
						<!-- 비밀번호 재확인 -->
						<dt>
							<label class="td_1"></label>
							<input type="password" class="input_txt" id="pw2" name="pw" placeholder="새 비밀번호 확인"
								onkeyup="equalPW()"> 
								<span id="false">비밀번호 불일치</span> 
								<span id="true">비밀번호 일치</span>
						</dt>
					</dl>
					<ul class="find_notice">
						<li>영문, 숫자, 특수문자를 함께 사용하면(6자 이상 16자 이하)보다 안전합니다.</li>
						<li>다른 사이트와 다른 <strong>네이버 아이디만의 비밀번호</strong>를 만들어 주세요.</li>
					</ul>
				</div>
				<div class="btn_area">
					<input type="submit" class="btn_next2" value="">
				</div>
			</form>
		</div>
	</div>

</section>
</body>
</html>