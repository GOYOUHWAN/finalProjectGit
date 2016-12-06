<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<h2>sellBookView 페이지입니다</h2>

		<div class="w3-col s2">   
	     	<img class="demo w3-opacity w3-hover-opacity-off " src="/proxyProject/resources/upload/${files[i]}" style="width:100%; height: 50%" onclick="currentDiv(${i+1})">
		</div>		
		
		<p>NUM : ${view.num}</p>
		<p>TITLE : ${view.product }</p>
<script type="text/javascript">

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