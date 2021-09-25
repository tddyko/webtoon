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


<!-- 관리자 로그인 -->
<script type="text/javascript">
	$('#exampleModal').on('show.bs.modal', function(event) {
		/* var inputEmail = document.getElementById("inputEmail");
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient) */
	})
</script>

<script type="text/javascript">

function wt_imageDelete(idx,image){
	if(confirm('삭제하시겠습니까?')){
		location.href="${path}/adminPage/wt_imageDelete.do?idx="+idx+"&title=${title}&no=${no}&image="+image;
	}
}



</script>



</head>
<body>
	<!-- 로고,메뉴 -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	<!-- 파일업로드창 -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">이미지업로드</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="${path}/adminPage/image_upload"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="recipient-name" class="control-label">파일</label> <input
								name="file" type="file" multiple="multiple" class="form-control"
								id="recipient-name">
						</div>
						<hr />
						<div class="form-group">
							<label for="message-text" class="control-label">제목,화</label> <input
								name="title" type="text" class="form-control" value="${title}"
								readonly="readonly" /> <input type="number" name="no"
								value="${no}" class="form-control" readonly="readonly" />
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="추가하기" />
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>




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

		<!-- 파일 업로드 버튼 -->
		<div align="center">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal" data-whatever="@mdo">이미지 업로드</button>
		</div>

		<!-- /업로드버튼 -->
		<table class="table">
			<thead>
				<tr class="info">
					<th>idx</th>
					<th>title</th>
					<th>image</th>
					<th>no(화)</th>
					<th>image순서</th>
					<th>편집,삭제</th>
				</tr>
			</thead>
			<c:forEach var="image" items="${wt_image}" varStatus="i">
				<tr>
					<td>${image.idx}</td>
					<td>${image.title}</td>
					<td><img style="width: 120px; height: 100px;"
						src="../webtoons/${image.title}/${image.no}/${image.image}.jpg" />
						<h5>../webtoons/${image.title}/${image.no}/${image.image}.jpg</h5></td>
					<td>${image.no}</td>
					<td>${image.image}</td>
					<td><button
							onclick="location.href='${path}/adminPage/wt_imageUpdate?idx=${image.idx}'">수정</button>&nbsp;
						<button onclick="wt_imageDelete(${image.idx},${image.image})">삭제</button></td>
				</tr>
			</c:forEach>
		</table>

	</div>


	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>