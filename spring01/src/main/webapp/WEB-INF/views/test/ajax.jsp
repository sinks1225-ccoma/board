<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
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
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="result"></div>
</body>
</html>