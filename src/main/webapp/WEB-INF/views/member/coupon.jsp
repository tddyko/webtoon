<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>

<c:if test="${ok!=null}">
	<script type="text/javascript">
		alert('${ok}');
	</script>
</c:if>
<c:if test="${no!=null}">
	<script type="text/javascript">
		alert('일치하지 않은 쿠폰이거나 유효기간이 지난 쿠폰입니다.')
	</script>
</c:if>

<script type="text/javascript">
	$(document).ready(function() {
		$("#in").click(function() {
			if ($("#coupon").val().length != 16) {
				alert('쿠폰 번호는 16자입니다');
				return;
			}
			document.form1.action = "${path}/member/couponCheck";
			document.form1.submit();
		})
	})
</script>
</head>
<body>
	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>
	<!-- 로그인 -->
	<div class="container" align="center">

		<div class="row">
			<div style="height: 170px;" class="col-xs-12">
				<img alt="" src="../images/coupon.png" class="img img-responsive">

			</div>
	
			<div  class="col-xs-1"></div>
			<div  class="col-xs-1"></div>
			<div class="col-xs-10">
				<form method="post" name="form1">
					<input type="text" class="input-lg" size="20" name="coupon"
						id="coupon"> <input type="button" class="btn btn-danger"
						value="쿠폰 등록" id="in">
				</form>

			</div>
		</div>


	</div>
	<!-- 	여기까지 -->

	<%@include file="../include/footer.jsp"%>


</body>
</html>