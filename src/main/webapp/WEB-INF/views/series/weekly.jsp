<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {

		$("#sun").click(function() {
			location.href = "${path}/series/weekly.do?week=Sun";
		});
		$("#mon").click(function() {
			location.href = "${path}/series/weekly.do?week=Mon";
		});
		$("#tue").click(function() {
			location.href = "${path}/series/weekly.do?week=Tue";
		});
		$("#wed").click(function() {
			location.href = "${path}/series/weekly.do?week=Wed";
		});
		$("#thu").click(function() {
			location.href = "${path}/series/weekly.do?week=Thu";
		});
		$("#fri").click(function() {
			location.href = "${path}/series/weekly.do?week=Fri";
		});
		$("#sat").click(function() {
			location.href = "${path}/series/weekly.do?week=Sat";
		});

	});
</script>

<!-- 소수점표시 라이브러리 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>


	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>


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

	<hr />
	<!-- 만화 목록-->
	<div class="row">
		<c:forEach var="toon" varStatus="i" items="${series}">

			<c:if test="${(i.count%5)==1}">
				<div style="height: 360px" class="col-sm-1 col-md-1"></div>
			</c:if>
			<div style="height: 360px;" class="col-sm-2 col-md-2">
				<div class="thumbnail">
					<a href="${path}/series/series_list.do?title=${toon.title}"><img
						style="width: 100%; height: 200px;"
						src="../webtoons/${toon.title}/${toon.image}"></a>
					<div class="caption">
						<h4>${toon.title}</h4>
						<div style="height: 50px;">
							<c:choose>
								<c:when test="${fn:length(toon.summary) > 20}">
									<c:out value="${fn:substring(toon.summary,0,19)}" />...           								</c:when>
								<c:otherwise>
									<c:out value="${toon.summary}" />
								</c:otherwise>
							</c:choose>
						</div>
						<p>
							<span class="label label-danger">${toon.category}</span> <span
								class="label label-danger"><fmt:formatNumber
									value="${toon.heart}" pattern=".00" /></span>
						</p>
					</div>
				</div>
			</div>

			<c:if test="${(i.count%5)==0}">
				<div style="height: 360px" class="col-sm-1 col-md-1"></div>
			</c:if>

		</c:forEach>
	</div>


	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>