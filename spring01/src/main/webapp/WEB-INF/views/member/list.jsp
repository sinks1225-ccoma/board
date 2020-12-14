<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<body>
	<!-- header include -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<h2>회원목록</h2>
	<div class="new_btn">
		<a href="/member/write">신규회원등록</a>
	</div>
	<table>
		<colgroup>
			<col width="*">
			<col width="15%">
			<col width="20%">
			<col width="10%">
		</colgroup>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>이메일</td>
			<td>가입일자</td>
		</tr>
		<c:forEach var="row" items="${items }">
		<tr>
			<td>${row.userid }</td>
			<td><a href="/member/view?userid=${row.userid }">${row.name }</a></td>
			<td>${row.email }</td>
			<td>
				<fmt:formatDate value="${row.join_date }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>