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
		document.form1.action = "${path}/member/information_passwd_reinput";
		document.form1.submit();
	});
});
</script>
</head>
<body>
<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
비밀번호가 일치하지 않습니다!!
<form method="post" name="form1">
<input type="button" id="btn" value="확인">
</form>
<%@include file="../include/footer.jsp"%>
</body>
</html>