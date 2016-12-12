<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">

<style type="text/css">
#s_div1{
	width: 100%;
	height: 300px;
	margin-top: 100px;
	border: 1px solid green;
}
.s_div2{
	width:  200px;
	height: 100%;
	margin-left: 6%;
	float: left;
	text-align: center;
	border: 1px solid red;
}
#s_div3{
	width: 90%;
	height: 100%;
	margin: 0 auto;
	border: 1px solid yellow;
}
.mySlides{
	width: 200px;
	height: 250px;
	display:none;

}
</style>
</head>
<!-- <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"> -->

<body>
<<<<<<< HEAD
<script type="text/javascript"> 
function test() { 
var td = document.getElementById("test"); 
var n = Number(td.innerHTML); 
td.innerHTML = n + 1; 
} 
</script> 

<input type="button" value="push" onclick="test()" /> 

<table border="1"><tr><td id="test"></td></tr></table>


=======
>>>>>>> branch 'master' of https://github.com/GOYOUHWAN/finalProjectGit.git
<div>
	<!-- Header Start -->
		
	<!-- Header End -->
	
	<!--section 시작  -->
	<section id="section_wrap">
	<nav id="nav_all">
	<%@ include file = "common/header.jsp" %>
	<div id="s_div1">
	
		<div id="s_div3">
			<div class="w3-content w3-section s_div2" style="max-width:200px" >
			추천
			  <img class="mySlides" src="/proxyProject/resources/upload/dogani.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/osaka.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/blood.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/harry.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/mar.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/power.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/three.jpg" style="width:100%">
			  <img class="mySlides" src="/proxyProject/resources/upload/axe.jpg" style="width:100%">
		</div>
			<script>
					var myIndex = 0;
					carousel();
					
					function carousel() {
					    var i;
					    var x = document.getElementsByClassName("mySlides");
					    for (i = 0; i < x.length; i++) {
					       x[i].style.display = "none";  
					    }
					    myIndex++;
					    if (myIndex > x.length) {myIndex = 1}    
					    x[myIndex-1].style.display = "block";  
					    setTimeout(carousel, 2500); // Change image every 2.5 seconds
					}
					</script>
			<div class="s_div2">
				인기도
			</div>
			<div class="s_div2">
				판매자 신용도
			</div>
			<div class="s_div2">
				구매자 신용도
			</div>
			</div>
		</div>
	</nav>
	</section>	
	<!--section 끝  -->
	
	<!-- Footer Start -->
		<%@ include file = "common/footer.jsp" %>
	<!-- Footer End -->
</div>
</body>
</html>