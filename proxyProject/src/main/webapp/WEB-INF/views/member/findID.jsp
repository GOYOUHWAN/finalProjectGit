<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/help_inquiry.css">
</head>
<body>
<section id="container" class="wrap_leave">
	<div id="content" class="inquiry non_sign">
		<div class="content_header">
			<h2>
				<img alt="findid" src="${pageContext.request.contextPath}/resources/image/h_find_id.gif">
			</h2>
		</div>
		<p class="content_summary">아이디 찾는 방법을 선택해 주세요.</p>
		<div class="section_find">
			<form>
				<div class="box6">
					<!-- 휴대전화로 찾기 -->
					<div id="div_phone" class="box_inn selected">
						<input type="radio" id="r_pn1" class="input_rd" name="rd" value="tel" onclick="radio1();">
						<label for="r_pn1" class="label_rd">회원정보에 등록한 휴대전화로 인증</label>
						<div class="radio1">
							<p class="dsc">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
							<dl>
								<dt>
									<label for="phoneNm" class="label_txt">
										이<i></i>름
									</label>
								</dt>
								<dd>
									<input type="text" id="phoneNm" class="input_txt" style="width:225px;" name="name" maxlength="5" placeholder="이름">
								</dd>
								<dt>
									<label for="t_pn1" class="label_txt">
										휴대전화
									</label>
								</dt>
								<dd>
									<span class="country_code">
										<span class="sel_value" id="input_internationalCode">+82</span>
										<select id="internationalCode" name="internationalCode" title="국가코드" class="country_sel">
											<option value="82">대한민국 +82
										</select>
									</span>
									<span class="int_mob">
										<input type="text" class="input_txt" placeholder="휴대전화번호" >
									</span>
								</dd>
							</dl>
						</div>
					</div>
					<!-- 이메일로 찾기 -->
					<div id="div_email" class="box_inn">
						<input type="radio" id="r_pn2" class="input_rd" name="rd" value="email" onclick="radio2();">
						<label for="r_pn2" class="label_rd">본인확인 이메일로 인증</label>
					</div>
				</div>
				<div class="btn_area radio2">
					<a href="findIDResult" class="btn_next2"></a>
				</div>
			</form>
		</div>
	</div>

</section>

</body>
<script type="text/javascript">
$(function () {
	radio1();
});
//핸드폰으로 ID 찾기
function radio1(){
	alert("radio1"); 
	$(".radio1").show();
	$(".radio2").hide();
	$("input:radio[value='tel']").prop("checked", true); // 선택하기
	$("input:radio[value='email']").prop("checked", false); // 해제하기
}
//이메일로 ID 찾기
function radio2(){
	alert("radio2");
	$(".radio2").show();
	$(".radio1").hide();
	$("input:radio[value='email']").prop("checked", true); // 선택하기
	$("input:radio[value='tel']").prop("checked", false); // 해제하기
}
</script>
</html>