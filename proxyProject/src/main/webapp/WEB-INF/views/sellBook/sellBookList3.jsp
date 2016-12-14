<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">

<title>높은 가격순booklist</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">



//cookie 이용 script 구현 안되어있고 코드만 미리 가져다 놓음 ==>>>구현해줘야함.
/* function setCookie(cname,cvalue,exdays) {
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
} */



</script>


<style type="text/css">


#listTable{
	width : 80%;
	margin : 0 auto;
	margin-top: 50px;

}
#td_book{
	/* border: 1px solid red; */
	height: 400px;
	margin-left: 100px;
	margin-top: 100px;
}
#div_img{
	/* border : 1px solid yellow; */
	width: 100%;;
	height: 300px;
}
#img{
	border-radius : 0px;
	size: inherit; 
	width: 80%;
	height: 100%;
	/* border: 1px solid green; */
	margin-left: 25px;
	}
#body_sellbooklist{
	height: 1200px;
}
.pad{
	margin : 0 auto;
	width : 80%;
	text-align: left;
/* 	border : 1px solid green;  */
	margin-top: 15px;

}
.name{
	font-size: 16px;
}
.zzim{
	width: 20px;
	height: 20px;
}
#div_likes{
	height : 30px;
	margin-top : 30px;
	margin: 0 auto;
	margin-bottom: 60px;
/* 	border: 1px solid red;   */
	float: left;
}
.img_likes{
	margin-top : 15px;
	border-radius : 0px;
	width: 20px;
	height: 20px;
}
#p_price{
	font-size: 22px;
	float: left;
}
#p_won{
	font-size: 13px;
	color: gray;
	margin-top: 6px;
}
#line_order{
	border-bottom: 1px;
	border-bottom-color: gray;
	border-bottom-style: solid;
	width: 80%;
	margin: 0 auto;
	margin-top: 150px;
}

	</style>
</head>
<body id="body_sellbooklist">
<%@ include file = "../common/header.jsp" %>

<!--정렬 시작  -->
	<div id="line_order">
	<a href="<%=application.getContextPath() %>/sellBook/sellBookList2">낮은가격순</a> 
	<a href="<%=application.getContextPath() %>/sellBook/sellBookList3">높은가격순</a>
	<a href="<%=application.getContextPath() %>/sellBook/sellBookList4"> 최신순</a>
	<a href="<%=application.getContextPath() %>/sellBook/sellBookList5"> 좋아요순</a> </div>
<!--정렬 끝  -->

<!-- 리스트 시작 -->
          <table id="listTable">
         
         <c:forEach begin="0" end="${listsize3/4}">
            <tr >
               <c:forEach begin="0" end="3">
              
               <c:if test="${check3}">  
	                  <c:if test="${listsize3 =='0' }">
	                 	 <c:set var="no" value="true"/>
	                  </c:if>
	                  
	                  <c:if test="${listsize3 !='0' }">
	                     <td id="td_book">
	                     <!--id 보여주는 곳  -->
	                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매자 :<%-- <a href="sellBookView?num=${list[count].num}&id=${list[count].id}"> --%>${list3[count].id}<!-- </a> -->
	                     		
	                        <div id="div_img">
	                     <!--책 img 보여주는곳  -->
	                       <a href="sellBookView?num=${list3[count].num}&id=${list3[count].id}"> <img class="img1" id="img"src="<%=application.getContextPath() %>/resources/upload/${list3[count].files1}">  </a><br>
	                       </div>
	                       
	                        <div class="pad">
	                        <!--각 책에대한 설명  -->
	                       
	                         	<span class="pink name">${list3[count].product}</span><br><br>
	                         	 <p id="p_price">${list3[count].price}</p> <p id="p_won">원</p>
	                    	  	&nbsp;&nbsp;&nbsp;&nbsp;
	                    	  	
	                    	  	<div id="div_likes" > <img src="/proxyProject/resources/image/black_heart.png" class="img_likes" id="img_heart${list3[count].num }" onclick="change_img_to_red(${list3[count].num})">
	                    	  	&nbsp;&nbsp; <span id="spanLikes${list3[count].num }">${list3[count].likes}</span>
	                    
	                    	  	
	                    	  	<script>
	                    		var likess = "${list3[count].likes}";
                	  			var id = "${member.id}";

	                    	  	 function change_img_to_red(num) {
	          
	                    	  		var heart = document.getElementById("img_heart"+num).src;
										if(heart =="http://localhost:8080/proxyProject/resources/image/black_heart.png"){
										 	 	document.getElementById("img_heart"+num).src = "/proxyProject/resources/image/heart.jpg"; 
										 		$.ajax({
			                    					url:'changeLikesBlack',
			                    					type:'POST',
			                    					data : {id:id, num:num}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴(bookDTO)을 의미
			                    						$("#spanLikes"+num).html(result.likes);             
			                    					},
			                    					error:function(e){
			                    						alert("eeeeeeeeeeeeeee");
			                    					}
			                    				});
										 	 }else{
										 		//여기로 들어오면 memberLikeBooks에 한줄 삭제하고 , books에 likes -1
										 		document.getElementById("img_heart"+num).src="/proxyProject/resources/image/black_heart.png";
										 		$.ajax({
			                    					url:"changeLikesRed",
			                    					type:"POST",
			                    					data : {id:id, num:num}, 	
			                    					success:function(result) {
			                    						$("#spanLikes"+num).html(result.likes);        
			                    					},
			                    				});
										 	 }	                      	 	
									 
	                    	  	 }
	                	 
									 </script>
	                    	  	</div>
	                    	  
	                    	  	<!--하... 스크립트로 클릭하면 하트 모양 또는 색깔 바꾸기   -->
	                        </div>
	              
	                     </td>
	                  </c:if>
              	  </c:if>  
                  <c:if test="${(count+1) ==listsize3}">
                     <c:set var="check3" value="false"/>
                  </c:if>
                   <c:set var="count" value="${count+1}"/>
               </c:forEach>
            </tr>
         </c:forEach>
         </table>
                   
         <!-- 리스트 끝 -->
         <c:if test="${no}">
            <p id="tagisp">조회된 결과가 없습니다. 다른 조건으로 검색해보세요!</p>
         </c:if> 
         	
<!--paging  시작 -->
		<!-- 목차, 글쓰기 -->
		<div id="listnum">
		<!-- 뒤로가기 -->

		<c:if test="${paging3.curBlock>'1'}">
			<a href="sellBookList3?curPage=${paging3.startNum-1}"> 이전 </a>
		</c:if>
		<!-- 목차번호 -->
		
		<c:forEach begin="${paging3.startNum}" end="${paging3.lastNum}" step="1" var="i">
			<a href="sellBookList3?curPage=${i}">${i}</a>
		</c:forEach>
		
		<!-- 앞으로 가기 -->
		<c:if test="${paging3.curBlock < paging3.totalBlock}">
			<a href="sellBookList3?curPage=${paging3.lastNum+1}"> 다음 </a>
		</c:if>
			
		</div>
<!--paging 끝 -->
</body>
</html>
