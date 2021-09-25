<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@ include file="../include/header.jsp"%> --%>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
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
			height : 300
		});
		$("#insert").click(function() {

if(${sessionScope.member==null}){
	alert('로그인이 필요합니다.');
	location.href="${path}/member/login";
}
			
			if($("#title").val().length <=6){
				alert('제목을 6글자 이상 입력 해주세요');
				return;
			}
			if($("#title").val().length >=25){
				alert('제목이 너무 깁니다.');
				return;
			}
			if($("#summernote").val().length<=3){
				alert('내용을 입력해주세요');
				return;
			}
			
			document.form1.action="${path}/freeboard/freeboardInsert.do";
			document.form1.submit();
		})
	});
</script>

<%@ include file="../include/loginCheck.jsp"%>

</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<!-- 컨텐츠 -->
	<div class="container">
		<form method="post" name="form1" class="form-horizontal">
			<div class="form-group" style="width: 80%">
				<label class="col-sm-3 control-label">제목</label>
				<div class="col-sm-6">
					<input class="form-control" id="title" type="text" placeholder="제목"
						name="title">
					<!-- <p class="help-block">숫자, 특수문자 포함 8자 이상</p> -->
				</div>
			</div>
			<input type="hidden" name="username" value="${member.username}">
			<input type="hidden" name="email" value="${member.email}">
			<!-- 서머노트 -->
			<textarea id="summernote" name="content" placeholder="내용">
			</textarea>
			<div align="center">
				<button style="width: 50%" class="btn btn-primary" type="button"
					id="insert">
					올리기<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</form>
	</div>




	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>