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
.ts3_titlebar {
	font-size: 30px;
	padding: 22px 0 22px 28px;
	border-bottom: 1px solid #d8d8d8;
}

.ts3_titlebar2 {
	font-size: 20px;
	padding: 22px 0 22px 28px;
}

.ts3_titlebar3 {
	font-size: 15px;
	padding: 22px 0 22px 28px;
}

#deposit {
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
	width: 100px;
	height: 100px;
	float: left;
	margin: 0 auto;
}

.view_div {
	margin-top: 10px;
}

.view_div_img {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	border: 1px solid #d8d8d8;
}

#view_div_1 {
	margin-top: 50px;
	width: 300px;
	border: 1px solid #d8d8d8;
	float: right;
}

#view_div_outside {
	width: 100%;
	height: 900px;
	padding-top: 0px;
	border: 1px solid black;
}

#view_div_inside {
	padding-top: 80px;
	width: 70%;
	height: 100%;
	border: 1px solid #d8d8d8;
	margin: 0 auto;
}

#div_name {
	width: 100%;
	height: 600px;
	border: 1px solid #d8d8d8;
	display: inline-block;
	float: left;
	margin-top: 200px;
}

#view_table {
	width: 90%;
	float: right;
	border: 1px solid #d8d8d8;
}

table tr, td {
	border: 1px solid #d8d8d8;
}

.view_button {
	width: 50%;
	height: 40px;
}

#div_product {
	border: 1px solid #d8d8d8;
	height: 50px;
}

.one {
	margin-bottom: 150px;
}

#sellbtn {
	background-color: #8C72FD;
	border: 1px solid #8C72FD;
	width: 100%;
	font-size: 30px;
	line-height: 1.33;
	border-radius: 3px;
	color: #fff;
	margin: 0 auto;
}

#view_div_3 {
	margin-top: 50px;
	width: 750px;
	heght: 850px;
	border: 1px solid #d8d8d8;
	float: left;
}

.body_title {
	font-size: 18px;
	margin-bottom: 20px;
}

.text {
	display: block;
	width: 30%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	color: #555555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.text3 {
	display: block;
	width: 200px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	color: #555555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-right: 100px;
}

.text2 {
	display: block;
	width: 80%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	color: #555555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.mu {
	color: #7151FC;
	background-color: #fff;
	border: 1px solid #7151FC;
	display: inline-block;
	background-color: #ecf0f1;
	border-radius: 3px;
	text-align: center;
	font-size: 20px;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 250px;
	height: 81px;
	vertical-align: top;
}

#phone {
	float: left;
}
}
</style>
<script type="text/javascript">
	$(function(){
	      $("#sellbtn").click(function(){
	          document.depositFrm.submit();

	       /*   var name= $("#name").val();
	          var tel = $("#tel").val();
	          var email = $("#email").val();
	          var address = $("address").val();*/
	 /*      $.ajax({
	          type:"POST",
	          url:"depositWrite",
	          data:{
	             name:name,
	             tel:tel,
	             email:email,
	             address:address
	             
	          },
	          success:function(data){
	             
	             alert(data);
	          }
	       });*/
	       });
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>
	<%@ include file="../../common/header.jsp"%>
	<section>
		<form action="depositWrite" method="post" name="depositFrm">
			<div id="view_div_inside">
				<div id="view_div_3">
					<h5 class="ts3_titlebar">주문하기</h5>
					<h5 class="ts3_titlebar2">배송정보</h5>
					<h5 class="ts3_titlebar3">
						이름 <input type="text" class="text" placeholder="이름" name="name">
					</h5>
					<h5 class="ts3_titlebar3">
						<div>
							<div id="phone">
								전화번호 <input type="text" class="text3" name="tel" id="tel"
									placeholder="전화번호"> <br> <br>
							</div>
							<div id="email">
								이메일 <input type="text" class="text" name="email" id="email"
									placeholder="이메일"> <br> <br>
							</div>
						</div>
						주소 <input type="text" class="text2" id="address" name="address"
							placeholder="주소">
					</h5>
					<h5 class="ts3_titlebar2">
						<button class="mu">
							무통장입금(가상계좌)
							<div class="su">수수료 500원</div>
						</button>
					</h5>
				</div>

				<div id="view_div_1" class="w3-content" style="max-width: 500px">
					<div id="view_div_2">
						<td><h1>결제 상품</h1></td> <br> <img
							class="view_img demo w3-opacity w3-hover-opacity-off"
							src="/proxyProject/resources/upload/${viewPicture.files1 }"
							onclick="currentDiv(1)"> <br>
					</div>
					<td class="one"><h2>[중]${view.product}</h2></td> <br>
					<td class="two"><h2>${view.price}</h2> <br>
						<div id="div_product">
							<td><h3>
									상품 가격 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${view.price}원
								</h3></td>
						</div>
						<div id="div_product">
							<td><h3>결제 수수료 :</h3></td>
						</div>
						<div id="sellbtndiv">
							<button class="sellbtn" id="sellbtn">입금하기</button>
						</div>
				</div>
				<input type="hidden" value="${view.id}" name="id_seller">
				<input type="hidden" value="${member.id }" name="id_buyer">
				<input type="hidden" value="${view.num}" name="num">
				<input type="hidden" value="${sessionScope.member.id}" name="id">
				<input type="hidden" value="${view.price}" name="price">
				<input type="hidden" value="${view.name}" name="name">
				<input type="hidden" value="${view.status }" name="status">
		</form>
	</section>
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>