<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/help_inquiry.css">
</head>
<body>
<section id="container" class="wrap_leave">
	<div id="content" class="inquiry non_sign">
		<div class="content_header">
			<h2>
				<img alt="findid" src="${pageContext.request.contextPath}/resources/image/h_find_id.gif">
			</h2>
		</div>
		<p class="content_summary">고객님의 정보와 일치하는 아이디 목록입니다.</p>
		<form action="login">
			<div class="section_find">
				<div class="box6 result" style="text-align:center; height:57px;" >
					<ul class="list_id" style="list-style:none;">
						<li><strong>
						
						<c:choose>
							<c:when test="${find eq null }">
								<p>일치하는 ID가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<input type="radio">
								<label class="label_rd">${find }</label>
							</c:otherwise>
						</c:choose>
						</strong></li>
					</ul>
				</div>
				<div class="btn_area">
					<a href="memberLogin" class="btn_login2"></a>
					<a href="findPW"  class="btn_findpw"></a>
				</div>
				<div id="div_joinGuide_open" class="find_dsc open" style="display: block;">
					<h3>
						가입한 아이디가 보이지 않나요?
						<a href="#" >상세정보펼치기
							<em class="ico_arr"></em>
						</a>
					</h3>
				</div>
			</div>
		</form>
	</div>
</section>
</body>
<script type="text/javascript">
	
</script>
</html>