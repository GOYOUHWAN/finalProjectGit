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
	card();
});
function card() {
   $('.payment_card').show();
   $('.payment_pay').hide();
   $('#div_tel').addClass('selected');
   $('#div_email').removeClass('selected');
   $("input:radio[value='tel']").prop("checked", true); // 선택하기
   $("input:radio[value='email']").prop("checked", false); // 해제하기
}
function pay() {
   $('.payment_pay').show();
   $('.payment_card').hide();
   $('#div_email').addClass('selected');
   $('#div_tel').removeClass('selected');
   $("input:radio[value='email']").prop("checked", true); // 선택하기
   $("input:radio[value='tel']").prop("checked", false); // 해제하기
}

</script>
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
<section id="container" class="wrap_leave">
	<div id="content" class="inquiry non_sign" style="padding-top:50px;">
		<div class="content_header">
			<h2>
				<img alt="findid" src="${pageContext.request.contextPath}/resources/image/h_find_pw2.gif">
			</h2>
		</div>
		<p class="content_summary gulci">비밀번호 찾는 방법을 선택해 주세요.</p>
		<div class="section_find">
			<form action="findPW2" method="get">
			<!-- pw찾기 변수ch -->
			<input type="hidden" name="ch" value="2">
				<div class="box6">
					<!-- 휴대전화로 찾기 -->
					<div id="div_tel" class="box_inn">
						<input type="radio" id="r_pn1" class="input_rd" name="rd" value="tel" onclick="card();">
						<label for="r_pn1" class="label_rd">회원정보에 등록한 휴대전화로 인증</label>
						<div class="payment_card" >
							<p class="dsc gulci">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
							<dl>
								<dt>
									<label for="phoneNm" class="label_txt gulci">
										이<i></i>름
									</label>
								</dt>
								<dd>
									<input type="text" id="phoneNm" class="input_txt gulci" style="width:225px;" name="name" maxlength="5" placeholder="이름">
								</dd>
								<dt>
									<label for="t_pn1" class="label_txt gulci">
										휴대전화
									</label>
								</dt>
									<dd>
										<select id="tel" name="tel" class="blankset gulci">
											<option>SKT</option>
											<option>KT</option>
											<option>LGU+</option>
										</select> 
										<select class="int_mob blankset gulci" id="pFirst" name="pFirst">
											<option>010</option>
											<option>011</option>
											<option>017</option>
											<option>019</option>
										</select> - 
										<input type="text" class="categ3 blankset gulci" id="pSecond" name="pSecond" maxlength="4"> - 
										<input type="text" class="categ3 blankset gulci" id="pThird" name="pThird" maxlength="4">
									</dd>
								</dl>
								<div class="btn_area">
									<input type="hidden" name="email_1" value=""> 
									<input type="hidden" name="email_2" value="">
									<input type="submit" class="btn_next2" value="">
								</div>
							</div>
					</div>
					<!-- 이메일로 찾기 -->
					<div id="div_email" class="box_inn">
							<input type="radio" id="r_pn2" class="input_rd" name="rd" value="email" onclick="pay();">
							<label for="r_pn2" class="label_rd">본인확인 이메일로 인증</label>
							<div class=" payment_pay">
							<p class="dsc gulci">본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증을 받을 수 있습니다.</p>
							<dl>
								<dt>
									<label for="phoneNm" class="label_txt gulci">
										이<i></i>름
									</label>
								</dt>
								<dd>
									<input type="text" id="name" class="input_txt" style="width:225px;" maxlength="5" >
								</dd>
								<dt>
									<label for="t_pn1" class="label_txt gulci">
										이메일 주소
									</label>
								</dt>
									<dd>
										<input type="text" id="email_1" class="input_txt gulci" style="width: 225px;" > 
										@ 
										<select class="categ4 blankset gulci" id="email_2" style="height:25px;">
											<option>hanmail.net</option>
											<option>naver.com</option>
											<option>nate.com</option>
											<option>gmail.com</option>
											<option>hotmail.com</option>
										</select>
									</dd>
								</dl>
								<div class="btn_area">
									<input type="hidden" name="tel" value=""> 
									<input type="hidden" name="pFirst" value="">
									<input type="hidden" name="pSecond" value="">
									<input type="hidden" name="pThird" value="">
									<input type="submit" class="btn_next2" value="">
								</div>
							</div>
						</div>
				</div>
				<!-- <div class="btn_area">
					<input type="submit" class="btn_next2" value="">
				</div> -->
			</form>
		</div>
	</div>
</section>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>