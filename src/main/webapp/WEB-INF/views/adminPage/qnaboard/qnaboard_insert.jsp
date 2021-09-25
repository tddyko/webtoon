<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../adminInclude/header.jsp"%>
<script>
$(document).ready(function() {
	$("#input").click(function() {
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
		document.form1.action="${path}/qnaboard/qnaboardInsert.do";
		document.form1.submit();
	});
});
</script>

</head>
<body>
<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	<div class="page-heder">
		<h1>Q & A 게시물 등록</h1>
	</div>
	<form method="post" name="form1">

	카테고리 <input type="text" id="category" name="category"><br>
	자주묻는 질문 <input type="text" id="question" name="question"><br>
	답변 <textarea rows="6" cols="60" id="answer" name="answer"></textarea><br>
	<input type="button" id="input" value="등록">
		<%@ include file="../adminInclude/footer.jsp"%>
</form>
</body>
</html>