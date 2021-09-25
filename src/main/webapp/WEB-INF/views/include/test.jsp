<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<script>
function loginCheck ( url ){
	<c:if test="${ sessionScope.member == null }">
		alert('로그인이 필요 합니다.');
		location.href="${path}/member/login";
	</c:if>
	<c:if test="${ sessionScope.member != null }">
		location.href= url ;
	</c:if>
}	
</script>