<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
 <!-- 최근 본 상품 목록 시작 -->
         <div class="hm-visited-wrapper">
         	<div class="hm-visited-items">
				<div class="hm-visited-title">최근 본 상품</div>
				<!-- 이미지 영역 -->
					<div>
						<%	//쿠키여러개꺼내오기
							Cookie[] cookies = request.getCookies(); //몇갠지 모르니까 배열로 만든거다
							int size = cookies.length;
							if (cookies != null) {
								
								%>
								<c:set var="doneLoop" value="false" /><%
								for (int i =size-1 ; i>=0 ; i--) {
									if(cookies[i].getName().contains("JSESSIONID")){
									}else{
						%>
								<c:if test="${not doneLoop}">
								<div ng-repeat="order in currentItems">
									<a href="#">
										<div class="hm-visited-image">
										<img src="<%=application.getContextPath() %>/resources/upload/<%=cookies[i].getValue()%>">
								</div>
							</a>
						</div>
						<%if(i==size-6){ %>
							<c:set var="doneLoop" value="true" />
						<%} %>
						</c:if>
							<%}
							}
						}%>
					</div>
				</div>
         </div>
         <!-- 최근 본 상품 목록 끝 -->
</body>
</html>