<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC >

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/common.css">
<style type="text/css">
<<<<<<< HEAD

=======
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/GOYOUHWAN/finalProjectGit.git
#h_div1 {
	width: 100%;
	height: 30px;
	/* border: 1px solid green; */
}

#h_ul1 {
	height: 100%;
	list-style-type: none;
	float: right;
	margin-top: 0px;
	margin-right: 9px;
}

.h_li1 {
	height: 100%;
	float: left;
	margin-left: 8px;
	margin-right: 10px;
	font-size: 16px;
	/* border: 1px solid red; */
}

#h_ul2 {
	width: 100%;
	height: 35px;
	list-style-type: none;
	margin-top: 0px;
	text-align: center;
	background-color: #7151FC;
	padding-top: 13px;
	padding-left: 110px;
}
#h_div1{
		width: 100%;
		height: 30px;
		/* border: 1px solid green; */
	}
#h_ul1{
		height: 100%;
	    list-style-type: none;
	    float: right;
	    margin-top: 10px;
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
	    height: 35px;
	    list-style-type: none;
	    margin-top: 0px;
	    text-align: center;
	    background-color: #7151FC;
	    padding-top: 13px;
	    padding-left: 110px;

}

.h_li2 {
	width: 250px;
	height: 25px;
	float: left;
	margin: 0 auto;
	/* 		border: 1px solid red; */
}

.header_a:hover {
	text-decoration: underline;
/* 	color: white; */
}

.acolor {
	color: gray;
}

.acolor2 {
	color: gray;
	margin-left: 15px;
}

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
/* 		border: 1px solid black;  */
	}
	#h_ul2{
		width: 80%;
	    height: 35px;
	    list-style-type: none;
	    margin-top: 0px;
	    margin : 0 auto;
	    text-align: center;
	    background-color: #7151FC;
	    padding-top: 13px;
		
/*     border: 2px solid green;  */
	}
	.h_li2{
		width : 24.8%;
		height: 25px;
		margin: 0 auto;
		float: left;
		text-align: center;
/* 	border: 1px solid red;  */
	
	}
	.header_a:hover{
		text-decoration: underline;
		color: white;
	}
	.acolor {
    	color: gray;
	}
	.acolor2 {
    	color: gray;
    	margin-left: 15px;
	}
#h3_for_test{
	color: black;
	font-size: 16px;
}	
/* 중고책 dropdown 관련 css */
.dropdown {
    position: relative;
    display: inline-block;

}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

    z-index: 1;
}

.dropdown:hover .dropdown-content {
    display: block;
        background-color: #7151FC;
        text-align: left;
}
/* dropdown 관련 css 끝 */




</style>


</head>
<body>

	<header id="header_wrap">

		<div id="header_div_1">
			<div id="h_div1">

			
				<ul id="h_ul1">
				
					<c:if test="${sessionScope.member == null}">
					<li class="h_li1"><a href="${pageContext.request.contextPath}/member/memberLogin" class="acolor">로그인</a></li>
					</c:if>
						<c:if test="${sessionScope.member != null}">
							<li class="h_li1 acolor">${member.id }님</li>
							<li class="h_li1"><a href="${pageContext.request.contextPath}/member/memberView" class="acolor">회원 정보</a></li>
							<li class="h_li1"><a href="${pageContext.request.contextPath}/memberLogout" class="acolor">로그아웃</a></li>
						</c:if>
					<li class="h_li1">
						<!-- 일반 회원용 --> 
						<c:if test="${member.type =='1'}">
							<a href="<%=application.getContextPath() %>/member/buyer/myPage?type=${member.type}&id=${member.id}" class="acolor">마이페이지</a>
						</c:if> 
						<!--판매자용  --> 
						<c:if test="${member.type =='2'}">
							<a href="<%=application.getContextPath() %>/member/seller/myPage?type=${member.type}&id=${member.id}" class="acolor">마이페이지</a>
						</c:if> 
						<!-- 관리자용 --> 
						<c:if test="${member.type =='3'}">
							<a href="<%=application.getContextPath()%>/member/manager/manageMember?type=${member.type}&id=${member.id}" class="acolor">관리자페이지</a>
						</c:if>
					</li>
					<c:if test="${sessionScope.member == null}">
					<li class="h_li1"><a href="${pageContext.request.contextPath}/member/memberJoin" class="acolor">회원가입</a></li>
					<li class="h_li1"><a href="${pageContext.request.contextPath}/member/findID" class="acolor">아이디 찾기</a></li>
					<li class="h_li1"><a href="${pageContext.request.contextPath}/member/findPW" class="acolor">비밀번호 찾기</a></li>
					</c:if>
				</ul>
			</div>
			<div id="header_div_2">
				<a href="/proxyProject"><img src="${pageContext.request.contextPath}/resources/image/logo2.png" id="img_logo" width="150" height="60"></a>
			</div>
			<div id="a_header">
				<!--헤더에서 검색했을때 list 띄우는  -->
				<form action="${pageContext.request.contextPath}/sellBook/sellBookSearch" method="get">
					<input type="text" id="header_text" placeholder="예)나무"
						name="search"> <input type="hidden" name="id"
						value="${member.id }"> <input type="submit" value="검색"
						id="header_button">
				</form>
			</div>

			<div id="header_div_5">
				<ul id="h_ul2">
					<li class="h_li2"><a href="${pageContext.request.contextPath}/notice/noticeList"class="header_a">공지사항</a></li>
					<li class="h_li2"><a href="${pageContext.request.contextPath}/freeboard/freList" class="header_a">자유게시판</a></li>
					<c:choose>
						<c:when test="${member.type != 2 }">
							<li class="h_li2"><a href="${pageContext.request.contextPath}/sellBook/sellBookList?id=${member.id}"class="header_a">중고책 구매</a></li>
						</c:when>
						<c:when test="${member.type ==2 }">
									<li class="h_li2">
									<div class="dropdown"><span class="dropdown">중고책</span>
										 <div class="dropdown-content">
										   <p class="p_dropdown"><a href="${pageContext.request.contextPath}/sellBook/sellBookList?id=${member.id}" class="a_drop">중고책 구매</a></p>
										   <p class="p_dropdown"><a href="${pageContext.request.contextPath}/sellBook/sellBookWrite" class="a_drop">중고책 판매 등록</a></p>
										  </div>
										</div>
										</li>
						</c:when>
					</c:choose>
					<li class="h_li2"><a href="${pageContext.request.contextPath}/blackList/blackListForm"class="header_a">블랙리스트</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>