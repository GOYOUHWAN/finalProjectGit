<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style type="text/css">
#img{
		margin: 0 auto;
		padding: 0px;
		size: inherit;
		width: 100%;
		height: 100%;
	}
#div_img{
	width: 200px;
	height: 300px;
}
</style>

</head>

<body>
<h2>sellBookList 페이지 입니다</h2>



<!-- 리스트 시작 -->
          <table id="listTable">
         <c:forEach begin="0" end="${listsize/4}">
            <tr>
               <c:forEach begin="0" end="3">
               <c:set var="count" value="${count+1}"/>
               <c:if test="${check}">  
	                  <c:if test="${listsize =='0' }">
	                 	 <c:set var="no" value="true"/>
	                  </c:if>
	                  
	                  <c:if test="${listsize !='0' }">
	                     <td>
	                        <div id="div_img">
	                        <a href="sellBookView?id=${list[count].id}"><img class="img1" id="img"src="<%=application.getContextPath() %>/resources/upload/${list[count].files1}"> </a><br>
	                       </div>
	                        <div class="pad">
	                       ID :<a href="sellBookView?id=${list[count].id}">${list[count].id}</a>
	                       	책이름 :<a href="sellBookView?id=${list[count].id}"><span class="pink name">${list[count].product}</span></a><br>
	                        <span>찜 갯수 : </span><span class="pink name">${list[count].likes}</span>
	                        </div>
	                        
	                     </td>
	                  </c:if>
              	  </c:if>  
                  <c:if test="${(count+1) ==listsize}">
                     <c:set var="check" value="false"/>
                  </c:if>
               </c:forEach>
            </tr>
         </c:forEach>
         </table>
         <!-- 리스트 끝 -->
         <c:if test="${no}">
            <p id="tagisp">조회된 결과가 없습니다. 다른 조건으로 검색해보세요!</p>
         </c:if> 
</body>
</html>
