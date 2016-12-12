<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/ticket.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_tnb.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3_step1.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3_step2.css">
<style type="text/css">
#deposit{
	width: 300px;
	margin-top: 210px;
}

#address {
	width: 250px;
}

.mySlides {
	display: none;
	width: 500px;
	height: 500px;
}

.demo {
	cursor: pointer;
}

.view_img {
	width: 500px;
	height: 500px;
	margin-left: 5px;
	display: inline;
}

.view_div {
	margin-top: 10px;
}

.view_div_img {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	border: 1px solid blue;
}

#view_div_1 {
	margin-top: 200px;
	border: 1px solid red;
	display: inline-block;
	float: left;
}

#view_div_outside {
	width: 100%;
	height: 700px;
	padding-top: 0px;
	border: 1px solid black;
}

#view_div_inside {
	width: 80%;
	height: 100%;
	border: 1px solid yellow;
	margin: 0 auto;
}

#div_name {
	width: 50%;
	height: 500px;
	border: 1px solid green;
	display: inline-block;
	float: left;
	margin-top: 200px;
}

#view_table {
	width: 90%;
	float: right;
	border: 1px solid red;
}

table tr, td {
	border: 1px solid red;
}

.view_button {
	width: 50%;
	height: 40px;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>
	<%@ include file="../../common/header.jsp"%>

	<div id="view_div_outside">
		<div id="view_div_inside">
			<div id="view_div_1" class="w3-content" style="max-width: 500px">
				<img class="view_img demo w3-opacity w3-hover-opacity-off"
					src="/proxyProject/resources/upload/${viewPicture.files1 }"
					onclick="currentDiv(1)">

			</div>

			<div id="div_name">
				<table id="view_table">
					<tr>
						<td><h2>판매자 : ${view.id }</h2> 판매자 신용도 :
							${viewMember.seller_trust }</td>
					</tr>
					<tr>
						<td><h1>책 제목 : ${view.product }</h1>
							<br> 구매 날짜 : ${view. buy_date}</td>
					</tr>
					<tr>
						<td><h3>줄거리 : ${view.contents }</h3></td>
					</tr>

				</table>
			</div>


		</div>
	</div>



	<input type="hidden" id="price" value="${ param.price }">
	<input type="hidden" id="num" value="${ param.num }">
	<input type="hidden" id="id" value="${ member.id }">


	<section id="section_wrap">
	<form action="DepWrite" method="post" id="frm">
		<div class="steps" style="margin: 0 auto;">
			<div class="step step3" style="display: block;">
				<div class="ticket_payment_method">
					<a href="#" onclick="return false;" id="ticket_payment_top"
						class="sreader">결제시작</a>
					<div class="tpm_wrap tpm_last_pay">
						<h4 class="ts3_titlebar ts3_t1">
							<span class="title">입금 정보 입력</span>
						</h4>
						<div class="tpm_body">
							<div>
								<div class="payment_select radio_group">
									<span> <label for="last_pay_radio3">무통장입금</label> <span></span>
									</span>
								</div>

								<div class="payment_input payment_pay" style="display: block;">
									<div class="table_wrap">
										<table>
											<thead></thead>
											<tbody>
												<tr>
													<th scope="row"><label for="lp_card_type">입금은행</label>
													</th>
													<td>
														<div>
															<div class="form_wrap select card_type form_bg">
																<select id="banksel" name="bank">
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
													</td>
												</tr>
												<!-- 예금주 -->
												<tr id="input_card_num">
													<th scope="row"><label for="lp_card_no1">예금주</label></th>
													<td>
														<div>
															<div class="form_wrap text card_no form_bg">
																<label for="lp_card_no1">예금주명 입력</label> <input
																	id="lp_card_no1" type="text" name="name" maxlength="5"
																	class="type-n nohan" readonly="readonly" value="${sessionScope.member.name}">
															</div>
														</div>
													</td>
												</tr>
												<tr id="address">
													<th scope="row"><label for="address">배송지</label></th>
													<td>
														<div>
															<div class="form_wrap text card_no form_bg">
																<label for="lp_card_no1"></label> <input id="address"
																	type="text" name="address" class="type-n nohan">
															</div>
														</div>
													</td>
												</tr>
												<!-- 현금영수증 -->
												<tr id="input_card_num">
													<th scope="row"><label for="lp_card_no1">현금영수증</label><br>
														<label for="lp_card_no1"> (핸드폰번호)</label></th>
													<td>
														<div>
															<div class="form_wrap text card_no form_bg">
																<label for="lp_card_no1">핸드폰번호1</label> <input
																	id="lp_card_no1" type="text" maxlength="3"
																	class="type-n nohan">
															</div>
															<span class="divider">-</span>
															<div class="form_wrap text card_no form_bg">
																<label for="lp_card_no1">핸드폰번호2</label> <input
																	id="lp_card_no1" type="text" maxlength="4"
																	class="type-n nohan">
															</div>
															<span class="divider">-</span>
															<div class="form_wrap text card_no form_bg">
																<label for="lp_card_no1">핸드폰번호3</label> <input
																	id="lp_card_no1" type="text" maxlength="4"
																	class="type-n nohan">
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="ticket_payment_summary">
				<div class="tps_wrap">
					<div class="tps_body">
						<div class="summary_box total_box">
							<div class="payment_header">입금하실 금액</div>
							<div class="payment_footer">
								<div class="result">
									<span class="num verdana" id="totalpay"> <%=request.getParameter("price")%>
									</span> <span class="won">원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a href="depositResult?id=${member.id}&price=${list.price}&num=${list.num}&id=${list.id}"><button id="deposit">입금하기</button></a>
			
		</div>
	</form>
	</section>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>