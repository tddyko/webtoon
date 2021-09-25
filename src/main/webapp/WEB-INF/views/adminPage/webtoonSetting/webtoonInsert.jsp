<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>

<script type="text/javascript">
	function webtoonInsert() {
		var title = $("#title").val();
		var category = $("#category").val();
		var finish = $("#finish").val();
		//var image = $("#image").val();
		var week = $("#week").val();
		var heart = $("#heart").val();
		var summary = $("#summary").val();
		var visibility = $("#visibility").val();
		var file = $("#file").val();

		//file.endWidths

		if (title == null || title == "") {
			alert('제목을 입력하세요');
			return;
		} else if (category == null || category == "") {
			alert('장르를 입력하세요');
		} else if (finish == null || finish == "") {
			alert('완결여부를 선택하세요');
		} else if (week == null || week == "") {
			alert('연재되는 요일을 선택하세요');
		} else if (heart == null || heart == "") {
			alert('좋아요를 입력하세요');
		} else if (summary == null || summary == "") {
			alert('요약설명을 입력하세요');
		} else if (visibility == null || visibility == "") {
			alert('공개여부를 선택하세요');
		} else if (file == null || file == "") {
			alert('파일을 넣어 주세요');
		} else {
			document.form1.action = "${path}/adminPage/webtoonInsert.do";
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
					<tr class="info">
						<td>idx</td>
						<td>title(제목)</td>
						<td>category(장르)</td>
						<td>finish(완결여부)</td>
						<td>week(업로드 요일)</td>
					</tr>
				</thead>

				<tr>
					<td><input name="idx" type="hidden" value="9999" />Auto</td>
					<td><input name="title" id="title" type="text" /></td>
					<td><select name="category" id="category">
							<option class="btn" value="액션">액션</option>
							<option class="btn" value="로맨스">로맨스</option>
							<option class="btn" value="코믹">코믹</option>
							<option class="btn" value="학교">학교</option>
							<option class="btn" value="성인">성인</option>
							<option class="btn" value="기타">기타</option></select></td>
					<td><select id="finish" name="finish">
							<option class="btn" value="N" selected="selected">미완결</option>
							<option class="btn" value="Y">완결</option>
					</select></td>


					<td><select id="week" name="week">
							<option class="btn" value="${week}">Values(${week})</option>
							<option class="btn" value="Sun">Sun</option>
							<option class="btn" value="Mon">Mon</option>
							<option class="btn" value="Tue">Tue</option>
							<option class="btn" value="Wed">Wed</option>
							<option class="btn" value="Thu">Thu</option>
							<option class="btn" value="Fri">Fri</option>
							<option class="btn" value="Sat">Sat</option>
					</select></td>
				</tr>

				<thead>
					<tr class="info">
						<td>heart(좋아요)</td>
						<td>summary(요약)</td>
						<td>공개여부</td>
						<td>이미지업로드</td>
						<td>추가/삭제</td>
					</tr>
				</thead>

				<tr>
					<td><input name="heart" id="heart" type="number" value="0"></td>
					<td><textarea id="summary"
							style="width: 300px; height: 100px;" name="summary" wrap="soft"></textarea></td>

					<td><select name="visibility" id="visibility">
							<option class="btn" value="N" selected="selected">N</option>
							<option class="btn" value="Y">Y</option>
					</select></td>
					<td><input id="file" name="file" type="file" /></td>
					<td><input type="button" onclick="webtoonInsert()" value="추가" />
						&nbsp;<input type="button"
						onclick="location.href='${path}/adminPage/webtoonSetting'"
						value="취소" /></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>

</body>
</html>