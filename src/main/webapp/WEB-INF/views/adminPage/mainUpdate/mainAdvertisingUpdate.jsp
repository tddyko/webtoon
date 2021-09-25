<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>
<script type="text/javascript">
	function carouselUpdate() {
		if (confirm('수정합니까?')) {
			document.form1.action = "${path}/adminPage/carouselUpdateConfirm.do";
			document.form1.submit();
		}

	}
</script>
</head>
<body>
	<!-- 로고,메뉴 -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>

	<!-- 컨텐츠 -->
	<div class="table-responsive">
		<form method="post" name="form1" enctype="multipart/form-data">
			<table class="table">
				<thead>
					<tr class ="info">
						<th width="5%">idx</th>
						<th width="5%">title(제목)</th>
						<th width="5%">type(장르)</th>
						<th width="5%">fee(광고비)</th>
					</tr>
				</thead>
				<tr>
					<td><input name="idx" type="number" readonly="readonly"
						value="${carouselUpdate.idx}" /></td>
					<td><input name="title" type="text"
						value="${carouselUpdate.title}" /></td>
					<td><input name="type" type="text"
						value="${carouselUpdate.type}" /></td>
					<td><input name="fee" type="number"
						value="${carouselUpdate.fee}"></td>
				</tr>
				<thead>
				<tr class ="info">
					<th width="5%">ad_start(시작일)</th>
					<th width="5%">ad_end(종료일)</th>
					<th width="5%">ad_image(이미지)</th>
					<th width="5%">summary(내용요약)</th>
				</tr>
				</thead>
				<tr>
					<td><input name="ad_start" type="date"
						value="${carouselUpdate.ad_start}" /></td>
					<td><input name="ad_end" type="date"
						value="${carouselUpdate.ad_end}" /></td>
					<td><input name="file" type="file" />현재이미지<img width="100px"
						height="100px"
						src="../images/main_advertising/${carouselUpdate.ad_image}" /></td>
					<td rowspan="2"><textarea name="summary" wrap="soft">${carouselUpdate.summary}</textarea></td>
				</tr>
				<tr>

					<td><input type="button" onclick="carouselUpdate()" value="수정" /></td>
					<td><input type="button"
						onclick="location.href='${path}/adminPage/CarouselUpdate.do'"
						value="취소" /></td>
					<td><input type="hidden" name="ad_image"
						value="${carouselUpdate.ad_image}" /></td>
				</tr>
			</table>
		</form>
	</div>



	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>