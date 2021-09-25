<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

	<c:forEach var="row" items="${items}" varStatus="i">
	<div class="dropdown" >
  <button  class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu${i.count}" data-toggle="dropdown" aria-expanded="true" style="width: 100%;">
  <span class="badge">Q</span> : ${row.question}
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu${i.count}" style="width: 100%;">
    <li role="presentation" style="width: 100%;">
    <span class="label label-danger">A</span> : ${row.answer}</li>
  </ul>
</div>
	</c:forEach>

	<%@include file="../include/footer.jsp"%>
</body>
</html>