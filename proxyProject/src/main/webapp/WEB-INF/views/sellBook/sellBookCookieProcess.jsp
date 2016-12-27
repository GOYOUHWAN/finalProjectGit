<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	//쿠키저장
		String pic = request.getParameter("pic");
		String num = request.getParameter("num");
		Cookie[] cookies = request.getCookies(); 
		for(int i=0;i<cookies.length;i++){
			System.out.println(i+"쿠키 "+cookies[i]);
			if(cookies[i].equals(pic)){ //쿠키 중복되면 이전 쿠키 삭제
				
				Cookie kc = new Cookie(pic, null) ;
				kc.setMaxAge(0) ;
				response.addCookie(kc) ;
			}
			Cookie c = new Cookie(pic, num);
			c.setMaxAge(60); 
			response.addCookie(c);
		}
		
	%>
</body>
<script type="text/javascript">
	location.href="sellBookView";
</script>
</html>