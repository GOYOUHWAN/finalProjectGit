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
</head>
		<!-- header Start -->
		<%@ include file = "../common/header.jsp" %>
	<!-- header End -->
<body>

	<section class="contents">	
		<div class="container" align="center">
				<form action="freWrite" method="post" id="frm" style="background-color: white;">
					<div id="center" style="background-color:rgba(255,247,229,0.5); color: gray;">
					<table>
						<tr>
							<td colspan="2" class="tableheader">글 등록</td>
						</tr>
						<tr>
							<td class="td_1">제목</td>
							<td><input type="text" class="writeform" name="title" id="title" style="width: 300px;" placeholder="제목을 작성하세요"></td>
						</tr>
						<tr>
							<td class="td_1">작성자</td>
							<td><input type="text" class="writeform" value="${sessionScope.member.id}" name="id"readonly="readonly" style="width: 300px;background-color: #FAFAFA;"></td>
						</tr>
						<tr>
							<td colspan="2" class="td_2">내용</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 2px;"><textarea name="content" id="ir1" style="width:100%; height:400px; background-color: white;"></textarea></td>
						</tr>
					</table>
					</div>
						<div style="width: 100px; height: 20px; text-align: center; margin:0 auto; margin-top: 10px; margin-bottom: 10px">
							<button id="save">글 작 성</button>
						</div>
				</form>
		</div>
	</section>
	
	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->

</body>
</html>