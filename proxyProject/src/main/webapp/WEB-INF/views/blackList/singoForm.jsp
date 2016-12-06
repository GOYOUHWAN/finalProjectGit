<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>신고하기</h2>
	<form action="singoWrite" method="post">
		판매자아이디 : <input type="text" name="sid"><br>
		작성자아이디 : <input type="text" name="bid" value="${sessionScope.member.id}" readonly="readonly"><br>
		제목 : <input type="text" name="title"><br>
		내용<br><textarea rows="6" cols="20" name="contents"></textarea>
		<input type="submit" id="singo">
	</form>
</body>
</html>