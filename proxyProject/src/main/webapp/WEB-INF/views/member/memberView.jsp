<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#info_div {
	width: 80%;
	height: 800px;
	margin: 0 auto;
	margin-top: 30px;
}

#info_sub_1 {
	width: 80%;
	height: 100px;
	margin: 0 auto;
}

.btn_d_1 {
	width: 33.3%;
	height: 50px;
	margin: 0 auto;
	margin-top: 50px;
	float: left;	
	font-size: 20px;
	background-color: #A5E0EB;
	border: 1px solid #A5E0EB;
	color: #555;
	outline: none;
}

.btn_d_1:HOVER {
	background-color: #00ace6;
	border: 1px solid #00ace6;
	color: white;
}

/* #info_sub_2 {
	width: 60%;
	height: 600px;
	margin: 0 auto;
}
 */
#sub_div_1 {
	width: 100%;
	height: 70%;
}

#sub_div_2 {
	width: 100%;
	height: 30%;
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

.img_1 {
	margin-left: 0px;
}

.sub_table_2 {
	border: 1px solid #cccccc;
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	color: #555;
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
#like1 {
	font-weight: bold;
	font-size: 20px;
	float: left;
	margin-left: 75px;
	color: black;
}

#like2 {
	font-weight: bold;
	font-size: 20px;
	float: left;
	margin-left: 65px;
	color: black;
}

.like3 {
	font-size: 13px;
	float: right;
	color: red;
	margin-right: 30px;	
}

.categ1 {
	margin-left: 20px;
	width: 60%;
	height: 20px;
}

.categ2 {
	margin-left: 20px;
	width: 100px;
	height: 20px;
}

.categ3 {
	width: 90px;
	height: 20px;
}	

#info_sub_3 {
	width: 70%;
	height: 100px;
	margin: 0 auto;	
}

.btn_d_2 {
	width: 33.3%;
	height: 50px;
	margin: 0 auto;
	margin-bottom: 50px;
	float: left;	
	font-size: 15px;
	border: 1px solid #737373;
	background-color: white;
	color: #737373;
	outline: none;
}

.btn_d_2:HOVER {
	background-color: #737373;
	border: 1px solid white;
	color: white;
}
* {
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

body {
   font-family: "NanumGothic", "Helvetica Neue", Helvetica, Arial,
      sans-serif;
   padding-bottom: 60px;
   color: #141823;
   line-height: 1.42857;
}

a {
   color: #298cd8;
   text-decoration: none;
   cursor: pointer;
   background: transparent;
}

.btn {
   display: inline-block;
   margin-bottom: 0;
   font-weight: normal;
   text-align: center;
   vertical-align: middle;
   cursor: pointer;
   background-image: none;
   border: 1px solid transparent;
   white-space: nowrap;
   /* padding: 6px 12px; */
   font-size: 14px;
   line-height: 1.42857;
   border-radius: 3px;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

.btn-default {
   color: #333;
   background-color: #fff;
   border-color: #ccc;
}

.btn-expanded {
   width: 85%;
}

.mypage-menu {
    display: inline-block;
    width: 234px;
    padding: 22px 0;
    border: 1px solid #d8d8d8;
    border-radius: 3px;
    margin: 30px 14px 50px 90px;
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

.mypage-menu-item.active {
   font-weight: bold;
   background-color: #f5f5f5
}

.mypage-menu-hr {
   border-top: 1px solid #d8d8d8;
   margin: 10px
}

.mypage-content {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;

}

.blacklist-header {
   width: 70%;
   float: left;
}
.blacklist-header2 {
   width: 30%;
    padding: 32px 0 20px 34px;
    border-bottom: 1px solid #d8d8d8;
   float: left;
   margin-bottom: 20px;
}
#blacktitle {
   font-size: 24px;
   padding: 20px 0 20px 34px;
   border-bottom: 1px solid #d8d8d8;
}
.mypage-body {
   padding: 33px;
}

.mypage-item-wrapper {
   padding: 16px 0;
}

.mypage-item-wrapper+.mypage-item-wrapper {
   border-top: 1px solid #d8d8d8;
}

.mypageodr-table-header {
   border-bottom: 1px solid #d8d8d8;
   margin-top: 10px;
   padding-bottom: 10px;
   font-size: 14px
}

.mypageodr-header-info {
   width: 60px;
   display: inline-block;
   text-align: center
}

.mypageodr-header-info-tel {
   width: 150px;
   display: inline-block;
   text-align: center
}

.mypageodr-header-state {
   width: 188px;
   display: inline-block;
   text-align: center;
}

.mypageodr-header-btns {
   width: 120px;
   display: inline-block;
   text-align: center;
}

.mypageodr-item-info {
   width: 60px;
   display: inline-block;
   margin-left: 20px;
   vertical-align: middle
}

.mypageodr-item-price {
   font-size: 14px;
   text-align: center;
}

.mypageodr-item-state {
   width: 60px;
   display: inline-block;
   font-size: 12px;
   color: #000;
   vertical-align: middle
}

.mypageodr-item-tel {
   width: 150px;
   display: inline-block;
   font-size: 12px;
   color: #000;
   vertical-align: middle
}

.mypageodr-item-state-title {
   font-size: 14px;
   color: #000;
   text-align: center
}

.mypageodr-item-btn-wrapper {
   display: inline-block;
   width: 90px;
   padding: 0 20px;
   text-align: center;
   vertical-align: middle;
}

.mypageodr-item-btn-wrapper .btn+.btn {
   margin-top: 6px;
    text-align: center;
}

.mypageodr-delete-btn {
  /*  display: block; */
}

.mypage-page-wrapper {
   padding: 20px 0;
   text-align: center;
   border-top: 1px solid #d8d8d8
}

.mypage-page {
   text-align: center;
   width: 24px;
   height: 24px;
   font-size: 12px;
   display: inline-block;
   padding-top: 4px
}

.mypage-page.active {
   background-color: #d8d8d8;
   border-radius: 3px;
   color: #fff
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
}
.bottom-hr{
	border-bottom: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
		$(function() {
			
			$("#btn1").css("background-color", "#00ace6");
			$("#btn1").css("color", "white");
	
			// HOME
			$("#btn4").click(function() {
				location.href = "../";
			});
	
			// 회원 정보 변경
			$("#btn5").click(function() {
				location.href = "memberUpdate";
			});
	
			// 회원 탈퇴
			$("#btn6").click(function() {
				 $.ajax({
					url : "memberDelete",
					type : "POST",
					data : {
						id : $("#getId").text()
					},
					success : function(result) {
						alert(result);
						location.href="../";
					} 
				});
			});
		});
	</script>
	
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
<!-- info -->
	<div class="mypage-menu">
		<a class="mypage-menu-item active" href="${pageContext.request.contextPath}/member/memberView">회원정보</a> 
		<div class="mypage-menu-hr"></div>
		<div class="mypage-menu-item">마이페이지</div>
		<a class="mypage-menu-item2" href="<%=application.getContextPath() %>/member/seller/myBookList?type=${member.type}&id=${member.id}">- 좋아요 내역</a>
		<a class="mypage-menu-item2" href="<%=application.getContextPath() %>/member/seller/myBoardList?id=${member.id }">- 게시판 글 내역</a>
		<a class="mypage-menu-item2" href="<%=application.getContextPath() %>/member/seller/myBuyList?id=${member.id }">- 구매 내역</a>
	</div>
	<div class="mypage-content">
		<div class="mypage-header">회원 정보</div>	
			<table>
				<!-- 아이디 -->
				<tr>
					<td class="td_3">기본정보</td>
					<td class="td_1">아이디</td>
				</tr>
				<tr>
					<td rowspan="9" class="bottom-hr"></td>
					<td id="getId" class="td_2">${ member.id }</td></tr>
				<!-- 이름 -->
				<tr>
					<td class="td_1">이름</td>
				</tr>
				<tr><td class="td_2">${ member.name }</td></tr>
				<!-- 나이 -->
				<tr>
					<td class="td_1">생년월일</td></tr>
				<tr><td class="td_2">${ member.year }</td></tr>
				<!-- 휴대폰 번호 -->
				<tr>
					<td class="td_1">휴대폰 번호</td></tr>
				<tr><td class="td_2">${ member.tel }</td></tr>
				<!-- E-MAIL -->
				<tr>
					<td class="td_1">E-MAIL</td></tr>
				<tr><td class="td_2">${ member.email }</td></tr>
				<!-- 주소 -->
				<tr>
					<td class="td_3">배송정보</td>
					<td class="td_1">Address</td></tr>
				<tr><td rowspan="1" class="bottom-hr"></td>
					<td class="td_2">${ member.address }</td></tr>
				<!-- 계좌번호 -->
				<tr>
					<td class="td_3">계좌 정보</td>
					<td class="td_1">계좌번호</td></tr>
				<tr><td rowspan="1" class="bottom-hr"></td>
					<td class="td_2">${ member.account }</td></tr>
			</table>
		</div>
		<div id="info_sub_3">
			<button class="btn_d_2" id="btn4">HOME</button>
			<button class="btn_d_2" id="btn5">정보 변경</button>
			<button class="btn_d_2" id="btn6">회원 탈퇴</button>
		</div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
</html>