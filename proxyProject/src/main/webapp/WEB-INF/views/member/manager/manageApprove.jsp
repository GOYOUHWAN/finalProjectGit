<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<style type="text/css">
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
    margin: 30px 14px 50px 70px;
}

.mypage-menu-item {
   padding: 8px 36px;
   display: block;
   font-size: 16px;
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
   width: 65%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
   margin-bottom: 50px;
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
.mypageodr-item-btn-wrapper {
    display: inline-block;
    width: 126px;
    padding: 0 20px;
    text-align: center;
    vertical-align: middle;
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
    padding: 6px 12px;
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
    width: 100%;
}
.mypageodr-delete-btn {
    display: block;
}
.jump{
	margin-left: 5%;
}
.jump2{
	margin-left: 4%;
}
.jump3{
	margin-left: 3%;
}
.pictext:hover{
	color: #6e9907;
	font-weight: bold;
}
.ohho{
	padding: 10px 25px;
	background-color:white;
	border: 1px solid #d8d8d8;
}
.ohho:hover{
	color: white;
	background-color: gray;
}
</style>
</head>
<body>
    <!-- Header Start -->
	<%@ include file = "../../common/header.jsp" %>
	<!-- Header End -->
	<div class="mypage-menu">
		<a class="mypage-menu-item" href="manageMember">구매자관리</a> <a
			class="mypage-menu-item" href="manageSeller">판매자관리</a> <a
			class="mypage-menu-item" href="manageBlacklist">블랙리스트관리</a>
		<div class="mypage-menu-hr"></div>
		<a class="mypage-menu-item active" href="manageApprove">판매자 승인</a>
		<a class="mypage-menu-item" href="manageDeal">거래관리</a>
		<div class="mypage-menu-hr"></div>
		<a class="mypage-menu-item" href="manageSingolist">신고글관리</a>
	</div>
	<div class="mypage-content">
		<div class="mypage-header">블랙리스트관리</div>
		<div class="mypage-body ng-scope">
			<div class="mypageodr-table-header">
				<div class="mypageodr-header-info-tel">구매자 ID</div>
				<div class="mypageodr-header-info-tel jump">주민등록증</div>
				<div class="mypageodr-header-info-tel jump">통장 사본</div>
				<div class="mypageodr-header-info-tel jump">승인 관리</div>
			</div>
			<div>
					<!-- 구매자 정보 -->
					<c:forEach items="${approveInfo}" var="f">
						
						<div class="mypage-item-wrapper ng-scope">
							<div class="mypageodr-item-tel mypageodr-item-state-title ng-binding">${f.id }</div>
							<div class="mypageodr-item-tel mypageodr-item-state-title ng-binding jump">
								<p id="name1${f.id }" onclick="name1click(${f.id });" class="pictext">주민등록증</p>
							</div>
							<div class="mypageodr-item-tel mypageodr-item-state-title ng-binding jump">
								<p id="name2${f.id }" onclick="name2click(${f.id });" class="pictext">통장 사본</p>
							</div>
							<div class="mypageodr-item-tel mypageodr-item-state-title ng-binding jump" id="approve${f.id }"><button onclick="memberApprove('${f.id }')" class="ohho">승인</button></div>
						</div>
						<!-- 사진가져오기 -->
						<div class="mypage-item-wrapper divhide" id="img1${f.id }">
							<img class="img1" id="img" src="${pageContext.request.contextPath}/resources/upload/${f.filename1}" > 
						</div>
						<div class="mypage-item-wrapper divhide" id="img2${f.id }">
							<img class="img1" id="img" src="${pageContext.request.contextPath}/resources/upload/${f.filename2}" > 
						</div>
					</c:forEach>
				<div class="mypage-page-wrapper">
					<!-- pageNumber -->
					<c:if test="${listsize != '0' }">
						<c:if test="${paging.curBlock > 1}">
							<a href="manageApprove?curPage=${paging.startNum-1}&perPage=10">이전</a>
						</c:if>
						<c:if test="${paging.totalBlock>0 }">
						<c:forEach begin="${paging.startNum}" step="1"
							end="${paging.lastNum}" var="i">
							<a class="mypage-page"
								href="manageApprove?curPage=${i}&perPage=10" value="${i }">${i}</a>

						</c:forEach>
						</c:if>
						<c:if test="${paging.totalBlock==0 }">
							<h4>아직 판매자 인증을 요청한 구매자가 존재하지 않습니다.</h4>
						</c:if>
						<c:if test="${paging.curBlock < paging.totalBlock}">
							<a href="manageApprove?curPage=${paging.lastNum+1}&perPage=10" >다음</a>
						</c:if>
						<!-- PAGINATIOIN:E -->
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Start -->
		<%@ include file = "../../common/footer.jsp" %>
	<!-- Footer End -->
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {	
	$(".mypage-page:eq(${totalBlock})").addClass("active");
	$(".divhide").hide();

	function name1click(memberid){
		$("#img2"+memberid).hide();
		$("#img1"+memberid).show();
	}
	function name2click(memberid){
		$("#img1"+memberid).hide();
		$("#img2"+memberid).show();
	}
});
//판매자 승인 
function memberApprove(memberid){
	alert("판매자승인");
	alert("memberid : "+memberid);
$.ajax({
	url:"upgrade",
	dataType : "json",
	type:"POST",
	data : {id:memberid},
	success:function(data) {
		alert("승인완료");
	},
    error : function(jqXHR, textStatus, errorThrown) {
        $("#approve"+memberid).html("승인완료");
    }
});
}

</script>
</html>
