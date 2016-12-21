<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div class="content_wrap">
		<div id="n2_nboard">
			<!-- 목록버튼 -->
			<div class="option">
				<a href="noticeList" class="list_button">
					<img src = "${pageContext.request.contextPath}/resources/image/btn_list.gif">
				</a>
			</div>
			<div class="view">
				<div class="toparea_wrap">
					<div>
						<!-- title -->
						<div id="n2_elTitleContainer" class="title_wrap">
							<h3 class="title">[복구완료] 12/12 (월), '백과사전' 서비스의 장애 현상이 정상화
								되었음을 알려드립니다.</h3>
							<div class="add_info">조회 102</div>
						</div>
						<!-- 날짜 -->
						<div class="private_wrap">
							<div class="date">16.12.14.&nbsp;&nbsp;&nbsp;
								<span class="time">19:00</span>
							</div>
						</div>
					</div>
				</div>
				<!-- content -->
				<div class="content_wrap">안녕하세요. 19시 23분부터 19시 54분까지 백과사전
					서비스에서 웹페이지에 접속되지않는 현상이 발생하였고, 긴급하게 수정작업을 진행하여 현재는 정상적으로 서비스를 이용하실 수
					있습니다. 보다 안정적인 서비스를 위해 최선을 다하는 네이버가 되겠습니다. 감사합니다. 2016년 12월 12일</div>
			</div>
			<div class="list">
				<div class="list_paging">
					<ul class="list_ul">
						<li>
							<span class="status">
								<a href="#">이전</a>
							</span>
						</li>
						<li>[복구완료] 12/12 (월), '백과사전' 서비스의 장애 현상이 정상화
								되었음을 알려드립니다.</li>
						<li>
							<span class="status">
								<a href="#">다음</a>
							</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>