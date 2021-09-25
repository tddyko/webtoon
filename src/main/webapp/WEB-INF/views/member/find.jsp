<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>
<c:if test="${message != null}">
<script type="text/javascript">
alert("이름과 폰번호를 확인해주세요.")
</script>
</c:if>

<c:if test="${email != null}">
<script type="text/javascript">
alert("고객님이 가입한 이메일은 ${email} 입니다!!");
</script>
</c:if>

<c:if test="${findpw != null}">
<script type="text/javascript">
alert("입력하신 정보로 가입된 이메일이 없습니다! 이메일과 휴대폰번호를 다시 확인해주세요!");
</script>
</c:if>

<script>
$(document).ready(function() {
	
	$("#find").click(function() {
		var hanExp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/;
		var phone = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
		if($("#username").val() == ""){
			alert("이름을 입력하세요!");
			return false;
		}
		if(!$("#username").val().match(hanExp)){
			alert("이름은 한글만 입력하세요!");
			return false;
		}
		if($("#phone").val() == ""){
			alert("휴대폰 번호를 입력하세요!");
			return false;
		}
		if(!$("#phone").val().match(phone)){
			alert("휴대폰 번호가 형식에 맞지않습니다!");
			return false;
		}
		document.form1.action = "${path}/member/findemail";
		document.form1.submit();
	});
	
	$("#findpw").click(function() {
		var phone = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
		if($("#email").val() == ""){
			alert("이메일을 입력하세요!!");
			return false;
		}
		if($("#phone2").val() == ""){
			alert("휴대폰번호를 입력하세요!!");
			return false;
		}
		if(!$("#phone2").val().match(phone)){
			alert("휴대폰 번호가 형식에 맞지않습니다!");
			return false;
		}
		document.form2.action = "${path}/member/findpw";
		document.form2.submit();
	});
});
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
				<form method="post" name="form1" <%-- action="${path}/member/findemail" --%> role="form">
					<fieldset>
						<h2>이메일 찾기</h2>
						<hr class="colorgraph">
							<div class="form-group onlyHangul">
							<input type="text"  id="username" class="form-control input-lg"
								placeholder="이름(한글만 입력하세요)" name="username">
						</div>
						<div class="form-group">
							<input type="text" id="phone" class="form-control input-lg"
								placeholder="휴대폰 번호(-없이 입력하세요)" name="phone">
						</div>
						<span class="button-checkbox">
							<!-- <button class="btn btn-lg btn-success btn-block" id="find">아이디 찾기</button> -->
							<input type="button" id="find" class="btn btn-lg btn-success btn-block" value="아이디 찾기">
						</span>

					</fieldset>
				</form>
			</div>
		</div>
	
	</div>
<!-- 	여기까지 -->
	
		<div class="container">
	
		<div class="row" style="margin-top: 60px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form method="post" name="form2" <%-- action="${path}/member/findpw" --%> role="form">
					<fieldset>
						<h2>이메일 비번찾기</h2>
						<hr class="colorgraph">
						<div class="form-group">
							<input type="email" class="form-control input-lg"
								placeholder="이메일" id="email" name="email">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-lg"
								placeholder="휴대폰 번호" id="phone2" name="phone2">
						</div>
						<span class="button-checkbox">
							<!-- <button class="btn btn-lg btn-success btn-block" id="findpw">비밀번호 찾기</button> -->
							<input type="button" id="findpw" value="비밀번호 찾기" class="btn btn-lg btn-success btn-block">
						</span>

					</fieldset>
				</form>
			</div>
		</div>
	
	</div>
	
	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>