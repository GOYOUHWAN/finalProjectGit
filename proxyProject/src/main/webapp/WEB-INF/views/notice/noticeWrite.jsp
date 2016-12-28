<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	//전송버튼 클릭이벤트
	$("#save").click(function() {
		if($("#title").val()==''){
			alert("제목을 적어주세요.");
			return false;
		}else if($("#content").val()==''){
			alert("내용을 적어주세요.");
			return false;
		}else{
			$("#frm").submit();
			alert("글 등록이 되었습니다.")
		}
	});
</script>
<style type="text/css">
.mypage-content {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-top: 30px;
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
    text-align: left;
}
#save{
	width: 50%;
    height: 70%;
    margin-left: 30px;
    float: left;
    border: 1px solid #6E9907;
    background-color: #6E9907;
    font-size: 18px;
    color: white;
}
#save:hover{
	width: 50%;
    height: 70%;
    margin-left: 30px;
    float: left;
    border: 1px solid #6E9907;
    background-color: white;
    font-size: 18px;
    color: #6E9907;
}
#list{
    border: 1px solid #737373;
    background-color: #737373;
    outline: none;
	width: 40%;
    height: 70%;
    margin-left: 30px;
    float: left;
    font-size: 18px;
    color: white;
}
#list:hover{
    border: 1px solid #737373;
    background-color: white;
    outline: none;
	width: 40%;
    height: 70%;
    margin-left: 30px;
    float: left;
    font-size: 18px;
    color: #737373;
}
#btnhere{
    margin: 0 auto;
    width: 30%;
    height: 55px;
    margin-top: 20px;
}
#singo_div{
	width:100%;
	text-align: center;
}
.td_1 {
	width: 30%;
	height: 60px;
	text-align: center;
	font-size: 15px;
	background-color: #eeeeee;
	border-bottom: 1px solid #dbdada;
}
.td_2{
	text-align: left;
	padding-bottom: 10px;
	padding-top: 10px;
	margin-left: 10%;
	font-size: 14px;
	border-bottom: 1px solid #dbdada;
}
table {
	border-spacing: 0px;
	border-collapse: collapse;
	text-align: center;
	width: 100%;
	margin: 0 auto;
	color: #555;
}
.write_text{
	width: 70%;
	padding-bottom: 10px;
	padding-top: 10px;
	margin-left: 10%;
	font-size: 14px;
	border: 1px solid #dbdada;
}
.write_contents{
	width: 70%;
	height: 130px;
	padding-bottom: 10px;
	padding-top: 10px;
	margin-left: 10%;
	font-size: 14px;
	border: 1px solid #dbdada;
	line-height: 180%;
}
</style>
</head>
<!-- header Start -->
	<%@ include file="../common/header.jsp"%>
	<!-- header End -->
<body>
	<div id="singo_div">
	<div id="join_div">
		<div class="mypage-content">
		<div class="mypage-header">신고하기</div>
				<form action="noticeWrite" method="post" id="frm">
					<table>
						<tr>
							<td class="td_1">제목</td>
							<td class="td_2"><input type="text" name="title" id="title" placeholder="제목을 작성하세요" class="write_text"></td>
						</tr>
						<tr>
							<td class="td_1">내용</td>
							<td class="td_2"><textarea name="content" id="content" style="width:70%; height:200px" class="write_text"></textarea></td>
					</table>
					<div id="btnhere">
						<button id="save">작성 완료</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	<!-- Footer Start -->
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer End -->
</body>
</html>