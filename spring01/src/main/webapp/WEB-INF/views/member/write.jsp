<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<body>
	<!-- header include -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<h2>회원등록폼</h2>
	<form name="form1" method="post" action="/member/insert">
		<table border="0" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="userid" id="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input name="email" id="email"></td>
			</tr>
		</table>
		<div id="send">
			<a href="javascript:validationCheck();">회원가입</a>
		</div>
	</form>
	<script>
		function validationCheck(){
			// 아이디와 패스워드 정규식 검사
			var check1 = /^[a-zA-Z0-9]{4,12}$/;
			// 이메일 정규식 검사
			var check2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
			
			var id = document.getElementById("userid");
			var pw = document.getElementById("passwd");
			var em = document.getElementById("email");
			
			if(!check(check1,id,"아이디는 4~12자리의 영문 대소문자와 숫자로만 입력해주세요")) {
				return false;
			}
			if(!check(check1,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요")) {
				return false;
			}
			if(em.value == "") {
				alert("이메일을 입력해 주세요");
				em.focus();
				return false;
			}
		}
		
		function check(check1, what, message) {
	       if(check1.test(what.value)) {
	           return true;
	       }
	       alert(message);
	       what.value = "";
	       what.focus();
	       //return false;
	   }
	</script>
</body>
</html>