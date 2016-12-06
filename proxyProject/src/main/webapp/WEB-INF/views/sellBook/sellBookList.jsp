<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

//cookie 이용 script 구현 안되어있고 코드만 미리 가져다 놓음 ==>>>구현해줘야함.
function setCookie(cname,cvalue,exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    var user=getCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
       user = prompt("Please enter your name:","");
       if (user != "" && user != null) {
           setCookie("username", user, 30);
       }
    }
}

</script>


<style type="text/css">


#listTable{
	width : 80%;
	margin-left: 150px;
	margin-top: 240px;
}
#td_book{
	border: 1px solid red;
	height: 400px;
	margin-left: 100px;
	margin-top: 100px;
}
#div_img{
	border : 1px solid yellow;
	width: 100%;;
	height: 300px;
}
#img{
	size: inherit; 
	width: 80%;
	height: 100%;
	border: 1px solid green;
	margin-left: 25px;
	}
#body_sellbooklist{
	height: 1200px;
}
.pad{
	text-align:center;
	border : 1px solid green;
	margin-top: 15px;

}
.zzim{
	width: 20px;
	height: 20px;
}



</style>
</head>
<body id="body_sellbooklist">
<%@ include file = "../common/header.jsp" %>


<!-- 리스트 시작 -->
          <table id="listTable">
         <c:forEach begin="0" end="${listsize/4}">
            <tr >
               <c:forEach begin="0" end="3">
               <c:set var="count" value="${count+1}"/>
               <c:if test="${check}">  
	                  <c:if test="${listsize =='0' }">
	                 	 <c:set var="no" value="true"/>
	                  </c:if>
	                  
	                  <c:if test="${listsize !='0' }">
	                     <td id="td_book">
	                     ID :<a href="sellBookView?num=${list[count].num}&id=${list[count].id}">${list[count].id}</a>
	                        <div id="div_img">
	                        <a href="sellBookView?num=${list[count].num}&id=${list[count].id}"><img class="img1" id="img"src="<%=application.getContextPath() %>/resources/upload/${list[count].files1}"> </a><br>
	                       </div>
	                       
	                        <div class="pad">
	                         	책이름 :<a href="sellBookView?num=${list[count].num}&id=${list[count].id}"><span class="pink name">${list[count].product}</span></a><br>
	                         	가격 : ${list[count].price} 원
	                    	  	&nbsp;&nbsp;&nbsp;&nbsp;<span>찜  : </span><span class="pink name">${list[count].likes}</span>
								
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
