<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html lang="en">
<head>
<style type="text/css">
#fre-section{
	margin: 0 auto;
	padding-top: 30px;
	padding-bottom: 30px;
}
.mypage-content {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-bottom: 30px;
   margin-top: 70px;
}
.mypage-content2 {
   width: 60%;
   vertical-align: top;
   display: inline-block;
   border: 1px solid #d8d8d8;
   border-radius: 3px;
   margin-bottom: 30px;
   margin-top: 5px;
}
.mypage-header {
    font-size: 24px;
    padding: 22px 0 22px 34px;
    border-bottom: 1px solid #d8d8d8;
    text-align: left;
    margin: 0 auto;
}
#s_div1 {
	width: 100%;
	margin: 0 auto;
}
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
#re1 {
	padding: 88px 0 24px;
    color: #1f1f1f;
    font-size: 30px;
}

.review1 {
	margin: 0px 5px 5px 5px;
	padding: 20px 20px 20px 20px;
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
.td_1 {
	width: 10%;
	height: 50px;
	text-align: center;
	font-size: 15px;
	background-color: #eeeeee;
}
.td_2{
	text-align: left;
	padding-bottom: 15px;
	padding-top: 15px;
	font-size: 14px;
	padding-left: 4%;
	line-height: 200%;
}
.td_3{
	width: 30%;
	text-align: justify;
	padding-left: 4%;
}
.btnhere{
	text-align: left;
	width: 60%;
	margin: 0 auto;
	height: 45px;
}
.btnstyle{
	border: 1px solid #c9c9c9;
	padding: 10px 30px;
	color: gray;
	background-color: white;
}
.btnstyle:hover{
	text-decoration: none;
	background-color: gray;
	color: white;
}
.writetext{
	width: 85%;
	height: 37px;
	padding: 5px 5px;
}
.reply{
	width: 100%;
	padding: 5px 5px;
}
.btn_td{
	text-align: right;
}
.date_td{
	text-align: right;
}
.contents_td{
	width: 100%;
	border-bottom: 1px solid #c9c9c9;
	padding-bottom: 5px;
	height: 20px;
}
.replybtn{
	border: 1px solid #6e9907;
	background-color: white;
	color: #6e9907;
	padding: 4px 3px;
}
.replybtn:hover{
	color: white;
	background-color: #6e9907;
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
							result += "<table class='reply'>";
							result += "<tr>";
							result += "<td colspan='3'></td>"
							result += "</tr>";
							for (var i = 0; i < data.length; i++) {
								var c = data[i].contents;
								result += "<tr><td>";
								result += "WRITER : ";
								result += data[i].id;
								result += "</td><td class='date_td'>";
								result += "Date : ";
								result += data[i].redate;
								result += "</td><td class='btn_td'>";

								if (id == data[i].id
										|| "${sessionScope.member.type}" == "3") {
									result += "<input type='button' value='수정' class='replybtn' onclick='mod(";
									result += data[i].reviewno;
									result += ", ";
									result += i;
									result += ")'>";
									result += " <input type='button' value='삭제' class='replybtn' onclick='del(";
									result += data[i].reviewno;
									result += ")'>";
									result += "</td>";

								result += "</tr>";
								result += "<tr>";
								result += "<td colspan='5'>";
								result += "<textarea name='contents' class='contents_td'>";
								result += data[i].contents;
								result += "</textarea></td>";
								result += "</tr>";
								}
								else{
									result += "</td>";
									result += "</tr>";
									result += "<tr>";
									result += "<td colspan='5' style='padding-top:3px; padding-left:6px; border-bottom: 1px solid #c9c9c9; margin-bottom:3px;'>";
									result += data[i].contents;
									result += "</td>";
									result += "</tr>";
								}
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
<section id="fre-section">
<div style="width: 100%; text-align: center;">
	<div class="mypage-content">
	<div class="mypage-header">글 상세보기</div>
	<table id="s_div1">
		<tr>
			<td class="td_3">작성자 : ${dto.id}</td>
			<td class="td_1">제목</td>
			<td class="td_2">${dto.title}</td>
		</tr>
		<tr>
			<td rowspan="2" class="td_3"></td>
			<td class="td_1">날짜</td>
			<td class="td_2"><fmt:formatDate value="${dto.date2}" pattern="yyyy/MM/dd hh:mm" /></td>
		</tr>
		<tr>
			<td class="td_1">내용</td>
			<td class="td_2">${dto.content}</td>
		</tr>
	</table>
	</div>
</div>
	<c:if test="${sessionScope.member.id eq dto.id || sessionScope.member.type eq '3'}">
		<div class="btnhere">
				<a href="freModifyForm?no=${dto.no}" class="btnstyle">수정</a>

				<a href="freDelete?no=${dto.no}"
					onclick="return confirm('정말 삭제하시겠습니까?')" class="btnstyle">삭제</a>
		</div>
	</c:if>
		<input type="hidden" value="${member.id}" id="id">
		<div style="width: 100%; text-align: center;">
			<div class="mypage-content2">
				<div class="mypage-header">댓글</div>
							<div class="form-group">	
								 <input type="hidden" id="reviewno" name="reviewno" value="${dto.no}">
							</div>	
			<div style="padding: 10px;">
			<textarea id="contents" placeholder="댓글입니다." class="writetext"></textarea>
							<button type="button" id="submit">댓글<br>등록</button>
			</div>			
			<div id="div_review" class="review1">
					<input type="hidden" id="writer" name="id" value="${sessionScope.member.id}" maxlength="10">	
					<center></center><!--  댓글 달리는곳 -->
			</div>
		</div>
			<div style="text-align: center;">
				<a href="freList" class="btnstyle">목록</a>
			</div>
		</div>
</section>
</body>
	<%@ include file = "../common/footer.jsp" %>
</html>