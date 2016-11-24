<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WRITE</title>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/4-col-portfolio.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var f = '<input type="file" name="files" class="form-control">';
		
		$("#goWrite").click(function(){
			document.writeFrm.submit();
		});
		$("#goList").click(function() {
			location.href = "freeboardList";
		});
		
		/* 파일타입 추가하기 */
		$("#addFile").click(function(){
			var r = $("[type='file']");
			if(r.length < 5){				
				$("#fileSet").append(f);
			}else{
				alert('5개까지 가능');
			}
		});
		/* 파일타입 삭제하기 */
		$("#delFile").on("click","input",function(){
			$("#fileSet").closest("input").remove();
		});			
		
		/* 파일타입 접고열기 */
		$("#fileToggle").click(function(){
			$("#fileSet").toggle();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h2>글쓰기입니다.</h2>
		<div class="row">
			<div class="col-lg-12" style="height: 50px;"></div>
		</div>
		<!-- WRITE:S -->
		<div id="v_1" class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">글쓰기</div>
			<form action="${pageContext.request.contextPath}/freeboard/freeboardWrite" name="writeFrm" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="active">TITLE</td>
						<td colspan="3">
							<div class="form-group"> 
								<input type="text" class="form-control" id="tit" name="title" placeholder="제목을 입력하세요">
							</div>
						</td>
					</tr>
					<tr>
						<td class="active">WRTIER</td>
						<td>
							<div class="form-group"> 
								<input type="text" class="form-control" id="wri" name="writer" readonly="readonly" value="${sessionScope.member.name}">
							</div>
						</td>
						<td class="active">CATEGORY</td>
						<td>
							<div class="form-group"> 
								<select class="form-control" name="category">
									<option value="정보">정보</option>
									<option value="질문">질문</option>
								</select>
							</div>						
						</td>					
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4" class="info">
							<div class="form-group">
								<label for="content">Content:</label>
								<textarea class="form-control" rows="5" id="content" name="contents" placeholder="내용을 입력하세요"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button type="button" class="btn btn-default btn-sm" id="fileToggle">
          						<span class="glyphicon glyphicon-chevron-down"></span> FLIE UP
        					</button>
							<div id="fileSet" style="display: none;">
								<a id="addFile" class="btn btn-default btn-sm" role="button">ADDFILE</a>
								<a id="delFile" class="btn btn-default btn-sm" role="button">DELFILE</a>
								<input type="file" name="files" id="firstFile" class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="hidden" name="board" value="2">
							<a id="goList" class="btn btn-md btn-primary" role="button">LIST</a>
							<a id="goWrite" class="btn btn-md btn-primary" role="button">SUBMIT</a>
							
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
	<!-- WRITE:E -->
	
	<!-- Footer:S -->
	<!-- Footer:E -->	
</body>
</html>