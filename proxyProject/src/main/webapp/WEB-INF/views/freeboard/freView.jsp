<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html lang="en">
<head>
<style type="text/css">
#submit{
	width: 8%;
	float: right;
	background-color: #6e9907;
	border: none;
	color: white;
	padding: 10px;
}
#submit:hover{
	background-color: #7dad09;
}
#s_div1 {
	width: 50%;
	height: 300px;
	margin-top: 350px;
	border: 1px solid green;
	margin-left: 350px;
}

#re1 {
	padding: 88px 0 24px;
    color: #1f1f1f;
    font-size: 30px;
}

.review1 {
	margin: 50px 50px 50px 50px;
	padding: 20px 0 20px 20px;
	background-color: #f8f8f8;
	border-bottom: 1px solid #ececec;
	
}
#review3 {
	border: 1px solid black;
	width: 100%;
	height: 150px;
}
.comment{
	padding: 20px 0 20px 16px;
    border-bottom: 1px solid #ececec;
}

</style>
<script type="text/javascript"
	src="/proxyProject/resources/js/jquery-1.11.3.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	function commentList() {
		var id = $("#id").val();
		var pNo = $("#reviewno").val();
		$
				.ajax({
					url : "/proxyProject/comment/commentList",
					data : {
						no : pNo
					},
					success : function(data) {
						var result = "";
						if (data.length > 0) {
							result += "<center>";
							result += "<table>";
							result += "<tr>";
							result += "<td colspan='3'></td>"
							result += "</tr>";
							for (var i = 0; i < data.length; i++) {
								var c = data[i].contents;
								result += "<tr><td>";
								result += "WRITER : ";
								result += data[i].id;
								result += "</td><td>";
								result += "Date : ";
								result += data[i].redate;
								result += "</td><td>";

								if (id == data[i].id
										|| "${sessionScope.member.type}" == "3") {
									result += "<input type='button' value='수정' style='background-color: white; border-radius: 10px' onclick='mod(";
									result += data[i].reviewno;
									result += ", ";
									result += i;
									result += ")'>";
									result += " <input type='button' value='삭제'  onclick='del(";
									result += data[i].reviewno;
									result += ")'>";
									result += "</td>";

									result += "</td>";
								}
								result += "</tr>";
								result += "<tr>";
								result += "<td colspan='5'>";
								result += "<textarea name='contents'>";
								result += data[i].contents;
								result += "</textarea></td>";
								result += "</tr>";
							}
							result += "</table>";
							result += "</center>";
							$("#div_review").html(result);
						} else {
							$("#div_review").html(
									"<center>등록된 댓글이 없습니다</center>");
						}
					}
				});
	}
	$(function() {
		commentList();
		$("#submit").click(function(event) {
			var pName = $("#id").val();
			var pText = $("#contents").val();
			var pNo = $("#reviewno").val();

			if ("${sessionScope.member.id}" == "") {
				alert("로그인 후 댓글을 작성하실 수 있습니다.");
			} else {
				if (pText == "") {
					alert("내용을 입력해 주세요.");
				} else {
					$.ajax({
						url : "/proxyProject/comment/commentWrite",
						data : {
							no : pNo,
							id : pName,
							contents : pText
						},
						success : function() {
							alert("댓글 등록!");
							$("#id").val();
							$("#contents").val("");
							commentList();
						}
					});
				}
			}
		});
	});
	function del(r) {
		$.ajax({
			url : "/proxyProject/comment/commentDelete",
			data : {
				reviewno : r
			},
			success : function() {
				alert("댓글 삭제!");
				commentList();
			}
		});
	}
	function mod(no, i) {
		var data = document.getElementsByName("contents");
		var contents = data[i].value;
		//alert($().val());
		$.ajax({
			url : "/proxyProject/comment/commentModify",
			data : {
				reviewno : no,
				contents : contents
			},
			success : function() {
				alert("댓글 수정!");
				/* $("#contents").val(""); */
				commentList();
			}
		});
	}
</script>
<title>VIEW</title>
</head>
<body>
	<div>
<!-- Header Start -->
		<%@ include file = "../common/header.jsp" %>
	<!-- Header End -->
</div>
	<section id="section">
	<table id="s_div1">
		<tr>
			<td id="title">${dto.title}</td>
		</tr>
		<tr>
			<td id="content">${dto.content}</td>
			<div id="tr2">
			<td id="writer">작성자 :&nbsp;</td>
			<td id="writer">${dto.id}</td><br>
			<td id="date">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날 짜 :&nbsp;</td>
			<td id="date"><fmt:formatDate value="${dto.date2}"
					pattern="yyyy/MM/dd hh:mm" /></td>
			</div>
		</tr>	
			<c:if
				test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
				<a href="freModifyForm?no=${dto.no}">수정</a>

				<a href="freDelete?no=${dto.no}"
					onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
			</c:if>

			<a href="freList">목록</a>

			<td><input type="hidden" value="${member.id}" id="id"></td>
			<table class="table table-condensed" align="center">
				<tr>
					<h2 id="re1">댓글</h2>
					<h2 id="re2"></h2>
				
					<td>
							<div class="form-group">
								
								 <input type="hidden" id="reviewno" name="reviewno" value="${dto.no}">
							</div>		
					</td>
				</tr>
			</table>
			<textarea id="contents" placeholder="댓글입니다."></textarea>
							<button type="button" id="submit">댓글등록</button>
							<br>
							<br>
								
			<div id="div_review" class="review1">
					<input type="hidden" id="writer" name="id" value="${sessionScope.member.id}" maxlength="10">	
					<center></center><!--  댓글 달리는곳 -->
			</div>
	</table>
	</section>
	<!--==============================
              footer
=================================-->
</body>
</html>