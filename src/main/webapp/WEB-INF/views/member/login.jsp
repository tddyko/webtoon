<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>
<c:if test="${message != null}">
<script type="text/javascript">
alert("이메일과 비밀번호를 확인해주세요.")
</script>
</c:if>
</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file ="../include/top.jsp" %>
	<%@ include file="../include/menu.jsp"%>
	<!-- 로그인 -->
	<div class="container">
		<div class="row" style="margin-top: 60px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form method="post" action="${path}/member/login" role="form">
					<fieldset>
						<h2>로그인 하세요</h2>
						<hr class="colorgraph">
						<div class="form-group">
							<input type="email" class="form-control input-lg"
								placeholder="아이디" name="email">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-lg"
								placeholder="비밀번호" name="passwd">
						</div>
						<span class="button-checkbox">
							<button type="button" class="btn" data-color="info">자동로그인</button>
							<input type="checkbox" class="hidden"> <a href="${path}/member/find"
							class="btn btn-link pull-right">비밀번호를 잊으셨나요?</a> <a
							href="${path}/member/check" class="btn btn-link pull-right">회원가입</a>
						</span>
						<hr class="colorgraph">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="로그인">
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="" class="btn btn-lg btn-primary btn-block">돌아가기</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>