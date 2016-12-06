<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mySlides {
	display:none;
	width: 500px;
	height: 500px;
	}
.demo {
	cursor:pointer;
	}
.view_img{
	width: 100px;
	height: 100px;
	margin-left: 5px;
	display: inline;
	}
.view_div{
	margin-top: 10px;
}
.view_div_img{
	width: 90%;
	margin: 0 auto;
	border: 1px solid blue;
}
#view_div_1{
	margin-top: 200px;
	border: 1px solid red;
	display: inline-block;
	float: left;
}
#view_div_outside{
	width: 100%;
	height: 1000px;
	padding-top: 0px;
	border: 1px solid black;
}
#view_div_inside{
	width: 80%;
	height: 100%;
	border: 1px solid yellow;
	margin: 0 auto;
}
#div_name{
	width: 50%;
	height: 500px;
	border: 1px solid green;
	display: inline-block;
	float: left;
	margin-top: 200px;
}
#view_table{
	width : 90%;
	float : right;
	border: 1px solid red;
}
table tr, td{
	border: 1px solid red;
}
.view_button{
	width: 50%;
	height: 40px;
}
</style>

</head>
<body>
<%@ include file = "../common/header.jsp" %>

<div id="view_div_outside">
<div id="view_div_inside">
	<div id="view_div_1"class="w3-content" style="max-width:500px">
	  <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files1 }" >
	  <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files2 }" >
	  <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files3 }" >
	    <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files4 }" >
	
	  <div class="view_div w3-row-padding w3-section">
	    <div class="view_div_img  w3-col s4">
	      	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files1 }" onclick="currentDiv(1)">
	    	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files2 }" onclick="currentDiv(2)">
	   	 	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files3 }" onclick="currentDiv(3)">
	  		<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files4 }" onclick="currentDiv(4)">
	    </div>
	  </div>
	</div>
	
	<div id="div_name">
		<table id="view_table">
			<tr>
				<td><h2>판매자 : ${view.id }</h2>
								판매자 신용도 : ${viewMember.seller_trust }
				</td>
			</tr>
			<tr>
				<td><h1>책 제목 : ${view.product }</h1><br>
								구매 날짜 : ${view. buy_date}
				</td>
			</tr>
			<tr>
				<td><h2>${view.price } 원</h2></td>
			</tr>
			<tr>
				<td>줄거리 : ${view.contents }</td>
			</tr>
			<tr>
				<td>좋아요 : ${view.likes }</td>
			</tr>
			<tr>
				<td><input type="submit" class="view_button"><input type="submit" class="view_button"></td>
			</tr>
			
		</table>
	</div>
	
	
</div>
</div>



<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>

</body>
</html>