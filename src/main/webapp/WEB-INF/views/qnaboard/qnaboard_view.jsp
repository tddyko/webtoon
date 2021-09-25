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
	$("#update").click(function() {
		if(!(0<=$("#idx").val() && $("#idx").val()<=9999)){
			alert("게시물 번호는 숫자로 입력하세요!");
			return false;
		}
		if($("#category").val().length >= 16){
			alert("카테고리는 15자 이내로 입력하세요!");
			return false;
		}
		if($("#question").val().length >= 101){
			alert("질문은 100자 이내로 입력하세요!");
			return false;
		}
		if($("#answer").val().length >= 201){
			alert("답변은 200자 이내로 입력하세요!");
			return false;
		}
		document.form1.action="${path}/qnaboard/qnaboardUpdate.do";
		document.form1.submit();
	});
});
</script>

</head>
<body>
<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<div class="page-heder">
		<h1>Q & A 게시물 수정</h1>
	</div>
	<form method="post" name="form1">
	게시물 번호 <input type="text" id="idx" name="idx" value="${view.idx}" readonly="readonly"><br>
	카테고리 <input type="text" id="category" name="category" value="${view.category}"><br>
	자주묻는 질문 <input type="text" id="question" name="question" value="${view.question}"><br>
	답변 <textarea rows="6" cols="60" id="answer" name="answer">${view.answer}</textarea><br>
<button id="update">변경내용등록</button>
	<%@include file="../include/footer.jsp"%>
</form>
</body>
</html>