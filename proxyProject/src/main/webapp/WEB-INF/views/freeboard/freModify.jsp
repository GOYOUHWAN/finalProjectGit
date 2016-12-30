<%@page import="org.springframework.ui.Model"%>
<%@page
	import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@page import="com.choa.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Q&A</title>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />

<script src="<%=application.getContextPath()%>/resources/js/jquery.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/js/jquery-migrate-1.1.1.js"></script>
<script src="<%=application.getContextPath()%>/resources/js/script.js"></script>
<script
	src="<%=application.getContextPath()%>/resources/js/superfish.js"></script>

<script
	src="<%=application.getContextPath()%>/resources/js/touchTouch.jquery.js"></script>


<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript"
	src="/proxyProject/resources/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "ir1",
        sSkinURI: "/proxyProject/resources/SE2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });

		$("#save").click(function() {
			editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			if($("id").val()==''){
				alert("빈 칸이 존재합니다.");
				return false;
			}else if($("#title").val()==''){
				alert("제목을 적어주세요.");
				return false;
			}else if($("#ir1").val()=='<p>&nbsp;</p>' || $("#ir1").val()=='&nbsp;' || $("#ir1").val()==''){
				alert("내용을 적어주세요.");
				return false;
			}else{
				$("#frm").submit();
				alert("글이 수정되었습니다.");
			}
		});
	});
</script>
<style type="text/css">
#center {
	margin-top: 50px;
	width: 100%;
	text-align: center;
	margin: 0 auto;
}

#save{
	width: 100%;
	float: right;
	background-color: #6e9907;
	color: white;
	border: none;
	padding: 10px;
}
.contents{
	min-height: 740px;
}
table{
	width: 60%;
	margin: 0 auto;
}
.td_1{
	width: 30%;
	background-color: #eee;
	text-align: center;
	border: 1px solid #eee;
	padding: 12px 15px;
}
.td_2{
	background-color: #eee;
	text-align: center;
	border: 1px solid #eee;
	padding: 12px 15px;
}
.tableheader{
	text-align: left;
	font-size: 20px;
	padding: 20px 20px;
	border: 1px solid #eee;
}
.writeform{
	padding: 10px 10px;
	border-color: #eee;
}
</style>
<title>자유게시판 글 수정</title>
</head>
	<!-- header Start -->
		<%@ include file = "../common/header.jsp" %>
	<!-- header End -->
<body>


	<section class="contents">	
		<div class="container" align="center">
			<form action="freModify" method="post" id="frm">
				<div id="center" style="background-color:white; color: gray;">
					<table>
						<tr>
							<td colspan="2" class="tableheader">글 수정</td>
						</tr>
						<tr>
							<td class="td_1">제목</td>
							<td><input type="text" class="writeform" name="title" id="title" style="width: 300px;" value="${dto.title}"></td>
						</tr>
						<tr>
							<td class="td_1">작성자</td>
							<td><input type="text" class="writeform" value="${sessionScope.member.id}" name="id"readonly="readonly" style="width: 300px;background-color: #FAFAFA;"></td>
						</tr>
						<tr>
							<td colspan="2" class="td_2">내용</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 2px;"><textarea name="content" id="ir1" style="width:100%; height:400px">${dto.content}</textarea></td>
						</tr>
					</table>
					<div style="width: 100px; height: 20px; text-align: center; margin:0 auto; margin-top: 10px; margin-bottom: 10px">
						<input type="button" value="수정하기" id="save">
					</div>
				</div>
			</form>
		</div>
	</section>


</body>
</html>