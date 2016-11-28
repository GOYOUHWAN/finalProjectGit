<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			
			<%-- <%if(mDto == null){ %> --%>
			<div id="header_div_4">
			<div id="header_div_4_1">
				
				<a onclick="document.getElementById('id01').style.display='block'" >LOGIN</a>
				
		<div id="id01" class="login">
	 <div class="modal-content card-4 animate-zoom">
	
<!-- 	  <ul class="tab" class="pagination white border-bottom" style="width:100%;">
	   <li><a class="tablink" onclick="openCity(event, 'login')">로그인</a></li>
	   <li><a class="tablink" onclick="openCity(event, 'join')">회원가입</a></li>
	   <li><span  onclick="document.getElementById('id01').style.display='none'"
	   class="closebtn wpadding-top">&times;</span></li>
	  </ul> -->
	
<!-- 	  <div id="login" class="container city" class="tab">
	  <c:import url="//member/login_form.jsp"></c:import> 
	   </div>
	
	  <div id="join" class="container city" class="tab">
	    <c:import url="//member/member_join_form.jsp"></c:import>
	  </div>
	  <div class="container light-grey padding">
	  
	  </div> -->
	 </div>
	</div>
	</div>
	</div>
	<%-- <%}else{ %> --%>
<%-- 		
			<div class="dropdown">
			
		<a onclick="myFunction()" >${member.name }님<br>환영합니다 </a>
			
			
			 <div id="myDropdown" class="dropdown-content">
	    <a onclick="document.getElementById('id01').style.display='block'" >내 정보 보기</a>
		<div id="id01" class="login">
	 	<div class="modal-content card-4 animate-zoom">
	
	  <ul class="tab" class="pagination white border-bottom" style="width:100%;">
	   <li><a href="#" class="tablink" onclick="openCity(event, 'view')">내 정보 보기</a></li>
	   <li><a href="#" class="tablink" onclick="openCity(event, 'mod')">수정하기</a></li>
	     <li><span  onclick="document.getElementById('id01').style.display='none'"
	   class="closebtn wpadding-top">&times;</span></li>
	  </ul>
	
	  <div id="view" class="container city" class="tab">
	   <c:import url="//member/member_view.jsp"></c:import>
	   </div>
	
	  <div id="mod" class="container city" class="tab">
	    <c:import url="//member/member_mod_form.jsp"></c:import>
	  </div>
	  <div class="container light-grey padding">
	  
	  </div> --%>
	 </div>
	</div>
	  <a href="/Sysdate/member/logout.jsp">로그 아웃</a>
	  </div>
	</div>
	</div>
			<%-- <%} %>	 --%>	
			</div>		
	</header>
</body>
</html>