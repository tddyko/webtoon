<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>
<script>
	function del(idx) {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "${path}/qnaboard/qnaboardDelete.do?idx=" + idx;
		}
	}
	function update(idx) {
		location.href = "${path}/qnaboard/qnaboardView.do?idx=" + idx;
	}
<%-- 			<td><input type="button" value="수정" onclick="update('${row.idx}')"></td> --%>
	
<%-- 			<td><input type="button" value="삭제" onclick="del('${row.idx}')"></td> --%>
	
</script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	<c:forEach var="row" items="${items}" varStatus="i">
	<div class="dropdown">
		<button class="btn btn-default dropdown-toggle" type="button"
			id="dropdownMenu${i.count}" data-toggle="dropdown"
			aria-expanded="true" style="width: 100%;">
			<span class="badge">Q</span> : ${row.question} <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu"
			aria-labelledby="dropdownMenu${i.count}" style="width: 100%;">
			<li role="presentation" style="width: 100%;"><span
				class="label label-danger">A</span> : ${row.answer}
				<button class="btn btn-primary" onclick="update('${row.idx}')">수정</button>
				<button class="btn btn-primary" onclick="del('${row.idx}')">삭제</button></li>
		</ul>
	</div>
</c:forEach>
<a class="btn btn-primary" href="${path}/qnaboard/qnaboardInsert">게시물 등록</a>
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>