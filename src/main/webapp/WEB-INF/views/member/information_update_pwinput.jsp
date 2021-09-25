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
		if($("#passwd").val() == ""){
			alert("비밀번호를 입력하세요!");
			return false;
		}
		document.form1.action = "${path}/member/information_update.do";
		document.form1.submit();
	});
});
</script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<form method="post" name="form1">
		<h2>회원님의 비밀번호를 입력해주세요</h2>
		비밀번호 <input type="password" id="passwd" name="passwd"><br> <input type="button"
			value="확인" id="btn">
	</form>
	<%@include file="../include/footer.jsp"%>
</body>
</html>