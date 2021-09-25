<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../adminInclude/header.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$("#freeboardInsert").click(function() {
	
		if(${sessionScope.member==null}){
			alert("로그인 해주세요");
			location.href = "${path}/member/login";
			
			return;
		}		
		location.href ="${path}/freeboard/freeboardInsert";
		
}
	);
})
</script>
<script>
$(document).ready(function() {
	$("#btnSearch").click(function() {
		if($("#search").val() == ""){
			if($("#select").val() == "all"){
				document.form1.action="${path}/freeboard/freeboard_list.do";
				document.form1.submit();
				return;
			}
			alert("검색어를 입력하세요!");
			return false;
		}
		if($("#select").val() == "title"){
		document.form1.action="${path}/adminPage/freeboard_search_title.do";
		document.form1.submit();
		}else if($("#select").val() == "email"){
			document.form1.action="${path}/adminPage/freeboard_search_email.do";
			document.form1.submit();	
		}
	});
});
</script>

<script type="text/javascript">
function del(id) {
	var idx = parseInt(id);
	if(confirm('삭제하시겠습니까?')){
		location.href="${path}/adminPage/freeboardDelete.do?idx="+idx;
	}
}
</script>

</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>

	<div class="page-heder">
		<h1>자유게시판</h1>
	</div>
	<div class="table-responsive">
		<table class="table">


			<thead>
				<tr class="info">
					<td class="hidden-xs" width="5%">번호</td>
					<td width="50%">제목</td>
					<td class="hidden-xs" width="10%">날짜</td>
					<td class="hidden-xs" width="20%">작성자</td>
					<td width="10%">조회수</td>
					<td>삭제</td>
				</tr>
			</thead>
			<c:forEach var="row" items="${list}">
				<tr>
					<td class="hidden-xs bg-success" align="center">${row.idx}</td>
					<td class="active"><a class="text-info"
						href="${path}/freeboard/freeboardView.do?idx=${row.idx}">${row.title}
							<span class="label label-danger">${row.commentCount}</span>
					</a></td>
					<td class="hidden-xs">${row.write_date}</td>
					<td class="hidden-xs">${row.username}(${row.email})</td>
					<td><span class="label label-warning">${row.viewcount}</span></td>
					<td><button class="btn btn-danger" onclick="del(${row.idx})">삭제</button></td>
				</tr>
			</c:forEach>
<c:if test="${page!=null}">
			<tr>
				<td colspan="5" align="center">
					<nav>
						<ul class="pagination">
							<c:if test="${page.curBlock>1}">
								<li><a
									href="${path}/freeboard/freeboard_list.do?curPage=${page.prevPage}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach var="pageNum" begin="${page.blockStart}"
								end="${page.blockEnd}">

								<c:choose>
									<c:when test="${pageNum==page.curPage}">
										<li class="active"><a href="#">${pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${path}/freeboard/freeboard_list.do?curPage=${pageNum}">${pageNum}</a></li>

									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${page.curBlock < page.totBlock}">
								<li><a
									href="${path}/freeboard/freeboard_list.do?curPage=${page.nextPage}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
			</tr>
		</c:if>
		
		</table>
	
	</div>
	
	
	<div align="center" style="width: 100%;">
		<!-- 바꾼 부분 -->
		<form method="post" name="form1">

			<div class="row" align="center" style="width: 100%;">
				<div class="input-group" style="width: 100%;">
					<span class="input-group-addon">
					<select id="select">
							<option class="btn" value="title">제목</option>
							<option class="btn" value="email">email</option>
					</select> <input type="text" aria-label="..." id="search" name="search">
						<button id="btnSearch"
							class="btn btn-default glyphicon glyphicon-search">검색</button>
					</span>
				</div>
				<!-- /.col-lg-6 -->

			</div>


		</form>
	</div>
	

	<%@include file="../adminInclude/footer.jsp"%>


</body>
</html>