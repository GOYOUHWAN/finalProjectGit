<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약하기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservation/ticket.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservation/reservation_tnb.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3_step1.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservation/reservation_step3_step2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"> 
   $(function() {
      card();
   });
   function card() {
      $('.payment_card').show();
      $('.payment_pay').hide();
      $("input:radio[value='신용카드']").prop("checked", true); // 선택하기
      $("input:radio[value='무통장입금']").prop("checked", false); // 해제하기
   }
   function pay() {
      $('.payment_pay').show();
      $('.payment_card').hide();
      $("input:radio[value='무통장입금']").prop("checked", true); // 선택하기
      $("input:radio[value='신용카드']").prop("checked", false); // 해제하기
   }
   function OnTnbRightClick() {
      var totalpay = "";
      var check = "";
      var tcknum = "";

      check = $("input[type=radio][name=paymethod]:checked").val();
      var selectbox = $("#lp_card_type option:selected").val();
      if (check == "신용카드") {
         selectbox = $(".cardselect>#lp_card_typesel option:selected").val();
      } else {
         selectbox = $("#banksel option:selected").val();
      }
      $.ajax({
         url : "reservation.reservation",
         type : "POST",
         data : {
            payment : check,
            price : $("#total").val(),
            m_num : $("#m_num").val(),
            adult : $("#adult").val(),
            teenager : $("#teenager").val(),
            id : $("#id").val(),
            ti_num : $("#tinfonum").val(),
            seatinfo : $("#seatinfo").val()
         },
         success : function(data) {
            alert(data);
            location.href = "../main/index.jsp";
         }
      });
   }
</script>
</head>

<body>
<%@ include file = "../../common/header.jsp" %>

<div id="view_div_outside">
<div id="view_div_inside">
	<div id="view_div_1"class="w3-content" style="max-width:500px">
	  <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files1 }" >
	  <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files2 }" >
	  <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files3 }" >
	    <img class="mySlides" src="/proxyProject/resources/upload/${viewPicture.files4 }" >
	
	  <div class="view_div w3-row-padding w3-section">
	    <div class="view_div_img  w3-col s4">
	      	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files1 }" onclick="currentDiv(1)">
	    	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files2 }" onclick="currentDiv(2)">
	   	 	<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files3 }" onclick="currentDiv(3)">
	  		<img class="view_img demo w3-opacity w3-hover-opacity-off" src="/proxyProject/resources/upload/${viewPicture.files4 }" onclick="currentDiv(4)">
	    </div>
	  </div>
	</div>
	
	<div id="div_name">
		<table id="view_table">
			<tr>
				<td><h2>판매자 : ${view.id }</h2>
								판매자 신용도 : ${viewMember.seller_trust }
				</td>
			</tr>
			<tr>
				<td><h1>책 제목 : ${view.product }</h1><br>
								구매 날짜 : ${view. buy_date}
				</td>
			</tr>
			<tr>
				<td><h3>가격 : ${view.price } 원</h3></td>
			</tr>
			<tr>
				<td><h3>줄거리 : ${view.contents }</h3></td>
			</tr>
			<tr>
				<td><h3>좋아요 : ${view.likes }</h3></td>
			</tr>
			<tr>
				<td><input type="submit" class="view_button"><input type="submit" class="view_button"></td>
			</tr>
			
		</table>
	</div>
	
	
</div>
</div>



   <input type="hidden" id="tinfonum" value="${ param.tinfonum }">
   <input type="hidden" id="price" value="${ param.price }">
   <input type="hidden" id="num" value="${ param.num }">
   <input type="hidden" id="id" value="${ member.id }">
   

   <section id="section_wrap">
   <div class="steps" style="margin: 0 auto; margin-top : 150px;">
      <div class="step step3" style="display: block;">
         <div class="ticket_payment_method">
            <a href="#" onclick="return false;" id="ticket_payment_top"
               class="sreader">결제시작</a>	
            <div class="tpm_wrap tpm_last_pay">
               <h4 class="ts3_titlebar ts3_t1">
                  <span class="title">입금 정보 입력</span>
               </h4>
               <div class="tpm_body">
                  <div>
                     <div class="payment_select radio_group">
                        <span> <input type="radio" id="last_pay_radio1"
                           name="paymethod" onclick="card();" value="신용카드"> <label
                           for="last_pay_radio1">신용카드 </label> <span></span>
                        </span> <span> <input type="radio" id="last_pay_radio3"
                           name="paymethod" onclick="pay();" value="무통장입금"> <label
                           for="last_pay_radio3">무통장입금</label> <span></span>
                        </span>
                     </div>
                     <div class="payment_form">
                        <div class="payment_input payment_card" style="display: block;">
                           <div class="table_wrap card_default" id="card_default">
                              <table>
                                 <caption>* 신용카드의 종류, 카드번호, 비밀번호, 유효기간, 주민등록번호 입력  *</caption>
                                 <thead></thead>
                                 <tbody>
                                    <tr>
                                       <th scope="row"><label for="lp_card_type">카드종류</label></th>
                                       <td>
                                          <div>
                                             <div
                                                class="form_wrap select card_type form_bg cardselect">
                                                <select id="lp_card_typesel">
                                                   <option>카드를 선택하세요</option>
                                                   <option value="BCC">BC카드</option>
                                                   <option value="CNB">국민카드</option>
                                                   <option value="WIN">삼성카드(올앳포함)</option>
                                                   <option value="SHB">신한카드</option>
                                                   <option value="DIN">현대카드</option>
                                                   <option value="KEB">KEB하나카드(구,외환)</option>
                                                   <option value="PHB">우리(평화)카드</option>
                                                   <option value="AMX">롯데/아멕스카드</option>
                                                   <option value="CIT">시티카드(구,한미)</option>
                                                   <option value="SIN">신세계카드</option>
                                                   <option value="NLC">NH카드</option>
                                                   <option value="HNB">하나카드(구,하나SK)</option>
                                                   <option value="KJB">광주VISA카드</option>
                                                   <option value="SAN">산은캐피탈</option>
                                                   <option value="NFF">수협카드</option>
                                                   <option value="KDB">KDB산업은행카드</option>
                                                   <option value="JBB">전북은행카드</option>
                                                   <option value="JJB">제주은행카드</option>
                                                   <option value="KEP">우체국카드</option>
                                                   <option value="SCB">스탠다드차타드은행카드</option>
                                                   <option value="MGC">MG체크카드</option>
                                                   <option value="HSC">현대증권카드</option>
                                                   <option value="IBK">기업은행카드</option>
                                                </select>
                                             </div>
                                          </div>
                                       </td>
                                    </tr>
                                    <tr id="input_card_num">
                                       <th scope="row"><label for="lp_card_no1">카드번호</label>
                                       </th>
                                       <td>
                                          <div>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no1">카드 번호 첫번째 숫자 입력</label> <input
                                                   id="lp_card_no1" type="text" maxlength="4"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="divider">-</span>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no2">카드 번호 두번째 숫자 입력</label> <input
                                                   id="lp_card_no2" type="password" maxlength="4"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="divider">-</span>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no3">카드 번호 세번째 숫자 입력</label> <input
                                                   id="lp_card_no3" type="password" maxlength="4"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="divider">-</span>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no4">카드 번호 네번째 숫자 입력</label> <input
                                                   id="lp_card_no4" type="text" maxlength="4"
                                                   class="type-n nohan">
                                             </div>
                                          </div>
                                       </td>
                                    </tr>
                                    <tr id="input_card_pw">
                                       <th scope="row"><label for="lp_card_pw">비밀번호</label></th>
                                       <td>
                                          <div>
                                             <div class="form_wrap text card_pw form_bg">
                                                <label for="lp_card_pw">카드 비밀번호 숫자 입력</label> <input
                                                   id="lp_card_pw" type="password" maxlength="2"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="password">**</span>
                                          </div>
                                       </td>
                                    </tr>
                                    <tr id="input_card_Expire">
                                       <th scope="row"><label for="lp_card_pw">유효기간</label></th>
                                       <td>
                                          <div>
                                             <div class="form_wrap text card_date form_bg">
                                                <label for="lp_card_month">카드 유효기간 월 숫자 입력</label> <input
                                                   id="lp_card_month" type="text" maxlength="2"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="string">월</span>
                                             <div class="form_wrap text card_date form_bg">
                                                <label for="lp_card_year">카드 유효기간 년도 숫자 입력</label> <input
                                                   id="lp_card_year" type="text" maxlength="2"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="string">년</span>

                                          </div>
                                       </td>
                                    </tr>
                                    <tr class="card_owner_jumin">
                                       <th scope="row"><span class="type_jumin">법정생년월일(6자리)</span>
                                       </th>
                                       <td>
                                          <div>
                                             <div class="form_wrap text card_ssn form_bg">
                                                <label for="lp_card_ssn">생년월일</label> <input
                                                   id="lp_card_ssn" type="password" maxlength="6"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="divider">-</span> <span class="password">*******</span>
                                          </div>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                              <div class="discount_result">
                                 <div class="result_reference">
                                    <span class="left"
                                       style="font-weight: bold; position: absolute; width: 98%;">
                                       * 신용카드 결제 가능 최소 금액은 1,000원 이상입니다. </span>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="payment_input payment_pay" style="display: block;">
                           <div class="table_wrap">
                              <table>
                                 <thead></thead>
                                 <tbody>
                                    <tr>
                                       <th scope="row"><label for="lp_card_type">입금은행</label>
                                       </th>
                                       <td>
                                          <div>
                                             <div class="form_wrap select card_type form_bg">
                                                <select id="banksel">
                                                   <option>은행을 선택하세요</option>
                                                   <option id="NH농협">NH농협</option>
                                                   <option id="국민은행">국민은행</option>
                                                   <option id="신한은행">신한은행</option>
                                                   <option id="우리은행">우리은행</option>
                                                   <option id="기업은행">기업은행</option>
                                                   <option id="SC은행">SC은행</option>
                                                   <option id="부산은행">부산은행</option>
                                                   <option id="경남은행">경남은행</option>
                                                   <option id="우체국">우체국</option>
                                                </select>
                                             </div>
                                          </div>
                                       </td>
                                    </tr>
                                    <!-- 예금주 -->
                                    <tr id="input_card_num">
                                       <th scope="row"><label for="lp_card_no1">예금주</label></th>
                                       <td>
                                          <div>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no1">예금주명 입력</label> <input
                                                   id="lp_card_no1" type="text" maxlength="5"
                                                   class="type-n nohan">
                                             </div>
                                          </div>
                                       </td>
                                    </tr>
                                    <!-- 현금영수증 -->
                                    <tr id="input_card_num">
                                       <th scope="row"><label for="lp_card_no1">현금영수증</label><br>
                                          <label for="lp_card_no1"> (핸드폰번호)</label></th>
                                       <td>
                                          <div>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no1">핸드폰번호1</label> <input
                                                   id="lp_card_no1" type="text" maxlength="3"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="divider">-</span>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no1">핸드폰번호2</label> <input
                                                   id="lp_card_no1" type="text" maxlength="4"
                                                   class="type-n nohan">
                                             </div>
                                             <span class="divider">-</span>
                                             <div class="form_wrap text card_no form_bg">
                                                <label for="lp_card_no1">핸드폰번호3</label> <input
                                                   id="lp_card_no1" type="text" maxlength="4"
                                                   class="type-n nohan">
                                             </div>
                                          </div>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="ticket_payment_summary">
            <div class="tps_wrap">
               <div class="tps_body">
                  <div class="summary_box total_box">
                     <div class="payment_header">입금하실 금액</div>
                     <div class="payment_footer">
                        <div class="result">
                           <span class="num verdana" id="totalpay"> <%=request.getParameter("price")%>
                           </span> <span class="won">원</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
   </section>
<%@ include file = "../../common/footer.jsp" %>
</body>
</html>