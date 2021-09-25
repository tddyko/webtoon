<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp"%>

<!-- 소수점표시 라이브러리 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

	<hr />
	<!-- 만화 목록-->
	<div class="container" >
	<div class="row">
		<c:forEach var="toon" varStatus="i" items="${newList}">
		<%-- <c:if test="${(i.count%5)==1}">
				<div style="height: 360px" class="col-sm-1 col-md-1"></div>
			</c:if> --%>
			<div style="height: 250px" class="col-sm-4 col-md-4">
				<div class="thumbnail">
					<a href="${path}/series/series_list.do?title=${toon.title}"><img
						style="width: 100%; height: 150px;"
						src="../webtoons/${toon.title}/${toon.image}"></a>
					<div style="height: 100px;" class="caption">
						<h4>${toon.title}</h4>
						<div >
							<c:choose>
								<c:when test="${fn:length(toon.summary) > 20}">
									<c:out value="${fn:substring(toon.summary,0,19)}" />...
           								</c:when>
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
			<%-- <c:if test="${(i.count%5)==0}">
				<div style="height: 360px" class="col-sm-1 col-md-1"></div>
			</c:if> --%>
		</c:forEach>
		</div>
	</div>


	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>



</body>
</html>