<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:if test="${sessionScope.member==null}"> 
	<script>
	alert('로그인이 필요합니다.');
	location.href="${path}/member/login"
	</script>
</c:if>
