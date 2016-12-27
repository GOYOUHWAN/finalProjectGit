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
	border : 1px solid red;
		vertical-align: bottom;
	/* margin-top: 20px; */
}

.thumbs{
	width: 20px;
	height: 20px;
/* 	border: 1px solid red; */
	display: inline-block;
}
.img_thumb{
	/* border: 1px solid green; */
	size: inherit;
	width: 100%;
	height: 100%;
}
#span_thumb{
	display:inline-block;
	
	margin: a auto;
	text-align: center;
	vertical-align: top;
	}
.btn{
	width: 70px;
	height: 30px;
	size: inherit;
	text-align : left;
	margin-bottom: 0px;
	border: none;
	
}	
#span_status{
	display: inline-block;
	float: right;
	font-size: 10px;
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
		<div id="div_title"><h2 id="h2">판매내역</h2> </div>
		

		
		<div class="panel panel-default">
	
			<table class="table table-striped">
				<thead>
					<tr>
						<th>책 제목</th>
						<th>가격</th>
						<th>구매 날짜</th>
						
						<th>주문상태</th>
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
										<button id="btn_delivery${list.num }" onclick="numclick(${list.num});">배송완료시 눌러주세요</button>
									<!--배송완료 버튼을 누르면 book 테이블에 status가 배송중으로 바뀜.  -->	
										<script type="text/javascript">
									
											
											function numclick(numnum){
												
												$.ajax({
			                    					url:'delivery',
			                    					type:'POST',
			                    					data : {num:numnum}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴을 의미
				                    					$("#td_status"+numnum).html("배송중");
				                    					$("#td_status2"+numnum).html("");
			                    					},
			                    					error:function(e){
			                    						alert("배송완료가 실패했습니다. 새로고침 후 다시 버튼을 눌러주세요");
			                    					}
			                    				});
											};
									
											
										</script>
									</c:if>
<!--status가 구매확정일 경우 상대방 평가하기  -->									
									<c:if test="${list.status == '구매자 평가 완료' }">
											<div id="span_thumb${list.num }">거래상대 평가</div>
									<!--상대방 신용도 +1  -->
											<div class="thumbs" id="thumb${list.num }"><img onclick="clickup(${list.num});" id="btn_img" class="img_thumb" src="${pageContext.request.contextPath}/resources/image/up.png">	</div>&nbsp;&nbsp;
											
											<script type="text/javascript">
										
											function clickup(number){
											 	$.ajax({
			                    					url:'addPointBuyer',
			                    					type:'POST',
			                    					data : {num:number}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴을 의미
				                    					$("#td_status"+number).html("판매/평가 완료");
				                    					$("#td_status2"+number).html("");
			                    					},
			                    					error:function(e){
			                    						alert("실패했습니다. 새로고침 후 다시 버튼을 눌러주세요");
			                    					}
			                    				}); 
											};
									
											
										</script>
									<!--상대방 신용도 -1  -->	
											<div class="thumbs"><a href="deletePoint?num=${list.num }"><img class="img_thumb" src="${pageContext.request.contextPath}/resources/image/down.png"></a></div>
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