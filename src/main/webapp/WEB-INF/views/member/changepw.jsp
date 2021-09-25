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
	$("#btnpwchange").click(function() {
		var passwd = document.getElementById("passwd");
		var passwdok = document.getElementById("passwdok");
		if(!(6<=$("#passwd").val().length && $("#passwd").val().length<=8)){
			alert("비밀번호는 6-8자로 입력하세요!");
			return false;
		}
		if(!passwd.value.match(passwdok.value)){
			alert("비밀번호가 일치하지 않습니다!");
			return false;
		}
		if(confirm("비밀번호를 변경하시겠습니까?")){
			if(confirm("비밀번호가 변경되었습니다. 로그인 하세요")){
			document.form1.action = "${path}/member/changepw.do";
			document.form1.submit();				
			}
		}
	});
});
</script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<form method="post" name="form1">
	<h3>비밀번호를 변경하세요</h3>
이메일 <input type="text" value="${email}" name="email"><br>
변경할 비밀번호(6-8자로 입력) <input type="password" id="passwd" name="passwd"><br>
비밀번호 확인 <input type="password" id="passwdok"><br>
<input type="button" id="btnpwchange" value="비밀번호 변경하기">
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>