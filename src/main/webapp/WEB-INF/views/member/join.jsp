<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>
<c:if test="${message != null}">
	<script type="text/javascript">
		alert("올바르게 입력해주세요.")
	</script>
</c:if>


<script type="text/javascript">
$(document).ready(function() {
   $("#join").click(function() {
     
      var inputEmail = document.getElementById("inputEmail");
      var inputEmail2 = /^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.([a-z\.]{2,6})$/;
      
      var inputPassword = document.getElementById("inputPassword");
       var min = 6;
       var max = 8;
       
      
      var inputPasswordCheck = document.getElementById("inputPasswordCheck");
      
      var inputName = document.getElementById("inputName");
      
      var inputNumber = document.getElementById("inputNumber");
      var inputNumber2 = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;
     // var inputNumber2 = /^\d{3}-\d{3,4}-\d{4}$/;

         //이메일검사
         if (!inputEmail.value.match(inputEmail2)) {
            alert("이메일이 형식에 맞지 않습니다!");
            return false;
         }
         //비밀번호 검사
         if (!(min <= inputPassword.value.length && max >= inputPassword.value.length)) {
            alert("비밀번호는 6-8자로 입력하세요!");
            return false;
         }
         //비밀번호 확인
         if (inputPassword.value != inputPasswordCheck.value) {
            alert("비밀번호가 일치하지 않습니다!");
            return false;
         }
         //휴대폰 번호 확인
         var phone=inputNumber.value;
         if (!(phone.match(inputNumber2))) {
            alert("전화번호가 형식에 맞지 않습니다!");
            return false;
         }
    
         document.form1.action="${path}/member/join";
         document.form1.submit();
  
   })
})
</script>

</head>
<body>
	<!-- 헤더  -->
	<%@include file="../include/top.jsp"%>
	<%@include file="../include/menu.jsp"%>

	<!-- 회원가입폼  -->

	<article class="container">
		<div class="page-header">
			<h1>
				<span>회원가입</span>
			</h1>
		</div>
		<div class="col-md-12">

			<form method="post" name="form1" class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
					<div class="col-sm-6">
						<input class="form-control input-lg" id="inputEmail" type="email"
							name="email" value="${email}" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPassword" type="password"
							placeholder="비밀번호" name="passwd">
						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPasswordCheck"
							type="password" placeholder="비밀번호 확인">
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputName" type="text"
							placeholder="이름" name="username">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="tel" class="form-control" id="inputNumber"
								placeholder="- 없이 입력해 주세요" name="phone" /> <span
								class="input-group-btn">
								
							</span>
						</div>
					</div>
				</div>
					
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" type="button" id="join">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger" type="submit">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</form>
			<hr>
			<div class="page-header">
				<h1>
					<span>회원가입</span>
				</h1>
			</div>
		</div>
	</article>



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>