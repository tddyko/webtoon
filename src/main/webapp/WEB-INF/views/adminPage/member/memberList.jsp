<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>

<title>Insert title here</title>

<script type="text/javascript">

function coin(idx,obj) {
	var coin = $(eval(obj)).val();
	if (confirm('코인을 '+coin+'으로 수정하시겠습니까?')) {
		location.href="${path}/adminPage/member_coin?idx="+idx+"&coin="+coin;
	}
	

}

function email(email) {
	alert(email);
	if(confirm(email+'으로 메일 전송하시겠습니까?')){
		location.href="${path}/adminPage/email?email="+email;
	}
}

</script>

</head>
<body>
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	<div class="table-responsive">
		<table class="table">
			<tr>
				<td>이름</td>
				<td>이메일</td>
				<td>가입일</td>
				<td>코인</td>
				<td>폰번호</td>
				<td>이메일발송</td>
			</tr>
			<c:forEach var="row" items="${list}" varStatus="i">

				<tr>
					<td>${row.username}</td>
					<td>${row.email}</td>
					<td>${row.reg_date}</td>
					<td><input type="number" value="${row.coin}"
						id="coin${i.count}"><button class="btn btn-danger" type="button" onclick="coin(${row.idx},coin${i.count})">수정</button></td>
					<td>${row.phone}</td>
					<td><button class="btn btn-primary" type="button" onclick="email('${row.email}')">이메일발송</button></td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>