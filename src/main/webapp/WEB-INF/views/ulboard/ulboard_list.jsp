<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>
<%-- <%@ include file="../include/test.jsp"%> --%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
	$(document).ready(function() {
		$("#write").click(function(){
		
			
			
			
			
		if(${sessionScope.member==null}){
			alert('로그인 후 이용해주세요');
			location.href="${path}/member/login";
			return;
		}	else{
			
			location.href="${path}/ulboard/ulboardInsert";
			return;
		}
			
		});	
	});
</script>

<script type="text/javascript">
function like(idx) {
	var m_idx = 0;
	if(${sessionScope.member==null}){
		alert("로그인 후 이용해주세요");
		location.href="${path}/member/login";
		return false;
	}else{
		m_idx = $("#m_idx").val();
	}
	var u_idx = parseInt(idx);
	
	var url = "${path}/ul_like/like.do";
	param="u_idx="+idx+"&m_idx="+m_idx;	
	alert('u_idx='+u_idx);
	alert('m_idx='+m_idx);
	alert(url);
	$.ajax({
		type: "post",
		url: url,
		data: param,
		success : function(data) {
			if(data==1){
				alert('좋아요');
			}else if(data==2){
				alert('좋아요 취소');
			}else {
				alert('오류');
			}
		}
		
	});
	
}
</script>

<style type="text/css">
#img {
	display: inline-block;
	max-width: 100%;
	height: 170px;
	padding: 4px;
	line-height: 1.42857143;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	-webkit-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
	transition: all .2s ease-in-out;
}
</style>
</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

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
						<c:choose>
								<c:when test="${fn:length(ul.title) > 10}">
									<c:out value="${fn:substring(ul.title,0,9)}" />..           								</c:when>
								<c:otherwise>
									<c:out value="${ul.title}" />
								</c:otherwise>
							</c:choose>
						
						
						<p>
							<span class="label label-danger">${ul.username}</span>
							<span><button class="glyphicon glyphicon-thumbs-up btn btn-primary" onclick="like(${ul.idx})"> ${ul.heart}</button></span>
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
	<div align="center">
		<table>
			<tr>
				<td style="width: 50%"><input type="text" class="form-control"
					placeholder="serch"></td>
				<td>
					<button type="submit"
						class="btn btn-default glyphicon glyphicon-search"></button>
				</td>
				<td style="width: 20%"></td>
				<td style="width: 20%"><button id="write"
						class="btn btn-primary">글쓰기</button></td>
			</tr>
		</table>
	</div>
	
	<input type="hidden" value="${member.idx}" id="m_idx">
	<%@include file="../include/footer.jsp"%>
</body>
</html>