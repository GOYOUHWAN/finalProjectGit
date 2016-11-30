<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Page</title>
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

.mypage-menu {
	display: inline-block;
	width: 234px;
	padding: 22px 0;
	border: 1px solid #d8d8d8;
	border-radius: 3px;
	margin: 30px 14px 50px 0
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
	width: 732px;
	vertical-align: top;
	display: inline-block;
	border: 1px solid #d8d8d8;
	border-radius: 3px;
	margin-top: 30px;
	margin-bottom: 50px;
}

.mypage-header {
	font-size: 24px;
	padding: 22px 0 22px 34px;
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
	padding-bottom: 10px;
	font-size: 14px
}

.mypageodr-header-info {
	width: 350px;
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
	float: right;
}
</style>
</head>
<body>
	<div class="mypage-menu">
		<a class="mypage-menu-item" href="#">구매자관리</a>
		<a class="mypage-menu-item" href="#">판매자관리</a>
		<a class="mypage-menu-item" href="#">블랙리스트관리</a>
		<div class="mypage-menu-hr"></div>
		<a class="mypage-menu-item" href="#">회계관리</a>
		<div class="mypage-menu-hr"></div>
		<a class="mypage-menu-item" href="#">게시글관리</a>
	</div>
	<div class="mypage-content">
		<div class="mypage-header">구매자관리</div>
		<div class="mypage-body ng-scope">
			<div class="mypageodr-table-header">
				<div class="mypageodr-header-info">ID</div>
				<div class="mypageodr-header-state">이름</div>
				<div class="mypageodr-header-btns">관리</div>
			</div>
			<div>
				<!-- ngRepeat: order in currentItems -->
				<div class="mypage-item-wrapper ng-scope">
					<div class="mypageodr-item-info">
						<div class="mypageodr-item-price ng-binding">회원아이디</div>
					</div>
					<div
						class="mypageodr-item-state mypageodr-item-state-title ng-binding">회원이름</div>
					<div class="mypageodr-item-btn-wrapper">
						<a class="btn btn-default btn-expanded mypageodr-delete-btn"
							ng-click="removeItem(order);unbookmarkOrderFromList(order);trackButton('unbookmark')">삭제</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>