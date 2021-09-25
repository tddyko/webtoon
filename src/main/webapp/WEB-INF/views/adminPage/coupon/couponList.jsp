<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>

<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	$("#couponInsert").click(function() {
		document.form1.action= "${path}/adminPage/couponInsert.do";
		document.form1.submit();
	})
})
</script>
<script type="text/javascript">
function del(id) {
	var idx= parseInt(id);
	if(confirm('삭제 하시겠습니까?')){
		location.href = "${path}/adminPage/counponDelete.do?idx="+idx;
	}
}
</script>
<script type="text/javascript">
function update(idx,obj,obj2) {
	var coin = $(eval(obj)).val();
	var end_date = $(eval(obj2)).val();
if(confirm('수정 하시겠습니까?')){
	location.href = "${path}/adminPage/counpoUpdate.do?idx="+idx+"&coin="+coin+"&end_date="+end_date;
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
				<td>idx</td>
				<td>coin</td>
				<td>coupon</td>
				<td>write_date</td>
				<td>end_date</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="row" items="${list}" varStatus="i">

				<tr>
					<td>${row.idx}</td>
					<td><input type="number" value="${row.coin}" id="coin${i.count}"></td>
					<td>${row.coupon}</td>
					<td>${row.write_date}</td>
					<td><input type="date" value="${row.end_date}" id="end${i.count}"></td>
					<td><button class="btn btn-primary" onclick="update(${row.idx},'coin${i.count}','end${i.count}')">수정</button></td>
					<td><button class="btn btn-danger" onclick="del(${row.idx})">삭제</button></td>
				</tr>

			</c:forEach>
		</table>
	</div>
	
	<form name="form1" method="post">
	<table class="table">
	   <tr>
				<td>coin</td>
				<td>end_date</td>
				<td>발급</td>
			</tr>
				<tr>
					<td><input type="number" value="0" name="coin"></td>
					<td><input type="date" name="end_date"></td>
					<td><input class="btn btn-primary" type="button" id="couponInsert" value="쿠폰 발급"></td>
				</tr>
	</table>
	</form>
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>