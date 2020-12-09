<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$.ajax({
			type: "POST",
			url: "background",
			success: function(result) {
				$("#result").html("상품명 : " + result.name + "<br>가격 : " + result.price);
			},
			error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
		});
	});
</script>
</head>
<body>
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<div id="result"></div>
</body>
</html>