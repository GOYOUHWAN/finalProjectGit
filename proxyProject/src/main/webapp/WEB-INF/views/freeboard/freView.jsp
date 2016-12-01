<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<script type="text/javascript"
	src="/proxyProject/resources/js/jquery-1.11.3.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
							result += "<table style='width:600px; height:50px; background-color:black;'>";
							result += "<tr>";
							result += "<td colspan='3'></td>"
							result += "</tr>";
							for (var i = 0; i < data.length; i++) {
								var c = data[i].contents;
								result += "<tr style='color:white;'><td>";
								result += "WRITER : ";
								result += data[i].writer;
								result += "</td><td>";
								result += "Date : ";
								result += data[i].redate;
								result += "</td><td>";

								if (id == data[i].writer
										|| "${sessionScope.member.type}" == "3") {
									result += "<input type='button' value='수정' style='background-color: white; border-radius: 10px' onclick='mod(";
									result += data[i].reviewno;
									result += ", ";
									result += i;
									result += ")'>";
									result += " <input type='button' value='삭제' style='background-color: white; border-radius: 10px' onclick='del(";
									result += data[i].reviewno;
									result += ")'>";
									result += "</td>";

									result += "</td>";
								}
								result += "</tr>";
								result += "<tr>";
								result += "<td colspan='3'>";
								result += "<textarea style='width:600px; height:70px; resize:none; padding:7px' name='contents'>";
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
			//ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
			var pName = $("#writer").val();
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
							writer : pName,
							contents : pText
						},
						success : function() {
							alert("댓글 등록!");
							$("#writer").val();
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
		var content = data[i].value;
		$.ajax({
			url : "/proxyProject/comment/commentModify",
			data : {
				reviewno : no,
				contents : content
			},
			success : function() {
				alert("댓글 수정!");
				$("#contents").val("");
				commentList();
			}
		});
	}
</script>
<title>VIEW</title>
</head>
<body>

	<section>
	<table>
		<tr>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${dto.id}</td>
			<td>날 짜 |</td>
			<td><fmt:formatDate value="${dto.date2}"
					pattern="yyyy/MM/dd hh:mm" /></td>
			<td>${dto.content}</td>
				<c:if
					test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
					<a href="freModifyForm?no=${dto.no}">수정</a>

					<a href="freDelete?no=${dto.no}"
						onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
				</c:if>

				<a href="freList">목록</a>

				<h2>답변입니다.</h2>

				<td>
				<input type="hidden" value="${member.id}" id="id">
	</td>

					<table>
						<tr>
							<td><span role="form">
									<td><input type="text" readonly="readonly" id="writer"
										name="writer" value="${sessionScope.member.id}" maxlength="10">
										<input type="hidden" id="reviewno" name="reviewno"
										value="${dto.no}"></td>
									<td>
										<button type="button" id="submit">답변하기</button>
								</td> 
								<br>
								<br>
								<textarea id="contents" name="contents"></textarea>
								<!-- contents  -->
							</span></td>
						</tr>
					</table>
		</tr>
	</table>
	</section>
	<!--==============================
              footer
=================================-->
</body>
</html>