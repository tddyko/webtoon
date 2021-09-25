<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>
<%-- <c:if test="${message != null}">
<script type="text/javascript">
alert("이미 가입된 이메일입니다.")
</script>
</c:if> --%>

<script type="text/javascript">
$(document).ready(function() {
	$("#idCheck").click(function() {
		var inputEmail = document.getElementById("inputEmail");
	    var inputEmail2 = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
		if (!inputEmail.value.match(inputEmail2)) {
            alert("이메일이 형식에 맞지 않습니다!");
            return false;
         }
		document.form1.action="${path}/member/sendnum";
		document.form1.submit();
	})
	
})
</script>

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
				<form method="post" role="form" name="form1">
					<fieldset>
						<h2>비밀번호 변경</h2>
						<hr class="colorgraph">
						<div>이메일</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg"
								placeholder="이메일 입력" name="email" id="inputEmail" value="${email}">
						</div>
						<span class="button-checkbox">
							<input type="button" class="btn btn-lg btn-success btn-block" value="비밀번호 변경을위한 인증번호발송" id="idCheck">
						</span>

					</fieldset>
				</form>
			</div>
		</div>
	
	</div>
<!-- 	여기까지 -->
	
	<%@include file="../include/footer.jsp"%>


</body>
</html>