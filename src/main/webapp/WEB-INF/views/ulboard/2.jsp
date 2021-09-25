<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>짭툰</title>

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

<meta name="viewport" content="width=device-width,initial-scale=1.0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script>
	$(document).ready(function() {
		$("#morebtn").css('visibility','hidden');
		// 수정
		$("#freeboardUpdate").click(function() {
			if (confirm('수정 하시겠습니까?')) {
				location.href = "${path}/ulboard/ulboardUpdate?idx=${view.idx}";
			}
	    });
		// 삭제
	    $("#freeboardDelete").click(function() {
			if (confirm('삭제 하시겠습니까?')) {
				location.href = "${path}/ulboard/ulboardDelete.do?idx=${view.idx}";
			}
		});
});
</script>
<script type="text/javascript">
var next=1;
</script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#insertComment").click(function() {
		
		if(${sessionScope.member==null}){
			alert("로그인 후 이용해주세요");
			location.href="${path}/member/login";
			return;
		}
		var ulboard_idx= ${view.idx};
		var content=$("#content").val();
		var param= "content="+content+"&ulboard_idx="+ulboard_idx;
var url = "${path}/ulboard_comment/insert.do";
		$.ajax({
			type: "post",
			url: url,
			data: param,
		success : function() {

		next =1;
	$("#tar").html("");
			more(1);
	
		}
		});
	})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
$("#more").click(function() {
more(1);
$("#more").attr('disabled',true);

})
})
</script>

<script type="text/javascript">
function more(nextPage) {

	var ulboard_idx=${view.idx};
	var curPage=parseInt(nextPage);
	var url = "${path}/ulboard_comment/list.do?ulboard_idx="+ulboard_idx+"&curPage="+next;
	$.ajax({
		type: "post",
		contentType:"application/json",
		url: url,
		success : function(data) {
			$("#tar").append(data);
			if(next==1){
				$("#morebtn").css('visibility','visible');
			}
			next++;
			totPage();
			if(next>$("#totPage").val()){
				$("#morebtn").css('visibility','hidden');
			};

		}
	})	



}
</script>
<script type="text/javascript">
function del(idx) {
	if(confirm('삭제 하시겠습니까?')){
		idx= parseInt(idx);
		var url = "${path}/ulboard_comment/delete.do?";
		param="idx="+idx;		
		$.ajax({
			type: "post",
			url: url,
			data: param,
			success: function() {
				next =1;
				$("#tar").html("");
						more(1);
			}
		})
	}
}
</script>
<script type="text/javascript">
function reply(idx,obj,obj2) {
	fc_idx=parseInt(idx);
	url= "${path}/fc_relpy/list.do?fc_idx="+fc_idx;
	$.ajax({
		type: "post",
		contentType:"application/json",
		url: url,
		success: function(data) {
 			$(eval(obj)).append(data);
 			$(eval(obj2)).attr('disabled',true);
		}
	});
	
}
</script>
<script type="text/javascript">
function replyInsert(fc_idx,obj) {
	if(${sessionScope.member==null}){
		alert("로그인 후 이용해주세요");
		location.href="${path}/member/login";
		return;
	}
	content=$(eval(obj)).val();
	url= "${path}/fc_relpy/insert.do";
	param = "fc_idx="+fc_idx+"&content="+content;
	$.ajax({
		type: "post",
		url: url,
		data: param,
		success: function() {
			next =1;
			$("#tar").html("");
					more(1);
		}
	});
	
}
</script>
<script type="text/javascript">
function replydel(idx) {
	if(confirm('삭제하시겠습니까?\n 삭제하시면 복구 할수 없습니다.')){
		idx = parseInt(idx);
		url= "${path}/fc_relpy/delete.do";
		param = "idx="+idx;
		$.ajax({
			type: "post",
			url: url,
			data: param,
			success: function() {
				next =1;
				$("#tar").html("");
						more(1);
			}
		})
		
	}
}

</script>

<script type="text/javascript">
function totPage() {
var ulboard_idx=${view.idx};
	var url = "${path}/ulboard_comment/totPage.do?"+"ulboard_idx="+ulboard_idx;

	$.ajax({
		type: "post",
		url: url,
		success : function(data) {
		var totPage = parseInt(data);
		$("#totPage").val(totPage);
		}
	})
}
</script>
</head>
<body>


	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>


	<!-- 페이지제목 -->
	<div class="page-header">
		<h1>얼짱게시판</h1>
	</div>

	<!-- 카테고리 -->
	<div class="container">
		<form method="post" name="form1" class="form-horizontal"
			enctype="multipart/form-data">
			<div class="alert alert-warning" role="alert">
				<ul class="nav navbar-nav navbar-left">
					<li><span class="label label-warning">번호</span>${view.idx}</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><span class="label label-warning">조회수</span>${view.viewcount}</li>
					<li><span class="label label-warning">날짜</span>${view.write_date}</li>
					<li><span class="glyphicon glyphicon-thumbs-up"></span>${view.heart}</li>
				</ul>
				<div align="center">
					<h2>
						<span class="label label-infoo">제목</span>${view.title}</h2>
				</div>

				<div class="form-group">
					<label for="comment">내용</label> ${view.content}
				</div>
				<hr />
				<div class="alert">
					<span class="label label-info">작성자</span>${view.username}
					<c:if test="${view.email==member.email}">
						<ul class="nav navbar-nav navbar-right">
							<li><button id="ulboardUpdate"
									class="btn btn-primary btn-group-sm">수정</button></li>
							<li>&nbsp;</li>
							<li><button id="ulboardDelete"
									class="btn btn-danger btn-group-sm">삭제</button></li>
						</ul>

					</c:if>
					<ul class="nav navbar-nav navbar-right">
						<li><button id="ulboardList"
								class="btn btn-primary btn-group-sm">목록</button></li>
						<li>&nbsp;</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<div class="progress-bar" role="progressbar" aria-valuenow="60"
		aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
		<button id="more" class="btn btn-primary" style="width: 100%">댓글보기
		</button>
	</div>
	<div>
		<div id="tar"></div>

		<div id="morebtn" class="progress-bar" role="progressbar"
			aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
			style="width: 100%;">
			<button class="btn btn-primary" style="width: 100%"
				onclick="more('next')">더보기</button>
		</div>


	</div>

	<div class="progress-bar" role="progressbar" aria-valuenow="60"
		aria-valuemin="0" aria-valuemax="100" style="width: 100%;">댓글입력
	</div>
	<div>
		<textarea class="alert alert-warning" style="width: 80%; float: left"
			name="content" id="content"></textarea>
		<button class="btn btn-danger" style="width: 20%" id="insertComment">
			<br>댓글등록<br> <br>
		</button>
	</div>


	<input type="text" id="totPage" value="${totPagee}">totPage값

	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>

</body>
</html>