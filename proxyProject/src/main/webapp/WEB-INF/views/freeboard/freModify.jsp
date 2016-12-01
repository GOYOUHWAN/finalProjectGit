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

</style>
<title>공지사항</title>
</head>
<body>
<!-- header 시작 -->
<!-- header 끝 -->


	<section>
		<div align="center">
		<h2>FreeboardWrite</h2>
			<form action="freModify" method="post" id="frm">
				<div>
					<input type="hidden" name="no" value="${dto.no }">
					제목:
					 <input type="text" name="title" id="title" value="${dto.title}"><br>
					작성자:
					<input type="text" name="id" value="${dto.id}"
						readonly="readonly"><br> 내용
					<textarea name="content" id="ir1" style="width:100%; height:500px">${dto.content}</textarea>
					<div>
						<input type="button" value="수정하기" id="save">
					</div>
				</div>
			</form>
		</div>
	</section>


</body>
</html>