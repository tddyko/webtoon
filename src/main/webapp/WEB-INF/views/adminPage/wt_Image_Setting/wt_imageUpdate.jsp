<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#sun").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Sun";
		});
		$("#mon").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Mon";
		});
		$("#tue").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Tue";
		});
		$("#wed").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Wed";
		});
		$("#thu").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Thu";
		});
		$("#fri").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Fri";
		});
		$("#sat").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Sat";
		});

	});
</script>

<script>

function update(){
	var image = $("#image").val();
	var check =0;
	<c:forEach var="image" items="${imageList}">
	if (image==${image} && image!=${wt_imageInfo.image}){
		alert(image+'와 같은 값이 존재합니다');
		check =1;
	}
	</c:forEach>
	else if (check==0){
		document.form1.action = "${path}/adminPage/wt_imageUpdate.do";
		document.form1.submit();	
	}
}

</script>







</head>
<body>
	<!-- 로고,메뉴 -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>

	<!-- 요일별 네비바 -->
	<div class="container" align="center">
		<ul class="breadcrumb">
			<li><button id="sun" class="btn btn-danger">&nbsp;일&nbsp;
				</button></li>
			<li><button id="mon" class="btn btn-danger">&nbsp;월&nbsp;
				</button></li>
			<li><button id="tue" class="btn btn-danger">&nbsp;화&nbsp;
				</button></li>
			<li><button id="wed" class="btn btn-danger">&nbsp;수&nbsp;
				</button></li>
			<li><button id="thu" class="btn btn-danger">&nbsp;목&nbsp;
				</button></li>
			<li><button id="fri" class="btn btn-danger">&nbsp;금&nbsp;
				</button></li>
			<li><button id="sat" class="btn btn-danger">&nbsp;토&nbsp;
				</button></li>
		</ul>
	</div>

	<!-- 컨텐츠 -->
	<div class="table-responsive">
		<form method="post" name="form1" enctype="multipart/form-data">
			<table class="table">
				<thead>
					<tr class="info">
						<th>idx</th>
						<th>title</th>
						<th>no</th>
						<th>image순서</th>
						<th>image</th>
						<th>수정/취소</th>
					</tr>
				</thead>
				<tr>
					<td><input type="number" name="idx" value="${wt_imageInfo.idx}" readonly="readonly" /></td>
					<td><input type="text" name="title" value="${wt_imageInfo.title}" id ="title" readonly="readonly"/></td>
					<td><input type="number" name="no" value="${wt_imageInfo.no}" id="no" readonly="readonly"/></td>
					<td><input type="number" name="image" value="${wt_imageInfo.image}" id="image" />
						<input type="hidden" name="beforeImage" value="${wt_imageInfo.image}" />
					</td>
					<td><input type="file" name="file" />
						<h5>현재이미지</h5>
						<img style="width:120px; height: 100px; " src="../webtoons/${wt_imageInfo.title}/${wt_imageInfo.no}/${wt_imageInfo.image}.jpg" />
					</td>
					<td>
					<input type="button" onclick="update()" value="수정" />&nbsp;
						<input type="button"
						onclick="location.href='${path}/adminPage/webtoonEpiSetting?title=${wt_update.title}'"
						value="취소" />
					</td>
				</tr>


			</table>

		</form>

	</div>


	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>

	
</body>
</html>