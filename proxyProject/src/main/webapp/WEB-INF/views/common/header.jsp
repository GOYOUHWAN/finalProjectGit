<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<style type="text/css">
	#h_div1{
		width: 100%;
		height: 30px;
	}
	#h_ul1{
		height: 100%;
		list-style-type: none;
		float: right;
		margin-top: 0px;
		margin-right: 9px;
	}
	.h_li1{
		height: 100%;
		float: left;
		margin-left: 8px;
		margin-right: 10px;
	}
	#h_ul2{
		width: 100%;
		height: 100%;
		list-style-type: none;
		margin-top: 0px;
		text-align: center;
	}
	.h_li2{
		width: 20%;
		height: 100%;
		float: left;
	}
</style>
</head>
<body>
	<header id="header_wrap">
		<div id="header_div_1">
			<div id="h_div1">
				<ul id="h_ul1">
					<li class="h_li1"><a>로그인</a></li>
					<li class="h_li1"><a>마이페이지</a></li>
					<li class="h_li1"><a>회원가입</a></li>
					<li class="h_li1"><a>아이디 찾기</a></li>
					<li class="h_li1"><a>비밀번호 찾기</a></li>
				</ul>
			</div>
			<div id="header_div_2">
				<a href="/Sysdate/index.jsp"><img src="${pageContext.request.contextPath}/resources/image/logo.png" width="100" height="50"></a>
			</div>
			<div id="header_div_5">	
				<ul id="h_ul2">
					<li class="h_li2"><a>소개</a></li>
					<li class="h_li2"><a>공지사항</a></li>
					<li class="h_li2"><a>자유게시판</a></li>
					<li class="h_li2"><a>물품 구매</a></li>
					<li class="h_li2"><a>블랙리스트</a></li>
				</ul>
			</div>
			<div id="a_header">			
				<!--헤더에서 검색했을때 list 띄우는  -->
				<form action="/Sysdate/restaurant/restaurantList.hashtag">	
					<input type="text" id="header_text"  placeholder="예)나무" name="hashtag">
					<input type="submit" value="검색" id="header_button" >
				</form>	
			</div>	
			<div id="header_div_3">
			
		
			<div id="header_div_4">
			<div id="header_div_4_1">
				
				<a onclick="document.getElementById('id01').style.display='block'" >LOGIN</a>
				
		<div id="id01" class="login">
	 <div class="modal-content card-4 animate-zoom">
	

	 </div>
	</div>
	</div>
	</div>

	 </div>
	</div>

	
	</header>
</body>
</html>