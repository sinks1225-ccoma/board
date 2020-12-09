<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnLogin").click(function(){
			id = $("#id").val();
			pw = $("#pw").val();
			param = {"id":id, "pw":pw };
			$.ajax({
				type: "POST",
				url: "login_result",
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
	id : <input type="text" id="id">
	pw : <input type="password" id="pw">
	<input type="button" id="btnLogin" value="로그인">
	
	<div id="result"></div>
</body>
</html>