<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
	<!-- header include -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<h2>구구단</h2>
	<form action="/gugu_result" method="post">
		단을 입력<br>
		<input type="number" name="dan" value="3"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>