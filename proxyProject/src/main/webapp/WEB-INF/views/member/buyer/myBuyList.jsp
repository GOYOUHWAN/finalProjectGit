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
/* #sub_3 {
	width: 50%;
	height: 100px;
	margin: 0 auto;
	border: 1px solid red;
} */
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
#header_div_5{
	width : 100%;
	height : 50px;
	display: inline-block;
	text-align: center;
/* 	border: 1px solid red; */
}
#h_ul2{
	height: 35px;
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
<script type="text/javascript">

	$(document).ready(function(){
	 	$(".xxx").hide(); 
	});

</script>
</head>
<body >
<%@ include file = "../../common/header.jsp" %>
<div id="div_page">
	<div id="sub_4">
		<a href="myBookList?id=${member.id }"><button class="btn_d_3" id="btn4" tabindex="4">좋아요 내역</button></a>
		<a href="myBoardList?id=${member.id }"><button class="btn_d_3" id="btn5" tabindex="5">게시판 글 내역</button></a>
		<a href="myBuyList?id=${member.id }"><button class="btn_d_3" id="btn6" tabindex="6">구매 내역</button></a>
		<a href="buyerUpgrade?id=${member.id }"><button class="btn_d_3" id="btn7" tabindex="7">판매자등록</button></a>
		</div>
	<div class="container">
	<div id="div_container_2">
	<div id="div_container_3">
		<div id="div_title"><h2>구매내역</h2></div>
		
	
		
		
		<div class="panel panel-default">
			<!-- Default panel contents -->
			
			
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
					<c:when  test="${buylist != null}">
						<c:forEach items="${buylist}" var="list">
							<tr>
								
								<td><a href="<%=application.getContextPath()%>/sellBook/sellBookView?id=${list.id}&num=${list.num}">
										${list.product}</a></td>
								<td>${list.price }</td>
								<td>${list.buy_date}</td>
								<td id="td_status${list.num}">${list.status}</td>
								<td id="td_status2${list.num }">
								<c:if test="${list.status == '입금대기중' }">
									<a href="depositWrite?id=${member.id}&price=${list.price}&num=${list.num}&id=${list.id}"><button id="deposit"> 입금하기 </button></a>
								</c:if>
								<c:if test="${list.status == '배송중' }">
								<button id="btn_confirm${list.num }" onclick="numclick(${list.num});">구매확정</button>
									<script type="text/javascript">
											function numclick(number){
												$.ajax({
			                    					url:'confirm',
			                    					type:'POST',
			                    					data : {num:number}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴을 의미
				                    					$("#td_status"+number).html("구매확정");
				                    					$("#hide"+number).show();
				                    					$("#btn_confirm"+number).hide();
			                    					},
			                    					error:function(e){
			                    						alert("실패했습니다.");
			                    					}
			                    				});
											};
										</script>
								</c:if>
				<!--status가 구매확정일 경우 상대방 평가하기  -->
				
								<div class="xxx" id="hide${list.num }">	
														
									<%--  <c:if test="${list.status == '구매확정' }">  --%>
											<div id="span_thumb${list.num }">거래상대 평가</div>
									<!--상대방 신용도 +1  -->
											<div class="thumbs" id="thumb${list.num }"><img onclick="clickup(${list.num});" id="btn_img" class="img_thumb" src="${pageContext.request.contextPath}/resources/image/up.png">	</div>&nbsp;&nbsp;
											
											<script type="text/javascript">
											function clickup(number){
											 	$.ajax({
			                    					url:'addPointSeller',
			                    					type:'POST',
			                    					data : {num:number}, 	
			                    					success:function(result) {    //여기서 result는 ajax 실행했을때 컨트롤러에서 받는 리턴을 의미
				                    					$("#td_status"+number).html("구매자 평가 완료");
				                    					$("#td_status2"+number).html("");
			                    					},
			                    					error:function(e){
			                    						alert("실패했습니다");
			                    					}
			                    				}); 
											};
									
											
										</script>
									<!--상대방 신용도 -1  -->	
											<div class="thumbs"><a href="deletePoint?num=${list.num }"><img class="img_thumb" src="${pageContext.request.contextPath}/resources/image/down.png"></a></div>
									<%-- </c:if>   --%>
									</div>
							</tr>
						</c:forEach>
						</c:when>
							<c:otherwise>
							<h3>아직 구매중인 내역이 없습니다</h3>
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