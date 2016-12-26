<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>MY_BUY_LIST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  ================================================-->	
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
<%@ include file = "../../common/header.jsp" %>
	
<div id="div_page">

	<div id="sub_4">
			<a href="myBookList?id=${member.id }"><button class="btn_d_3" id="btn4" tabindex="4">좋아요 내역</button></a>
			<a href="myBoardList?id=${member.id }"><button class="btn_d_3" id="btn5" tabindex="5">게시판 글 내역</button></a>
			<a href="myBuyList?id=${member.id }"><button class="btn_d_3" id="btn6" tabindex="6">구매 내역</button></a>
			<a href="mySellList?id=${member.id }"><button class="btn_d_3" id="btn7" tabindex="7">판매 내역</button></a>
		</div>
	<div class="container">
	<div id="div_container_2">
	<div id="div_container_3">
		<div id="div_title"><h2>판매내역</h2></div>
		

		
		<div class="panel panel-default">
	
			<table class="table table-striped">
				<thead>
					<tr>
						<th>책 제목</th>
						<th>가격</th>
						<th>구매 날짜</th>
						
						<th><div id="div_th">주문상태</div>
						<div class="dropup">
						<button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						   	  <li role="presentation">- 입금대기중</li>
						      <li role="presentation">- 결제완료</li>
						      <li role="presentation">- 배송중</li>
						      <li role="presentation">- 구매확정</li>
						    </ul>
						  </div>
						</th>
						<th>기타</th>
					
					</tr>
				</thead>
				<tbody>
			
				<c:choose>
					<c:when  test="${sell != null}">
					
						<c:forEach items="${sell}" var="list">
							<tr>
								
								<td><a href="<%=application.getContextPath()%>/sellBook/sellBookView?id=${list.id}&num=${list.num}">
									   ${list.product}</a></td>
								<td>${list.price }</td>
								<td>${list.buy_date}</td>
								<td id="td_status${list.num }">${list.status}</td>
								<td id="td_status2${list.num }">
									<!-- 입금대기중일때 -->
									<c:if test="${list.status =='입금대기중' }">
										<a href="deposit?id=${member.id}&price=${list.price}&num=${list.num}&id=${list.id}"><button id="deposit"> 입금하기 </button></a>
									</c:if>
									<!--구매자가 입금해서 책의 status가 '결제완료' 로 변경되면 아래의 배송완료 버튼이 판매자에게 생긴다.  -->
									<c:if test="${list.status == '결제완료' }">
										<button id="btn_delivery">배송완료시 눌러주세요</button>
									<!--배송완료 버튼을 누르면 book 테이블에 status가 배송중으로 바뀜.  -->	
										<script type="text/javascript">
									
											var number=${list.num};
											$("#btn_delivery").click(function(){
												$.ajax({
			                    					url:'delivery',
			                    					type:'POST',
			                    					data : {num:number}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴을 의미
				                    					$("#td_status"+number).html("배송중");
				                    					$("#td_status2"+number).html("");
			                    					},
			                    					error:function(e){
			                    						alert("배송완료가 실패했습니다. 새로고침 후 다시 버튼을 눌러주세요");
			                    					}
			                    				});
											});
									
											
										</script>
									</c:if>
								</td>
								
							</tr>
						</c:forEach>
						</c:when>
							<c:otherwise>
							<h3>아직 판매중인 상품이 없습니다</h3>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		</div>
	 </div>
	 </div>
	 </div>
	<!-- Footer:S -->
	<%@ include file = "../../common/footer.jsp" %>
	<!-- Footer:E -->	
	
</body>
</html>