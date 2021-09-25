<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>짬툰</title>
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
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<%@ include file="../include/loginCheck.jsp" %>

<script>
	$(document).ready(function() {

		$("#freeboardConfirm").click(function() {
			if (confirm('수정 하시겠습니까?')) {
				
				var content = $('#summernote').summernote('code');
				
				alert('content='+content);
				if(content.length<=10){
					alert(' length 10자 이상 입력해주세요');
					return;
				}
				if(
						(content.startsWith("&nbsp;&nbsp;")&&content.length==12)
						||
						content.startsWith("&nbsp; &nbsp;")
				){
					alert('글 처음에 공백을 쓸 수 없습니다.');
					return;
				}
				
			
				$("#content").val(content);
				document.form1.action = "${path}/freeboard/freeboardUpdate.do";
				document.form1.submit();
			}
		});
		// 취소
		$("#freeboardCancle").click(function() {
			if (confirm('취소 하시겠습니까?')) {
				location.href = "${path}/freeboard/freeboard_list.do";
			}
		});
	});
</script>
<script>
	$(document).ready(function() {
		//서머노트
		$("#summernote").summernote();
	});
</script>


</head>
<body>

	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

	<!-- 컨텐츠 -->

	<div class="page-header">
		<h1>자유게시판</h1>
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

			<div align="center">
				<h2>
					<span class="label label-info">제목</span>${view.title}</h2>
			</div>
			<form method="post" name="form1" class="form-horizontal">
				<div class="form-group">
					<label for="comment">내용</label>
					<div id="summernote">${view.content}</div>
				</div>
				<input type="hidden" id="content" name="content" /> 
				<input type="hidden" name="idx" value="${view.idx}"/>
			</form>
			<hr />
			<div class="alert">
				<ul class="nav navbar-nav navbar-left">
					<li><span class="label label-info">작성자</span>${view.username}</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li><button id="freeboardConfirm"
							class="btn btn-primary btn-group-sm">확인</button></li>
							<li>&nbsp;</li>
					<li><button id="freeboardCancle"
							class="btn btn-danger btn-group-sm">취소</button></li>
				</ul>
			</div>
		</div>
	</div>


	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>