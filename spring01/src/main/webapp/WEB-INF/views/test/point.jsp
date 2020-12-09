<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<body>
	<!-- header include -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<form action="point_result" method="post">
		이름<input type="text" name="name"><br>
		국어<input type="text" name="kor"><br>
		영어<input type="text" name="eng"><br>
		수학<input type="text" name="mat"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>