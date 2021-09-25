<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>
<script type="text/javascript">
	function carouselInsert() {
		if (confirm('추가합니까?')) {
			document.form1.action = "${path}/adminPage/mainAdvertisingInsert.do";
			document.form1.submit();
		}
	}
</script>

</head>
<body>
	<!-- 로고,메뉴 -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	
	<!-- 컨텐츠  -->
	
	<!-- 컨텐츠 -->
	<div align="center">
		<form method="post" name="form1" enctype="multipart/form-data">
			<table border="1">
				<tr style="color: rosybrown;">
					<th>idx</th>
					<th>title(제목)</th>
					<th>type(장르)</th>
					<th>fee(광고비)</th>
				</tr>
				<tr>
					<td><input name="idx" type="hidden" readonly="readonly"
						 value="9999"/>Auto</td>
					<td><input name="title" type="text"
						 /></td>
					<td><input name="type" type="text"
						 /></td>
					<td><input name="fee" type="number"
						></td>
				</tr>
				<tr style="color: rosybrown;">
					<th>ad_start(시작일)</th>
					<th>ad_end(종료일)</th>
					<th>ad_image(이미지)</th>
					<th>summary(내용요약)</th>
				</tr>
				<tr>
					<td><input name="ad_start" type="date"
						 /></td>
					<td><input name="ad_end" type="date"
						 /></td>
					<td><input name="file" type="file" />현재이미지</td>
					<td rowspan="2"><textarea name="summary" wrap="soft"></textarea></td>
				</tr>
				<tr>

					<td><input type="button" onclick="carouselInsert()" value="추가" /></td>
					<td><input type="button" onclick="location.href='${path}/adminPage/CarouselUpdate.do'" value="취소" /></td>
					<td><input type="hidden" name="ad_image" value="default_drop_the_bit.jpg"/> </td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>