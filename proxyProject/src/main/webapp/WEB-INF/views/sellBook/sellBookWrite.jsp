<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout_new.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/seller.css">
</head>
<body>
	<div id="contents" class="seller_contents">
		<div class="product_information" style="display: block;">
			<!-- 도서기본정보 -->
			<div class="basic_info">
				<h4>상품 기본정보</h4>
					<p class="info"><em>*</em> <span>필수입력항목  입니다. 등록한 상품은 수정할 수 없습니다. 신중하게 입력해주세요.</span></p>
				<div class="basic_info_books">
					<table>
						<tbody>
							<!-- 상품명 -->
							<tr>
								<th scope="row" class="first">
									<label for="books-name">
										상품명<span class="asterisk">*</span>
									</label>
								</th>
								<td class="book-name">
									<input type="text" name="product" style="width:250px;">
								</td>
							</tr>
							<!-- 장르구분 -->
							<tr>
								<th scope="row" class="first">
									<label for="books-product-grouping1">
										상품분류 <span class="asterisk">*</span>
									</label>
								</th>
								<td class="book-group">
									<select id="books-product-grouping1" title="상품분류"
									style="display: inline-block;">
										<option value="">선 택</option>
										<option value="0101">소설</option>
										<option value="0103">시/에세이</option>
										<option value="0105">인문</option>
										<option value="0108">요리</option>
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
									<label for="books-product-grouping1">
										저자 <span class="asterisk">*</span>
									</label>
								</th>
								<td class="book-name">
									<input type="text" name="author" style="width:250px;">
									<br>공동저자가 있을 경우 ","로 입력해주세요.
								</td>
							</tr>
							<!-- 출판사&발행일 -->
							<tr>
								<th scope="row" class="first">
									<label for="books-product-grouping1">
										출판사 <span class="asterisk">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="publisher">
								</td>
								<th scope="row" class="first">
									<label for="books-product-grouping1">
										발행일 <span class="asterisk">*</span>
									</label>
								</th>
								<td><!-- 숫자만입력하게 -->
									<input id="books-date-issue1" name="year1" title="발행년" onkeydown="onlyNum(event, this)" type="text"> 년&nbsp;
									<input id="books-date-issue2" name="month1" title="발행월" onkeydown="onlyNum(event, this)" type="text"> 월&nbsp;
									<input id="books-date-issue3" name="day1" title="발행일" onkeydown="onlyNum(event, this)" type="text"> 일&nbsp;
								</td>
							</tr>
							<!-- 페이지수 -->
							<tr>
								<th scope="row" class="first">
									<label for="books-product-grouping1">
										페이지수 <span class="asterisk">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="pages">쪽
								</td>
							</tr>
							<!-- 정가 -->
							<tr>
								<th scope="row" class="first">
									<label for="books-product-grouping1">
										정가 <span class="asterisk">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="price">원
								</td>
							</tr>
							<!-- 판매가 -->
							<tr>
								<th scope="row" class="first">
									<label for="books-product-grouping1">
										판매가 <span class="asterisk">*</span>
									</label>
								</th>
								<td>
									<input type="text" name="sellingprice">원
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="sale_information" style="display: block;">
				<h4>판매정보</h4>
				<p class="info1">
					상품정보를 정확하게 확인해주세요. 잘못된 정보로 인해 반품, 환불 등의 불이익을 받을 수 있습니다. (왕복 배송비 판매자 부담)<br>
					일반판매가 불가한 불온서적이나 19세미만금지를 설정하지않은 19금도서는 상품 등록 시 관리자에 의해 상품 판매가 중지될 수 있습니다.
				</p>
			</div>
		</div>
	</div>
</body>
</html>