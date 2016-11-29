<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 일반회원용 myPage</h2>

<a href="myBookList?id=${member.id }">myBookList</a>
<a href="myBoardList?id=${member.id} ">myBoardList</a>
<a href=" ">회원정보수정</a>
<a href="myBuyList?id=${member.id}">책_구매목록</a>



</body>
</html>