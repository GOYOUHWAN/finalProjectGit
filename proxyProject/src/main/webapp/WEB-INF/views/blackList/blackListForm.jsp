<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackList Page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
      var message='${message}';
      if(message!=''){
         alert(message);
      }
});
</script>
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

.mypage-menu {
	text-align: center;
	padding-top: 50px;
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
   width: 860px;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
   margin-bottom: 50px;
   margin: 0 auto;
}

.blacklist-header {
   width: 65%;
   float: left;
   border-bottom: 1px solid #d8d8d8;
}
.blacklist-header2 {
   width: 35%;
    padding: 13px 0 17px 20px;
    border-bottom: 1px solid #d8d8d8;
   float: left;
   margin-bottom: 20px;
}
#blacktitle {
   font-size: 24px;
   padding: 20px 0 20px 34px;
   float: left;
}
.mypage-body {
   padding: 63px;
}

.mypage-item-wrapper {
   padding: 16px 0;
}

.mypage-item-wrapper+.mypage-item-wrapper {
   border-top: 1px solid #d8d8d8;
}

.mypageodr-table-header {
   border-bottom: 2px solid #d8d8d8;
   margin-top: 10px;
   padding-bottom: 10px;
   font-size: 14px;
   text-align: left;
}

.mypageodr-header-info {
   width: 45px;
   display: inline-block;
   text-align: center;
}
.mypageodr-header-info2 {
   width: 20px;
   display: inline-block;
}
.mypageodr-header-info-tel {
   width: 150px;
   display: inline-block;
   text-align: center;
   margin-left: 20px;
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
   width: 40px;
   display: inline-block;
   vertical-align: middle;
}
.mypageodr-item-info2 {
   width: 80px;
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
   width: 170px;
   display: inline-block;
   font-size: 12px;
   color: #000;
   vertical-align: middle;
}

.mypageodr-item-state-title {
   font-size: 14px;
   color: #000;
   text-align: center;
   margin-left: 10px;
}

.mypageodr-item-btn-wrapper {
   display: inline-block;
   width: 126px;
   padding: 0 20px;
   text-align: center;
   vertical-align: middle
}

.mypageodr-item-btn-wrapper .btn+.btn {
   margin-top: 6px
}

.mypageodr-delete-btn {
   display: block;
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
.singgo{
	background-color:#b30000; /* red; *//* #8c72fd; */
	color: white;
	padding: 10px 10px 10px 10px;
	margin-left: 10px;
}
.singgo:hover{
	background-color: #002db3;/* #7151FC; */
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
    <!-- Header Start -->
      <%@ include file = "../common/header.jsp" %>
	<!-- Header End -->

   <div class="mypage-menu">
   <div class="mypage-content">
      <div class="blacklist-header"><p id="blacktitle">블랙리스트</p></div>
      <div class="blacklist-header2">
      <c:if test="${sessionScope.member.id eq dto.id}">
      <br>
      </c:if>
      	<c:if test="${sessionScope.member.id != dto.id}">
      		<c:if test="${sessionScope.member.type eq '3'}"><br><br></c:if>
      		<c:if test="${sessionScope.member.type != '3'}">
      	<a href="singoForm">
      	<img alt="" src="${pageContext.request.contextPath }/resources/image/siren.jpg" 
      		style="float: left; margin-left:20%; margin-bottom: 9px;" width="35px;" height="35px;"></a>
      			<a href="singoForm" class="singgo" style="float: left;">신고하기</a>
      		</c:if>
      	</c:if>
      	</div>
      <div class="mypage-body ng-scope2">
         <div class="mypageodr-table-header">
         <div class="mypageodr-header-info2"></div><div class="mypageodr-header-info2"></div>
            <div class="mypageodr-header-info">ID</div>
            <div class="mypageodr-header-info2"></div>
            <div class="mypageodr-header-info2"></div>
            <div class="mypageodr-header-info">이름</div>
            <div class="mypageodr-header-info-tel">전화번호</div>
            <div class="mypageodr-header-info-tel">이메일</div>
            <div class="mypageodr-header-info2"></div>
            <div class="mypageodr-header-info2"></div>
    <!--         <div class="mypageodr-header-info">등급</div>
            <div class="mypageodr-header-info2"></div>
            <div class="mypageodr-header-info2"></div> -->
            <div class="mypageodr-header-info">기타</div>
         </div>
         <div>
               <!-- 구매자 정보 -->
               <c:forEach items="${memberInfo}" var="f">
                  <div class="mypage-item-wrapper ng-scope">
                     <div class="mypageodr-item-info">
                     <c:if test="${sessionScope.member.id != dto.id}">
                        <a class="mypageodr-item-price ng-binding"
                           href="${pageContext.request.contextPath }/blackList/blackmView?id=${f.id}">${f.id }</a>
                     </c:if>
                     <c:if test="${sessionScope.member.id eq dto.id}">
                     	${f.id }
                     </c:if>
                     </div>
                     <div class="mypageodr-header-info2"></div>
                     <div class="mypageodr-header-info2"></div>
                     <div
                        class="mypageodr-item-state mypageodr-item-state-title ng-binding">${f.name }</div>
                     <div
                        class="mypageodr-item-tel mypageodr-item-state-title ng-binding">${f.tel }</div>
                     <div
                        class="mypageodr-item-tel mypageodr-item-state-title ng-binding">${f.email }</div>
<%--                      <div
                        class="mypageodr-item-state mypageodr-item-state-title ng-binding">${f.grade }</div> --%>

                      <div class="mypageodr-item-info2">
                      <c:if test="${sessionScope.member.id != dto.id}">
                        <a class="mypageodr-item-price ng-binding"
                        	href="${pageContext.request.contextPath }/blackList/singoView?sid=${f.id}">신고 글 보기</a></div>
                 		</c:if>
                  </div>
                  
               </c:forEach>
            <div class="mypage-page-wrapper">
               <!-- pageNumber -->
               <c:if test="${listsize != '0' }">
                  <c:if test="${paging.curBlock > 1}">
                     <a href="blackListForm?curPage=${paging.startNum-1}&perPage=10">이전</a>
                  </c:if>
                  <c:if test="${paging.totalBlock>0 }">
                  <c:forEach begin="${paging.startNum}" step="1"
                     end="${paging.lastNum}" var="i">
                     <a class="mypage-page"
                        href="blackListForm?curPage=${i}&perPage=10" value="${i }">${i}</a>

                  </c:forEach>
                  </c:if>
                  <c:if test="${paging.totalBlock==0 }">
                     <h4>아직 블랙리스트가 존재하지 않습니다.</h4>
                  </c:if>
                  <c:if test="${paging.curBlock < paging.totalBlock}">
                     <a href="blackListForm?curPage=${paging.lastNum+1}&perPage=10" >다음</a>
                  </c:if>
                  <!-- PAGINATIOIN:E -->
               </c:if>
            </div>
         </div>
      </div>
   </div>
   </div>
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</body>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {   
   $(".mypage-page:eq(${totalBlock})").addClass("active");
      
});
</script>
</html>