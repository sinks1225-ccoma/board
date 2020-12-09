<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#button1").click(function(){
			var dan = $("#dan").val();
			var param = {"dan": dan};
			console.log(param);
			$.ajax({
				type: "POST",
				url: "ajax_gugu_result",
				data: param,
				success:function(result){
					$("#result").html(result);
				},
				error:function(jqXHR, textStatus, errorThrown){
		            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		        }
			});
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>구구단계산</h2>
	단을 입력하세요<br>
	<input type="number" id="dan" value="3"><br>
	<input type="button" id="button1" value="확인">
	<div id="result"></div>
</body>
</html>