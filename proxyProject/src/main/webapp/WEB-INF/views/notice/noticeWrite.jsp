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
#center {
	margin-top: 50px;
	width: 600px;
	text-align: center;
	margin: 0 auto;
}

#save{
	width: 100%;
	float: right;
	background-color: #7151FC;
}
</style>
</head>
<!-- header Start -->
	<%@ include file="../common/header.jsp"%>
	<!-- header End -->
<body>
	<section class="contents">	
		<div class="container" align="center">
				<form action="noticeWrite" method="post" id="frm" style="background-color: white;">
					<div id="center" style="background-color:white;font-weight: bold; color: gray;">
						제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="text" name="title" id="title" style="width: 300px; background-color: #FAFAFA;" placeholder="제목을 작성하세요">
						<br>
						<br> 내용	<textarea name="content" id="content" style="width:100%; height:500px"></textarea>
						<br><div style="width: 100px; height: 20px; text-align: center; margin:0 auto; margin-top: 10px">
							<button id="save">글 작 성</button>
						</div>
					</div>
				</form>
		</div>
	</section>
	<!-- Footer Start -->
	<%@ include file="../common/footer.jsp"%>
	<!-- Footer End -->
</body>
</html>