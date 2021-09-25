<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
function del(idx) {
	if(confirm){
		location.href="${path}/adminPage/ulboardDelete.do?idx="+idx;
	}
}
</script>

</head>
<body>
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	
	<div class="page-heder">
		<h1>얼짱게시판</h1>
	</div>
	<div class="table-responsive">


		<c:forEach var="ul" items="${list}">
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail">
					<a href="${path}/ulboard/ulboardView.do?idx=${ul.idx}"><img
						src="../ulimg/${ul.username}/${ul.img_url}"
						style="height: 170px; width: 100px"></a>
					<div class="caption">
						<span class="alert">제목</span>
						<c:choose>
								<c:when test="${fn:length(ul.title) > 10}">
									<c:out value="${fn:substring(ul.title,0,9)}" />...           								</c:when>
								<c:otherwise>
									<c:out value="${ul.title}" />
								</c:otherwise>
							</c:choose>
						
						<p>
							<span class="label label-danger">${ul.username}</span>
							<span>
							<button class="glyphicon glyphicon-thumbs-up btn btn-primary" onclick="like(${ul.idx})"> ${ul.heart}</button>
							<button class="btn btn-danger" onclick="del(${ul.idx})">삭제</button>
							</span>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>

		<table class="table">
			<tr>
				<td colspan="5" align="center">
					<nav>
						<ul class="pagination">
							<c:if test="${page.curBlock>1}">
								<li><a
									href="${path}/ulboard/ulboard_list.do?curPage=${page.prevPage}"
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
											href="${path}/ulboard/ulboard_list.do?curPage=${pageNum}">${pageNum}</a></li>

									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${page.curBlock < page.totBlock}">
								<li><a
									href="${path}/ulboard/ulboard_list.do?curPage=${page.nextPage}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>
	
	
	
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>