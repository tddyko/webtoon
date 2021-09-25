<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	$("#btn").click(function() {
		if(confirm("입력하신 내용대로 정보를 수정하시겠습까?")){
			var emailcheck = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
			var phonecheck = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
			if($("#username").val() == ""){
				alert("이름을 입력하세요!");
				return false;
			}
			if($("#email").val() == ""){
				alert("이메일을 입력하세요!");
				return false;
			}
			if($("#phone").val() == ""){
				alert("휴대폰번호를 입력하세요!");
				return false;
			}
			if($("#passwd").val() == ""){
				alert("비밀번호를 입력하세요!");
				return false;
			}
			if($("#passwdcheck").val() == ""){
				alert("비밀번호 확인을 입력하세요!");
				return false;
			}
			if(!$("#email").val().match(emailcheck)){
				alert("이메일이 형식에 맞지않습니다!");
				return false;
			}
			if(!$("#phone").val().match(phonecheck)){
				alert("휴대폰번호가 형식에 맞지않습니다!");
				return false;
			}
			if(!(6<=$("#passwd").val().length && $("#passwd").val().length <=8)){
				alert("비밀번호는 6-8자리로 입력하세요!");
				return false;
			}
			if(!$("#passwd").val().match($("#passwdcheck").val())){
				alert("비밀번호가 일치하지 않습니다!");
				return false;
			}
			document.form1.action = "${path}/member/information_update_complete";
			document.form1.submit();
			alert("정보가 수정되었습니다!! 로그인 페이지로 이동합니다.");
		}
	});
});
</script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<h2>회원정보 수정</h2>
	<form method="post" name="form1">
	<input type="hidden" name="idx" value="${member.idx}">
		<table border="1">
		
			<tr>
				<td>회원 이름</td>
				<td><input type="text" name="username" id="username" value="${member.username}"></td>
			</tr>
			<tr>
				<td>회원 이메일</td>
				<td><input type="text" name="email" id="email" value="${member.email}"></td>
			</tr>
			<tr>
				<td>회원 휴대폰 번호</td>
				<td><input type="text" name="phone" id="phone" value="${member.phone}"></td>
			</tr>
			<tr>
				<td>회원 비밀번호</td>
				<td><input placeholder="6-8자리로 입력" name="passwd" type="password" id="passwd" value="${member.passwd}"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="passwdcheck" id="passwdcheck" value="${member.passwd}"></td>
			</tr>
		</table>
		<input type="button" id="btn" value="수정">
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>