<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매페이지</title>
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/ticket.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_tnb.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3_step1.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3_step2.css"> --%>
<style type="text/css">
.ts3_titlebar {
	font-size: 30px;
	width:98.4%;
	height: 50px;
 	vertical-align: middle;
 	padding-top:20px;
 	padding-left: 20px;
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
	width: 400px;
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
	width: 150px;
	height: 150px;
	float: left;
	margin: 0 auto;
	margin-top: 20px;
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
	text-align: center;
	height: 200px;
	padding: 0px;
	margin-top: 50px;
	width: 100%;
	border: 1px solid #d8d8d8;
	border-left : none;
	border-right : none;
	margin: 0 auto;
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
	/* border: 1px solid #d8d8d8; */
	height: 100%;
}

.one {
	margin-bottom: 150px;
}

#sellbtn {
	margin: 0 auto;
	background-color: #336600;
/* 	border: 1px solid #8C72FD; */
	width: 30%;
	height: 50px;
	font-size: 20px;
	line-height: 1.33;
	border-radius: 3px;
	color: #fff;
	margin: 0 auto;
	margin-left: 30px;
}

#view_div_3 {
		/* display: inline-block; */
	margin-top: 50px;
	margin: 0 auto;
	width: 49%;
	heght: 850px;
/* 	border: 1px solid #d8d8d8; */
	float: right;
}
#view_div_5 {
		/* display: inline-block; */
	margin-top: 50px;
	margin: 0 auto;
	width: 49%;
	heght: 850px;
	/* border: 1px solid #d8d8d8; */
	float: left;
}
.body_title {
	font-size: 18px;
	margin-bottom: 20px;
}

.text {
	display: block;
	width: 70%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857;
	color: #555555;
	background-color: #fff;
	background-image: none;
/* 	border: 1px solid #ccc; */
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
/* 	border: 1px solid #ccc; */
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
/* 	border: 1px solid #ccc; */
	border-radius: 3px;
}

.mu {
	color: #7151FC;
	background-color: #fff;
	/* border: 1px solid #7151FC; */
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
#view_div_4{
/* 	border: 1px solid red; */
	width: 80%;
	height: 1200px;
	margin: 0 auto;
	margin-top: 100px;
}


#phone {
	float: left;
}
.v_1{
	float:left;
/* 	border:1px solid black; */
	width:36%;
	height:100%;
	display: inline-block;
}
.v2{
	margin-top : 0px;
	float: left;
/* 	border: 1px solid yellow; */
	width: 18%;
	height: 100%;
}
#span_book{
	margin-top:20px;
	width: 50%;
	height: 150px;
	float: left;
	display: inline-block;
	text-align: left;
	/* border: 1px solid blue; */
}
#btn_same{
	width: 50px;
	height: 50px;
	border: none;
	float: right;
}
#view_div_6{
	width: 80%;
	margin: 0 auto;
}


</style>
<script type="text/javascript">
	/*  $(function(){
	      $("#sellbtn").click(function(){
	          document.depositFrm.submit(); 

	          var name= $("#name").val();
	          var tel = $("#tel").val();
	          var email = $("#email").val();
	          var address = $("address").val();
	 	     $.ajax({
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
	       });
 */

	      
	      </script>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>
	<%@ include file="../../common/header.jsp"%>
	
		
		<div id="view_div_4">
			
				<h5 class="ts3_titlebar">주문하기</h5>
				
				<div id="view_div_1"  style=" margin-top: 50px;">
					<div id="view_div_2" class="v_1">
						<h2>구매 정보</h2> <img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files1 }" style="border-radius: 20%;"> 
						<div id="span_book">
							제목 : ${view.product} <br>
							상태 : ${view.quality }<br>
							장르 : ${view.genre }
						</div>
						
					</div>
					<div id=div_product class="v2">	
							<h2>상품 가격 <br><br><br> ${view.sellingprice}원 </h2>
						</div>
						<span style="width: 30px; height:30px; float: left;  font-size: 30px;  margin-top: 80px;" > +</span>
					<div id="div_product" class="v2">
						<h2>수수료 + 택배<br><br><br> 3000 원</h2>
					</div>
						<span style="width: 30px; height:30px; float: left;  font-size: 30px;  margin-top: 80px;" > =</span>
					<div id="div_product" class="v2">
						<h2>결제 금액 <br><br><br> ${view.sellingprice + 3000 }원 </h2>
					</div>
						
				</div>
				<div id="view_div_6">
				<div id="view_div_5">
					<h5 class="ts3_titlebar2">구매자 정보</h5>
					<h5 class="ts3_titlebar3" style="margin-top: 18px;">
						 이름<input type="text" class="text" placeholder="이름" id="name_buyer"  value="${member.name }" readonly="readonly"></h5>
					<h5 class="ts3_titlebar3">
						휴대폰 번호 <input type="text" class="text"  id="tel_buyer" placeholder="휴대폰 번호" value="${member.tel }" readonly="readonly"></h5> 
					<h5 class="ts3_titlebar3">	
						이메일 <input type="text" class="text" id="email_buyer" placeholder="이메일" value="${member.email }" readonly="readonly"></h5> 
					
				
				</div>
				<div id="view_div_3">
					
					<h5 class="ts3_titlebar2">배송 정보    </h5> <input type="checkbox" id="btn_same"  ><div style="text-align: right;">구매자 정보와 동일</div>
					<script type="text/javascript">
						/* $("#btn_same").click(function(){
							var checked = $("#btn_same").attr("checked");
								alert(checked);
						}); */
						
						
					$(document).ready(function(){
						var name_buyer =  $("#name_buyer").val(); 
						var tel_buyer = $("#tel_buyer").val();
						var email_buyer = $("#email_buyer").val();
						
						$("#btn_same").click(function(){
						
							var checked = $("#btn_same").val();
					
								if(checked == 'on'){   //일단 조건 들어간다
									$("#name").val(name_buyer);
									$("#tel").val(tel_buyer);
									$("#email").val(email_buyer);
									var checked = $("#btn_same").val('off');	
								}else if(checked == 'off'){
									$("#name").val("");
									$("#tel").val("");
									$("#email").val("");
									var checked = $("#btn_same").val('on');	
								}
							
					
							
						});
					});
						
						  
					</script>
					<form action="depositFinish" method="get" >
	<input type="hidden" value="${view.num}" name="numBook">
	<input type="hidden" value="${view.product}" name="product">
	<input type="hidden" value="${view.id}" name="idSeller">
	<input type="hidden" value="${member.id }" name="idBuyer">
	<input type="hidden" value="${view.status }" name="status" >

					<h5 class="ts3_titlebar3">
						받는 사람 <input type="text" class="text" placeholder="이름" name="name" id="name"></h5>
					<h5 class="ts3_titlebar3">
						휴대폰 번호 <input type="text" class="text" name="tel" id="tel" placeholder="휴대폰 번호"></h5> 
					<h5 class="ts3_titlebar3">	
						이메일 <input type="text" class="text" name="email" id="email"placeholder="이메일"></h5> 
					<h5 class="ts3_titlebar3">	
						주소 <input type="text" class="text" id="address" name="address" placeholder="주소"></h5>
					<h5 class="ts3_titlebar2">
						<!-- <button class="mu">
							무통장입금(가상계좌)
							<div class="su">수수료 500원</div>
						</button> -->
						
					</h5>
				<div id="sellbtndiv">
					<input type="submit" class="sellbtn" id="sellbtn" value="주문 완료">
				</div>	
						</form>
				</div>
				</div>
				
			</div>	
			
	
		
	
	<%@ include file="../../common/footer.jsp"%>
</body>
</html>