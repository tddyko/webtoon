<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>짬툰</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<script>
	$(document).ready(function() {
		$("#content").summernote({
			height : 500
		});
	$(document).ready(function() {
		$("#ulboardConfirm").click(function() {
			if (confirm('수정 하시겠습니까?')) {
				var content = $('#content').summernote('code');
				$("#content").val(content);
				var title = $("#title").val();
				if(title == "" || title == null){
					alert("제목을 입력하세요.")
					return false;
				}
				var content = $("#content").val();
				if(content == "" || content == null){
					alert("내용을 입력하세요.")
					return false;
				}
				var file = $("#imgfile").val();
				if(file == "" || file == null){
					alert("이미지 파일을 업로드 해주세요.");
					return false;
				}
				var file = $("#imgfile").val();
				if (file) {
				    var startIndex = (file.indexOf('\\') >= 0 ? file.lastIndexOf('\\') : file.lastIndexOf('/'));
				    var filename = file.substring(startIndex);
				    if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
				        filename = filename.substring(1);
				    }
				    if(filename.length >= 20) {
						alert("파일이름이 너무 깁니다.\n파일명을 15자 이내로 해주세요.");
						return false;
					}
				}
				document.form1.action = "${path}/ulboard/ulboardUpdate.do";
				document.form1.submit();
			}
		});
		
		// 취소
		$("#ulboardCancle").click(function() {
			if (confirm('취소 하시겠습니까?')) {
				location.href = "${path}/ulboard/ulboard_list.do";
						}
					})
				})
			});
</script>

</head>
<body>

	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

	<!-- 컨텐츠 -->
	<div class="page-header">
		<h1>얼짱게시판</h1>
	</div>

	<!-- 카테고리 -->
	<div class="container">
		<div class="alert alert-warning" role="alert">
			<ul class="nav navbar-nav navbar-left">
				<li><span class="label label-warning">번호</span>${view.idx}</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><span class="label label-warning">조회수</span>${view.viewcount}
					<span class="label label-warning">날짜</span>${view.write_date}</li>
			</ul>

			
			<form method="post" name="form1" class="form-horizontal" enctype="multipart/form-data">
			<div class="col-sm-6" align="center">
				<input class="form-control" type="text" placeholder="${view.title}" name="title" id="title">
			</div>
			<br><br><br>
				<textarea id="content" name="content">${view.content}</textarea>
				<input type="hidden" name="idx" value="${view.idx}"/>
				<input type="hidden" name="username" value="${view.username}"/>
				<input type="file" name="imgfile" id="imgfile">
			</form>
			<hr/>
			<div class="alert">
				<ul class="nav navbar-nav navbar-left">
					<li><span class="label label-info">작성자</span>${view.username}</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><button id="ulboardConfirm"
							class="btn btn-primary btn-group-sm">확인</button></li>
							<li>&nbsp;</li>
					<li><button id="ulboardCancle"
						class="btn btn-danger btn-group-sm">취소</button></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>