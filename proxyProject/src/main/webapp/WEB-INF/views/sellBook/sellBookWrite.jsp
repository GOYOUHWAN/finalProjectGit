<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PROXY : 대한민국 대표 중고도서</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout_new.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/seller.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sellbook.css">
<style type="text/css">
	#div_basic2{
		width: 60%;
		height : 800px;
		margin: 0 auto;
		margin-top : 60px;
		/*  border: 1px solid red;  */
	}
</style>
</head>

<body>
<%@ include file = "../common/header.jsp" %>
	<div id="div_basic2">
	<div id="contents" class="seller_contents">
	
		<c:if test="${member !=null}">
	<form action="sellBookWrite" method="post" enctype="multipart/form-data" >
		<div class="product_information" style="display: block;">
			<!-- ===============================================================상품 기본정보========================================== -->
			<div class="basic_info">
				<h4>상품 기본정보</h4>
					<p class="info"><em>*</em> <span>필수입력항목  입니다. 등록한 상품은 수정할 수 없습니다. 신중하게 입력해주세요.</span></p>
				<div class="basic_info_books">
					<table>
						<tbody> 
							<!-- 상품명 -->
							<tr>
								<th scope="row" class="first">
									<label for="product">
										상품명<span class="asterisk">*</span>
									</label>
								</th>
								<td colspan="3" class="book-name">
									<input type="text" name="product" style="width:250px;">
								</td>
							</tr>
							<!-- 장르구분 -->
							<tr>
								<th scope="row" class="first">
									<label for="genre">상품분류 <span class="asterisk">*</span></label>
								</th>
								<td colspan="3" class="genre">
									<select name="genre" title="상품분류"
									style="display: inline-block;">
										<option value="">선 택</option>
										<option value="소설">소설</option>
										<option value="시/에세이">시/에세이</option>
										<option value="인문">인문</option>
										<option value="요리">요리</option>
										<option value="0109">건강</option>
										<option value="0111">스포츠</option>
										<option value="0113">경제/경영</option>
										<option value="0115">자기계발</option>
										<option value="0117">정치/사회</option>
										<option value="0119">역사/문화</option>
										<option value="0121">종교</option>
										<option value="0123">예술/대중문화</option>
										<option value="0125">교재/참고서</option>
										<option value="0126">기술/공학</option>
										<option value="0127">외국어</option>
										<option value="0129">과학</option>
										<option value="0132">여행/기행</option>
										<option value="0133">컴퓨터/IT</option>
										<option value="0135">잡지</option>
										<option value="0147">만화</option>
								</select>
								</td>
							</tr>
							<!-- 저자 -->
							<tr>
								<th scope="row" class="first">
									<label for="author">저자 <span class="asterisk">*</span></label>
								</th>
								<td colspan="3" class="author">
									<input type="text" name="author" style="width:250px;">
									<br>공동저자가 있을 경우 ","로 입력해주세요.
								</td>
							</tr>
							<!-- 출판사&발행일 -->
							<tr>
								<th scope="row" class="first">
									<label for="publisher">출판사 <span class="asterisk">*</span></label>
								</th>
								<td>
									<input type="text" name="publisher">
								</td>
								<th scope="row" class="first">
									<label for="bookdate">발행일 <span class="asterisk">*</span></label>
								</th>
								<td><!-- 숫자만입력하게 -->
									<input id="books-date-issue1" name="bookdate" title="발행년" onkeydown="onlyNum(event, this)" type="text"
									 style="width:30px;"> 년&nbsp;
									<input id="books-date-issue2" name="bookdate2" title="발행월" onkeydown="onlyNum(event, this)" type="text"
									style="width:30px;"> 월&nbsp;
									<input id="books-date-issue3" name="bookdate3" title="발행일" onkeydown="onlyNum(event, this)" type="text"
									style="width:30px;"> 일&nbsp;
								</td>
							</tr>
							<!-- 페이지수 -->
							<tr>
								<th scope="row" class="first">
									<label for="pages">페이지수 <span class="asterisk">*</span></label>
								</th>
								<td colspan="3">
									<input type="text" name="pages">쪽
								</td>
							</tr>
							<!-- 정가 -->
							<tr>
								<th scope="row" class="first">
									<label for="price">정가 <span class="asterisk">*</span></label>
								</th>
								<td colspan="3">
									<input type="text" name="price">원
								</td>
							</tr>
							<!-- 판매가 -->
							<tr>
								<th scope="row" class="first">
									<label for="sellingprice">판매가 <span class="asterisk">*</span></label>
								</th>
								<td colspan="3">
									<input type="text" name="sellingprice">원
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		
			<!-- ================================================================판매정보========================================== -->
			<div class="sale_information" style="display: block;">
				<h4>판매정보</h4>
				<p class="info1">
					상품정보를 정확하게 확인해주세요. 잘못된 정보로 인해 반품, 환불 등의 불이익을 받을 수 있습니다. (왕복 배송비 판매자 부담)<br>
					일반판매가 불가한 불온서적이나 19세미만금지를 설정하지않은 19금도서는 상품 등록 시 관리자에 의해 상품 판매가 중지될 수 있습니다.
				</p>
				<div class="sale_information_content">
					<table>
						<tbody>
						<!-- 품질상태 -->
							<tr>
								<th scope="row" class="first">
									<label for="quality">품질상태 <span class="asterisk">*</span></label> 
								</th>
								<td colspan="3">
									<input type="radio" name="quality" value="상" onclick="radioch('상');"><label for="상">상</label>
									<input type="radio" name="quality" value="중" onclick="radioch('중');"><label for="중">중</label>
									<input type="radio" name="quality" value="하" onclick="radioch('하');"><label for="하">하</label>
								</td>
							</tr>
							<!-- 카카오톡 ID -->
							<tr>
								<th scope="row" class="first">
									<label for="k_id">카카오톡ID <span class="asterisk">*</span></label> 
								</th>
								<td colspan="3">
									<input name="k_id" type="text" style="width: 250px;">
								</td>
							</tr>
							<!-- 구입시기 -->
							<tr>
								<th scope="row" class="first">
									<label for="buy_date">구입시기 <span class="asterisk">*</span></label> 
								</th>
								<td colspan="3">
									<input name="buy_date" type="text" style="width: 250px;">
									예) 2015년 10월경
								</td>
							</tr>
							<!-- 상품소개 및 이미지 등록 -->
							<tr>
								<th scope="row" class="first">
									<label for="contents">상품소개 <span class="asterisk">*</span></label>
								</th>
								<td colspan="3">
									<p id="waring_p">* 첫번째 파일은 겉표지 이미지를 등록 하세요 (파일 4개 까지 등록 가능) *</p>
									<input type="file" id="file_1" class="categ0" name="fileName1">
									<span><input type="button" id="add_btn" value="첨부 파일 추가"></span>
									<textarea rows="10" cols="77" name="contents"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 메시지를 받아옴 -->
		<!-- ###### -->
		<input type="hidden" id="message" value="${ message }">
		<input type="hidden" name="id" value="${member.id }">
		<!-- <input type="hidden" name="quality"> -->
		<input type="hidden" name="status" value="입금대기중">
		<!-- ###### -->
			<!-- 상품등록 버튼 -->
			<div class="button_product_register">
				<input id="sellbtn" type="submit" class="btn_medium btn_blue2" value="상품등록">
			</div>
		</div>
		</form>
		</c:if>
	</div>
</div>
</body>
<!-- javascript 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		if ($("#message").val() == "등록 성공") {
			alert($("#message").val());
		} else if ($("#message").val() == "등록 실패") {
			alert($("#message").val());
		} 
		
		// 파일 갯수 확인 위함
		var fileCount = 1;
		
		// 첨부 파일 추가
		$("#add_btn").click(function () {
			var f = $("[type='file']");
			if(f.length < 4) {
				fileCount++;
				$("#file_"+(fileCount-1)).after("<input type='file' id='file_"+fileCount+"' class='categ0' name='fileName"+fileCount+"'>");
			} else {
				alert("첨부파일은 최대 4개까지 가능합니다.");
			}
		});
		
		

	});
</script>
<!-- javascript 끝 -->

	<!-- Footer Start -->
		<%@ include file = "../common/footer.jsp" %>
	<!-- Footer End -->
</html>