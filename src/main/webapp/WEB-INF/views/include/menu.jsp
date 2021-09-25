<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- core tag 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(window).scrollTop() > 190) {
				$("#navi").addClass("navbar-fixed-top");
			} else {
				$("#navi").removeClass('navbar-fixed-top');
			}

		})
	})
</script>

<script>
function serch(){
	var serch = $("#serch").val();
	location.href="${path}/webtoon/serch.do?serch="+serch;
}
</script>

<nav class="navbar navbar-inverse" id="navi">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="${path}">짭툰</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${path}/series/weekly">연재</a></li>
				<li><a href="${path}/finishWebtoon/finishWebtoon">완결</a></li>
				<li><a href="${path}/newWebtoon/newWebtoon">신작</a></li>
				<li><a href="${path}/topWebtoon/tooWebtoon">top10</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${path}/freeboard/freeboard_list.do">자유게시판</a></li>
						<li><a href="${path}/ulboard/ulboard_list.do">얼짱</a></li>
						<li><a href="${path}/qnaboard/qnaboard_list.do">Q&A</a></li>
					</ul></li>
			</ul>



			<ul class="nav navbar-nav navbar-right">
				<li class="hidden-xs">
					<div class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<span class="label label-info">웹툰찾기</span> <input id="serch" type="text"
								name="serch" class="form-control" placeholder="serch">
						</div>
						<button onclick="serch()" class="btn btn-default">
							<span  class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</li>

				<c:choose>
					<c:when test="${sessionScope.member==null}">
						<li><a href="${path}/member/login">로그인</a></li>
						<li><a href="${path}/member/check">회원가입</a></li>
					</c:when>
					<c:otherwise>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">메뉴<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${path}/member/information">마이페이지</a></li>
								<li><a href="${path}/member/coupon.do">쿠폰등록</a></li>
							</ul></li>
						<li><a href="${path}/member/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
















