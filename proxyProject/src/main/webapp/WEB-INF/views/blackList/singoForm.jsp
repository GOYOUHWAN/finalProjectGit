<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">
<title>Insert title here</title>
<style type="text/css">
.mypage-header{
    font-size: 24px;
    padding: 5px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
}
.write_text{
	margin-left: 20px;
    width: 70%;
    height: 20px;
}
.write_contents{
	margin-left: 20px;
    width: 70%;
    height: 120px;
    margin-top: 10px;
}
.mypage-content {
   width: 732px;
   height: 530px;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
   margin-bottom: 50px;
}
#singo{
	width: 30%;
    height: 70%;
    margin-left: 30px;
    float: left;
    border: 1px solid #00ace6;
    background-color: #00ace6;
    font-size: 20px;
    color: white;
}
#list{
    border: 1px solid #737373;
    background-color: #737373;
    outline: none;
	width: 30%;
    height: 70%;
    margin-left: 30px;
    float: left;
    font-size: 20px;
    color: white;
}
#btnhere{
    width: 45%;
    height: 60px;
    margin: 0 auto;
    margin-top: 14px;
}
#singo_div{
	width:100%;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
		$(function() {
			//목록으로
			$("#list").click(function() {
				location.href = "${pageContext.request.contextPath}/blackList/blackListForm";
			});
			
/* 			// 회원 정보 변경
			$("#btn5").click(function() {
				location.href = "memberUpdate";
			}); */
		});
</script>
</head>
<body>	
	<div id="singo_div">
	<div id="join_div">
	<div class="mypage-content">
	<p class="mypage-header">신고하기</p>
	<form action="singoWrite" method="post">
		<table style="padding-bottom: 10px; border: 1px solid #d8d8d8;">
			<tr><td><br></td><td><br></td></tr>
			<tr>
				<td class="td_1">판매자아이디</td>
				<td><input type="text" name="sid" class="write_text"></td>
			</tr>
			<tr>
				<td class="td_1">작성자아이디</td>
				<td><input type="text" class="write_text" name="bid" value="${sessionScope.member.id}" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="td_1">제목</td>
				<td><input type="text" class="write_text" name="title"></td>
			</tr>
			<tr>
				<td class="td_1">내용</td>
				<td><textarea class="write_contents" rows="6" cols="20" name="contents"></textarea></td>
			</tr>
			<tr><td><br></td><td><br></td></tr>
		</table>
		<div id="btnhere">
			<input type="button" id="list" value="목록">
			<input type="submit" id="singo" value="신고하기">
		</div>
	</form>
	</div>
	</div>
	</div>
</body>
</html>