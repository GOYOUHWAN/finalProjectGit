<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#answer_a").click(function(){
			$(".one").show();
			$("#answer_b").hide();
		});
	});
	$(function(){
		$("#answer_a_1").click(function(){
			$(".two").show();
			$("#answer_a_2").hide();
		});
	});
	$(function(){
		$("#answer_a_1_1").click(function(){
			$(".three").show();
			$("#answer_a_1_2").hide();
		});
	});
	$(function(){
		$("#answer_a_1_2").click(function(){
			$(".four").show();
			$("#answer_a_1_1").hide();
		});
	});
//======================================	
	$(function(){
		$("#answer_a_2").click(function(){
			$(".two_1").show();
			$("#answer_a_1").hide();
		});
	});
	$(function(){
		$("#answer_a_2_1").click(function(){
			$(".three_1").show();
			$("#answer_a_2_2").hide();
		});
	});
	$(function(){
		$("#answer_a_2_2").click(function(){
			$(".four_1").show();
			$("#answer_a_2_1").hide();
		});
	});
//================================================
	$(function(){
		$("#answer_b").click(function(){
			$(".one_b").show();
			$("#answer_a").hide();
		});
	});
	$(function(){
		$("#answer_b_1").click(function(){
			$(".two_b").show();
			$("#answer_b_2").hide();
		});
	});
	$(function(){
		$("#answer_b_1_1").click(function(){
			$(".three_b").show();
			$("#answer_b_1_2").hide();
		});
	});
	$(function(){
		$("#answer_b_1_2").click(function(){
			$(".four_b").show();
			$("#answer_b_1_1").hide();
		});
	});
//======================================	
	$(function(){
		$("#answer_b_2").click(function(){
			$(".two_b_1").show();
			$("#answer_b_1").hide();
		});
	});
	$(function(){
		$("#answer_b_2_1").click(function(){
			$(".three_b_1").show();
			$("#answer_b_2_2").hide();
		});
	});
	$(function(){
		$("#answer_b_2_2").click(function(){
			$(".four_b_1").show();
			$("#answer_b_2_1").hide();
		});
	});

</script>
<style type="text/css">
	.hide{
		display: none;
	}

</style>	
</head>
<body>
<h2>질문</h2>
<!--첫번째 질문  -->
	<div>전자기기 어떤거 사용하는가?</div>
		<div id="answer_a" >노트북</div>
			<div  id="question_a" class="hide one">노트북은 어디꺼 사용?	</div>
			
				<div  id="answer_a_1" class="hide one">애플</div>
					<div id="question_a_1" class="hide two">램은 몇기가? </div>
						<div id="answer_a_1_1" class="hide two">4G</div>
							<div id="question_a_1_1" class="hide three">안불편해?</div>
								<div id="answer_a_1_1_1" class="hide three">안불편해</div>
								<div id="answer_a_1_1_2" class="hide three">좀 불편해</div>
						<div id="answer_a_1_2" class="hide two"> 16G</div>
								<div id="question_a_1_2" class="hide four">부족하지않아?</div>
									<div id="answer_a_1_2_1" class="hide four">안부족해</div>
									<div id="answer_a_1_2_2" class="hide four">좀 부족해</div>
									
				<div  id="answer_a_2" class="hide one">삼성</div>
					<div id="question_a_2" class="hide two_1">램은 몇기가? </div>
						<div id="answer_a_2_1" class="hide two_1">4G</div>
							<div id="question_a_2_1" class="hide three_1">안불편해?</div>
								<div id="answer_a_2_1_1" class="hide three_1">안불편해</div>
								<div id="answer_a_2_1_2" class="hide three_1">좀 불편해</div>
						<div id="answer_a_2_2" class="hide two_1"> 16G</div>
							<div id="question_a_2_2" class="hide four_1">부족하지않아?</div>
								<div id="answer_a_2_2_1" class="hide four_1">안부족해</div>
								<div id="answer_a_2_2_2" class="hide four_1">좀 부족해</div>
	
		<div id="answer_b" >컴퓨터</div>
				<div  id="question_b" class="hide one_b">컴퓨터는 어디꺼 사용?	</div>
				
					<div  id="answer_b_1" class="hide one_b">asus</div>
						<div id="question_b_1" class="hide two_b">램은 몇기가? </div>
							<div id="answer_b_1_1" class="hide two_b">32G</div>
								<div id="question_b_1_1" class="hide three_b">안불편해?</div>
									<div id="answer_b_1_1_1" class="hide three_b">안불편해</div>
									<div id="answer_b_1_1_2" class="hide three_b">좀 불편해</div>
							<div id="answer_b_1_2" class="hide two_b"> 64G</div>
									<div id="question_b_1_2" class="hide four_b">부족하지않아?</div>
										<div id="answer_b_1_2_1" class="hide four_b">안부족해</div>
										<div id="answer_b_1_2_2" class="hide four_b">좀 부족해</div>
										
					<div  id="answer_b_2" class="hide one_b">intel</div>
						<div id="question_b_2" class="hide two_b_1">겉은 무슨색? </div>
							<div id="answer_b_2_1" class="hide two_b_1">파랑</div>
								<div id="question_b_2_1" class="hide three_b_1">안불편해?</div>
									<div id="answer_b_2_1_1" class="hide three_b_1">안불편해</div>
									<div id="answer_b_2_1_2" class="hide three_b_1">좀 불편해</div>
							<div id="answer_b_2_2" class="hide two_b_1_1"> 검정</div>
								<div id="question_b_2_2" class="hide four_b_1_1">부족하지않아?</div>
									<div id="answer_b_2_2_1" class="hide four_b_1_1">안부족해</div>
									<div id="answer_b_2_2_2" class="hide four_b_1_1">좀 부족해</div>
		


</body>
</html>