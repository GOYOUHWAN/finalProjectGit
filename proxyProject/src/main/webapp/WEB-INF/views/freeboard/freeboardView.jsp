<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${view.title}</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/4-col-portfolio.css" rel="stylesheet">	
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var message = "${message}";
	if (message != '') {
		alert(message);
	}
	$(function() {
		var f = '<input type="file" name="files" class="form-control">';
		$("#m_1").css("display", "none");
		$("#r_1").css("display", "none");
		$("#goMod").click(function() {
			$("#v_1").css("display", "none");
			$("#m_1").css("display", "block");
			$("#r_1").css("display", "none");
		});
 		$("#goList").click(function() {
			location.href = "freeboardList";
		}); 
		$("#goCancel").click(function() {
			$("#v_1").css("display", "block");
			$("#m_1").css("display", "none");
			$("#r_1").css("display", "none");
		});
		$("#goReply").click(function() {
			$("#v_1").css("display", "none");
			$("#m_1").css("display", "none");
			$("#r_1").css("display", "block");
		});
		$("#goCancel2").click(function() {
			$("#v_1").css("display", "block");
			$("#m_1").css("display", "none");
			$("#r_1").css("display", "none");
		});
		$("#goDel").click(function() {
			var check = confirm('삭제하시겠습니까?');
			if (check == true) {
				document.delFrm.submit();
			}
		});
		$("#modCom").click(function() {
			document.modFrm.submit();
		});
		$("#replyCom").click(function() {
			document.replyFrm.submit();
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
		<h2>게시판입니다.</h2>
		<div class="row">
			<div class="col-lg-12" style="height: 50px;"></div>
		</div>
		<!-- VIEW:S -->
		<div id="v_1">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="active">TITLE</td>
						<td colspan="5">${view.title}</td>
					</tr>
					<tr>
						<td class="active">WRTIER</td>
						<td>${view.writer}</td>
						<td class="active">CATEGORY</td>
						<td>${view.category}</td>
						<td class="active">DATE</td>
						<td>${view.reg_date}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="6">
							${view.contents}<br>
						<c:if test="${fileView ne null}">
							<c:forEach items="${fileView}" var="fileViews">
								${fileViews.fileName}
								<img alt="" style="width: 200px; height: 200px;" src="${context.request.contextPath}/t8/resources/upload/${fileViews.fileName}"><br> 
							</c:forEach>	
						</c:if>
						</td>
						
					</tr>
					<tr>
						<td colspan="6">
							<div>
								<form action="${pageContext.request.contextPath}/freeboard/freeboardDel"
									name="delFrm" method="post">
									<a id="goList" class="btn btn-md btn-primary" role="button">LIST</a>
									<a id="goMod" class="btn btn-md btn-primary" role="button">MODIFY</a>
									<a id="goReply" class="btn btn-md btn-primary" role="button">REPLY</a>
									<a id="goDel" class="btn btn-md btn-primary" role="button">DELETE</a>
									<input type="hidden" value="${view.num}" name="num" id="data1">
<%-- 									<input type="hidden" value="${view.board}" name="board"
										id="data1"> --%>
								</form>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- VIEW:E -->

	<!-- MOD:S -->
	<div class="container">
		<div id="m_1">
			<form action="${pageContext.request.contextPath}/freeboard/freeboardUpdate"
				name="modFrm" method="post" enctype="multipart/form-data">

				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="active">TITLE</td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="tit" name="title"
										value="${view.title}">
								</div>
							</td>
						</tr>
						<tr>
							<td class="active">WRTIER</td>
							<td>${view.writer}</td>
							<td class="active">CATEGORY</td>
							<td>
								<div class="form-group">
									<select class="form-control" name="category">
										<option value="정보">정보</option>
										<option value="질문">질문</option>
									</select>
								</div>
							</td>
							<td class="active">DATE</td>
							<td>${view.reg_date}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="6">
								<div class="form-group">
									<label for="content">Content:</label>
									<textarea class="form-control" rows="5" id="content"
										name="contents">${view.contents}</textarea>
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
							<td colspan="6">
								<div>
									<a id="modCom" class="btn btn-md btn-primary" role="button">SUBMIT</a>
									<a id="goCancel" class="btn btn-md btn-primary" role="button">CANCEL</a>
									<%-- <input type="hidden" value="${view.board}" name="board"> --%>
									<input type="hidden" value="${view.num}" name="num" id="data1">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!-- MOD:E -->

	<!-- REPLY:S -->
	<div class="container">
		<div id="r_1">
			<form action="${pageContext.request.contextPath}/board/boardReply"
				name="replyFrm" method="post">

				<table class="table table-bordered">
					<thead>
						<tr>
							<td class="active">TITLE</td>
							<td colspan="5">
								<div class="form-group">
									<input type="text" class="form-control" id="tit" name="title"
										placeholder="답글을 입력하세요">
								</div>
							</td>
						</tr>
						<tr>
							<td class="active">WRTIER</td>
							<td>
								<div class="form-group">
									<input type="text" class="form-control" id="wri" name="writer"
										placeholder="당신은 누구인가요">
								</div>
							</td>
							<td class="active">CATEGORY</td>
							<td>
								<div class="form-group">
									<select class="form-control" name="category">
										<option value="답변">답변</option>
									</select>
								</div>
							</td>
							<td class="active">DATE</td>
							<td>${view.reg_date}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="6" class="info">
								<div class="form-group">
									<label for="content">Content:</label>
									<textarea class="form-control" rows="5" id="content"
										name="contents" placeholder=""></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<div>
									<a id="replyCom" class="btn btn-md btn-primary" role="button">SUBMIT</a>
									<a id="goCancel2" class="btn btn-md btn-primary" role="button">CANCEL</a>
									<input type="hidden" value="${view.ref}" name="ref"> <input
										type="hidden" value="${view.step}" name="step"> <input
										type="hidden" value="${view.depth}" name="depth"> <input
										type="hidden" value="${view.board}" name="board"> <input
										type="hidden" value="${view.num}" name="num" id="data1">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<!-- REPLY:E -->
	
	<!-- Footer:S -->
	<!-- Footer:E -->		
</body>
</html>