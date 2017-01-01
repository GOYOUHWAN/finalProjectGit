<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/buyerupload.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<title>MY_BOARD_LIST</title>

<style>
body{
	line-height: 1;
    color: #414141;
    font-family: "Helvetica", "Arial", sans-serif;
    /* background: #f5f5f5; */
}
img, ul, li{
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
.center-block {
	margin-left: 40%;
}
tr, th {
	width: 227px;
	height: 40px;
	margin: 0 auto;
}

#div_th{
	float: left;
	margin-top: 20px;
}

</style>
</head>
<body class="home">
	<%@ include file="../../common/header.jsp"%>
	<div id="div_page">
		<div id="sub_4">
			<a href="myBookList?id=${member.id }"><button class="btn_d_3"
					id="btn4" tabindex="4">좋아요 내역</button></a> <a
				href="myBoardList?id=${member.id }"><button class="btn_d_3"
					id="btn5" tabindex="5">게시판 글 내역</button></a> <a
				href="myBuyList?id=${member.id }"><button class="btn_d_3"
					id="btn6" tabindex="6">구매 내역</button></a> <a
				href="buyerUpgrade?id=${member.id }"><button class="btn_d_3"
					id="btn7" tabindex="7">판매자등록</button></a>
		</div>
		<div class="container">
			<div id="div_container_2">
				<div id="div_container_3">
					<div id="div_title">
						<h2>판매자 등록</h2>
					</div>
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<form action="buyerUpgrade" method="post"
							enctype="multipart/form-data">
							<table class="table table-striped">
								<thead>
									<tr>
										<td class="td_1">회 원 &nbsp;&nbsp;&nbsp;I D</td>
										<td><input type="text" class="write_text" name="id"
											value="${sessionScope.member.id}" readonly="readonly"></td>
									</tr>
									<tr>
										<td class="td_1">주민 등록증</td>
										<td><input type="file" class="categ0"
											name="identitycard"></td>
									</tr>
									<tr>
										<td class="td_1">통 장&nbsp;&nbsp;사 본</td>
										<td><input type="file" name="bank"></td>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<div id="btnhere">
								<input type="submit" id="singo" value="등록하기">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer:S -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- Footer:E -->

</body>
</html>