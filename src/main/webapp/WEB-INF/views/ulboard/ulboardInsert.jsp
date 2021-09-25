<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@ include file="../include/header.jsp"%> --%>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- /WEB-INF/views/include/header.jsp -->

<!-- head 태그 내부에 들어갈 영역 -->
<title>짭툰</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script>
	$(document).ready(function() {
		$("#summernote").summernote({
			height : 500
		});
		$("#insert").click(function() {
			var title = $("#title").val();
			if(title == "" || title == null){
				alert("제목을 입력하세요.")
				return false;
			}
			var content = $("#summernote").val();
			console.log("content:"+content);
			if(content == "" || content == null || content == "<br>"){
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
			document.form1.action="${path}/ulboard/ulboardInsert.do";
			document.form1.submit();
		})
		$("#cancle").click(function() {
			document.form1.action = "${path}/ulboard/ulboard_list.do?idx=${view.idx}"
			document.form1.submit();
		});
	});
</script>
	

</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<!-- 컨텐츠 -->
	<div class="container">
		<form method="post" name="form1" class="form-horizontal" enctype="multipart/form-data"
		action="${path}/ulboard/ulboardInsert.do">
			<div class="form-group" style="width: 80%">
				<label class="col-sm-3 control-label">제목</label>
				<div class="col-sm-6">
					<input class="form-control" id="title" type="text" placeholder="제목"
						name="title">
				</div>
			</div>
			<input type="hidden" name="username" value="${member.username}">
			<input type="hidden" name="email" value="${member.email}">
			<!-- 서머노트 -->
			<textarea id="summernote" name="content" ></textarea>
			<input type="file" name="imgfile" id="imgfile" multiple="multiple">
			<div align="center">
				<button style="width: 8%" class="btn btn-primary" type="button"
					id="insert">
					올리기<i class="fa fa-check spaceLeft"></i>
				</button>
				<button style="width: 8%" class="btn btn-danger" type="button"
					id="cancle">
					취소<i class="fa fa-check spaceLeft"></i>
					</button>
			</div>
		</form>
	</div>
	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>