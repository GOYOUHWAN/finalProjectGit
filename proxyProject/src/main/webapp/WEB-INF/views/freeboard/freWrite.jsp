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
<title>Freeboard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


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
     
    //전송버튼 클릭이벤트
    $("#save").click(function() {
			editor_object.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		if($("#id").val()==''){
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
			alert("글 등록이 되었습니다.")
		}
	});
})
</script>

	
<style type="text/css">
#center {
	margin-top: 50px;
	width: 600px;
	text-align: center;
	margin: 0 auto;
}
</style>
<title>Q&A</title>
</head>
<body>
	<header>

		<section id="stuck_container">
			<div class="container">
				<div class="row">
					<div class="grid_12">
						<h1>
							
						</h1>
						<div class="navigation">
							
							</div>
					</div>
				</div>
			</div>
		</section>
	</header>
	<section class="contents">
		<div class="container" align="center">
				<h2 style="color:#86cdd7; font-size:35px; background-color: white">WRITE</h2>
				<form action="freWrite" method="post" id="frm" style="background-color: white;">
					<div id="center" style="background-color:white;font-weight: bold; color: gray;">
						제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="title" id="title" style="width: 300px; background-color: #FAFAFA;" placeholder="제목을 작성하세요">
						<br>작성자&nbsp;&nbsp; <input type="text" value="${sessionScope.member.id}" name="id"readonly="readonly" style="width: 300px;background-color: #FAFAFA;">
						<br>
						<br> 내용	<textarea name="content" id="ir1" style="width:100%; height:500px"></textarea>
						<br><div style="width: 100px; height: 20px; text-align: center; margin:0 auto; margin-top: 10px">
							<input type="button" id="save" value="글 작 성">
						</div>
					</div>
				</form>
		</div>
	</section>


</body>
</html>