<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		/* border: 1px solid green; */
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
		font-size: 16px;
		/* border: 1px solid red; */
	}
	#h_ul2{
		width: 100%;
	    height: 30px;
	    list-style-type: none;
	    margin-top: 0px;
	    text-align: center;
	    background-color: #7151FC;
	    padding-top: 13px;
	    padding-left: 110px;
	   
	}
	.h_li2{
		width: 20%;
		height: 100%;
		float: left;
	}
	.acolor {
    	color: gray;
	}
	.acolor2 {
    	color: gray;
    	margin-left: 15px;
	}
	#music{
		float: left;
	/* 	border: 1px solid blue; */
	}
	#musicPlayer{
	width : 30px;
	height: 30px;
	float: left;
	resize: none;	
}

</style>


</head>

<body>

	<header id="header_wrap">
<!-- 	<audio  id="musicPlayer" autoplay="autoplay"  controls autoplay  >
	  					<source src="/proxyProject/resources/upload/music.mp3" type="audio/mpeg">
					</audio> -->   
		<div id="header_div_1">
			<div id="h_div1">
				
				<ul id="h_ul1">
					
					<li class="h_li1"><a href="${pageContext.request.contextPath}/member/memberLogin" class="acolor">로그인</a></li>
					<li class="h_li1">
				 		<!-- 일반 회원용 -->      
						<c:if test="${member.type =='1'}"> 
						<a href="<%=application.getContextPath() %>/member/buyer/myPage?type=${member.type}&id=${member.id}" class="acolor">마이페이지</a>
						<a href="freeboard/freeboardList" class="acolor2">freeboard</a>
						<a href="member/buyer/myBookList?id=${member.id }" class="acolor2"> myBookList</a>
						</c:if>
						   
						   <!--판매자용  -->
						      <c:if test="${member.type =='2'}"> 
						<a href="<%=application.getContextPath() %>/member/seller/myPage?type=${member.type}&id=${member.id}" class="acolor">마이페이지</a>
						<a href="freeboard/freeboardList" class="acolor2">freeboard</a>
						<a href="member/buyer/myBookList?id=${member.id }" class="acolor2"> myBookList</a>
						   </c:if> 
						   
						   <!-- 관리자용 -->
						      <c:if test="${member.type =='3'}">
						<a href="<%=application.getContextPath()%>/member/manager/manageMember?type=${member.type}&id=${member.id}" class="acolor">관리자페이지</a>
						   </c:if>
					</li>
					<li class="h_li1"><a href="${pageContext.request.contextPath}/member/memberJoin" class="acolor">회원가입</a></li>
					<li class="h_li1"><a href="member/memberJoin" class="acolor">아이디 찾기</a></li>
					<li class="h_li1"><a href="member/memberJoin" class="acolor">비밀번호 찾기</a></li>
				</ul>
			</div>
			<div id="header_div_2">
				<a href="/proxyProject"><img src="${pageContext.request.contextPath}/resources/image/logo2.png" id="img_logo" width="150" height="60"></a>
			</div>
			<div id="a_header">			
				<!--헤더에서 검색했을때 list 띄우는  -->
				<form action="/sellBook/sellBookList">	
					<input type="text" id="header_text"  placeholder="예)나무" name="search">
					<input type="submit" value="검색" id="header_button" >
				</form>	
			</div>	

			<div id="header_div_5">	
				<ul id="h_ul2">
					<li class="h_li2"><a>공지사항</a></li>
					<li class="h_li2"><a href="${pageContext.request.contextPath}/freeboard/freList">자유게시판</a></li>
					<li class="h_li2"><a href="${pageContext.request.contextPath}/sellBook/sellBookList">물품 구매</a></li>
					<li class="h_li2"><a href="${pageContext.request.contextPath}/blackList/blackListForm">블랙리스트</a></li>
				</ul>
			</div>

</div>
	</header>
</body>
</html>