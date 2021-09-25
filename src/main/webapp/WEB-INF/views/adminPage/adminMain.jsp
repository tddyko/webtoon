<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../adminPage/adminInclude/header.jsp"%>

<!-- <link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
<script>
	jQuery(document).ready(function() {

		jQuery('.carousel[data-type="multi"] .item').each(function() {
			var next = jQuery(this).next();
			if (!next.length) {
				next = jQuery(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo(jQuery(this));

			for (var i = 0; i < 2; i++) {
				next = next.next();
				if (!next.length) {
					next = jQuery(this).siblings(':first');
				}
				next.children(':first-child').clone().appendTo($(this));
			}
		});

	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#updateCarousel").click(function() {
			location.href = "${path}/adminPage/CarouselUpdate.do";
		});
	});
</script>

<style>
.carousel-control.left, .carousel-control.right {
	background-image: none;
}

.img-responsive {
	width: 100%;
	height: 400px;
}

@media ( min-width : 992px ) {
	.carousel-inner .active.left {
		left: -25%;
	}
	.carousel-inner .next {
		left: 25%;
	}
	.carousel-inner .prev {
		left: -25%;
	}
}

@media ( min-width : 768px) and (max-width: 991px ) {
	.carousel-inner .active.left {
		left: -33.3%;
	}
	.carousel-inner .next {
		left: 33.3%;
	}
	.carousel-inner .prev {
		left: -33.3%;
	}
	.active>div:first-child {
		display: block;
	}
	.active>div:first-child+div {
		display: block;
	}
	.active>div:last-child {
		display: none;
	}
}

@media ( max-width : 767px) {
	.carousel-inner .active.left {
		left: -100%;
	}
	.carousel-inner .next {
		left: 100%;
	}
	.carousel-inner .prev {
		left: -100%;
	}
	.active>div {
		display: none;
	}
	.active>div:first-child {
		display: block;
	}
}
</style>

<!-- 관리자 로그인 -->
<script type="text/javascript">
	$('#exampleModal').on('show.bs.modal', function(event) {
		/* var inputEmail = document.getElementById("inputEmail");
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient) */
	})
</script>
<!-- 소수점표시 라이브러리 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>



	<!-- 관리자 로그인창 -->

	<c:if test="${ sessionScope.adminInfo == null }">
		<div align="center">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal" data-whatever="@mdo">관리자 로그인</button>
		</div>
	</c:if>

	<c:if test="${check!=null && sessionScope.adminInfo==null }">
		<div align="center">
			<h1>${check}</h1>
		</div>
	</c:if>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">관리자인증</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="${path}/adminPage/adminMain.do">
						<div class="form-group">
							<label for="recipient-name" class="control-label">아이디</label> <input
								name="adminID" type="text" class="form-control"
								id="recipient-name">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">비밀번호</label> <input
								name="adminPW" type="password" class="form-control"
								id="message-text" />
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary" value="Login" />
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<c:if test="${ sessionScope.adminInfo != null }">
		<%@ include file="../adminPage/adminInclude/top.jsp"%>
		<%@ include file="../adminPage/adminInclude/menu.jsp"%>
		<div align="center">
			<button class="btn btn-primary" id="updateCarousel">메인케러셜 광고수정</button>
			<button class="btn btn-primary" id="updateLike">인기좋은 목록수정</button>
			<button class="btn btn-primary" id="updateRank">인기랭크 목록수정</button>
		</div>
		
		<hr/>
		<!-- 컨텐츠 -->
		<div class="container">
			<h1>인기웹툰!!</h1>

			<!--The main div for carousel-->
			<div class="container text-center">
				<div class="carousel slide row" data-ride="carousel"
					data-type="multi" data-interval="2000" id="fruitscarousel">

					<div class="carousel-inner">
						<div class="item active">
							<div class="col-md-3 col-sm-4 col-xs-12">
								<a href="#"><img
									src="../images/main_advertising/${carousel[0].ad_image}"
									class="img-responsive"></a>
								<div class="carousel-caption">
									<h3>${carousel[0].title}</h3>
									<h4>${carousel[0].summary}</h4>
									<span class="label label-danger">${carousel[0].type}</span>
								</div>
							</div>
						</div>

						<c:forEach var="crr" begin="1" items="${carousel}">

							<div class="item">
								<div class="col-md-3 col-sm-4 col-xs-12">
									<a href="#"><img
										src="../images/main_advertising/${crr.ad_image}"
										class="img-responsive"></a>
									<div class="carousel-caption">
										<h3>${crr.title}</h3>
										<h4>${crr.summary}</h4>
									<span class="label label-danger">${crr.type}</span>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				<a class="left carousel-control" href="#fruitscarousel"
					data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
				<a class="right carousel-control" href="#fruitscarousel"
					data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
			</div>
		</div>



		<hr class="hr-small">

		<!-- 추천 웹툰 -->



		<div class="container" style="width: 100%;">
		<hr class="hr-small">
		<h1 align="center">고객님 취.향.저.격.앙.기.모.띠!! 전체 인기순!</h1>


		<div class="row">
			<div class="col-sm-1 col-md-1"></div>
			<c:forEach var="heart" end="4" items="${heartList}">
				<div class="col-sm-2 col-md-2">
					<div class="thumbnail">
						<img
							class=" img-responsive" style="width: 100%; height: 200px;"
							src="../webtoons/${heart.title}/${heart.image}"
							alt="webtoons/${heart.title}/${heart.image}"></a>
						<div class="caption">
							<strong>${heart.title}</strong>
							<div style="height: 50px;">
								<c:choose>
									<c:when test="${fn:length(heart.summary) > 20}">
										<c:out value="${fn:substring(heart.summary,0,19)}" />...
           								</c:when>
									<c:otherwise>
										<c:out value="${heart.summary}" />
									</c:otherwise>
								</c:choose>
							</div>
							<p>
								<span class="label label-danger">${heart.category}</span> <span
									class="label label-danger"><fmt:formatNumber
										value="${heart.heart}" pattern=".00" /></span>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-sm-1 col-md-1"></div>

		</div>
	</div>

		<!-- 인기순위 -->

		<hr class="hr-small">


		<h1>장르별 인기랭킹!</h1>

		<div style="border: 1px solid black;" class="row">
			<div class="col-lg-4">
				<h2>액션</h2>

				<c:forEach var="action" varStatus="i"  items="${wt_action}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<img style="width: 70px; height: auto;"
								src="../webtoons/${action.title}/${action.image}" />
						</div>
						<div class="col-xs-6">${action.title}</div>
						<div class="col-xs-2"><br/><span class="label label-danger">${action.heart}</span></div>
					</div>
				</c:forEach>
			</div>
			<div class="col-lg-4">
				<h2>로맨스</h2>
				<c:forEach var="romance" varStatus="i" items="${wt_romance}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<img style="width: 70px; height: auto;"
								src="../webtoons/${romance.title}/${romance.image}" />
						</div>
						<div class="col-xs-6">${romance.title}</div>
						<div class="col-xs-2"><br/><span class="label label-danger">${romance.heart}</span></div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-4">
				<h2>코믹</h2>
				<c:forEach var="comic" varStatus="i"  items="${wt_comic}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<img style="width: 70px; height: auto;"
								src="../webtoons/${comic.title}/${comic.image}" />
						</div>
						<div class="col-xs-6">${comic.title}</div>
						<div class="col-xs-2"><br/><span class="label label-danger">${comic.heart}</span></div>
					</div>
				</c:forEach>
			</div>
		</div>
		<hr class="hr-small">

		<div style="border: 1px solid black;" class="row">
			<div style="border: black" class="col-lg-4">
				<h2>학교</h2>
				<c:forEach var="school" varStatus="i" items="${wt_school}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<img style="width: 70px; height: auto;"
								src="../webtoons/${school.title}/${school.image}" />
						</div>
						<div class="col-xs-6">${school.title}</div>
						<div class="col-xs-2"><br/><span class="label label-danger">${school.heart}</span></div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-4">
				<h2>성인</h2>
				<c:forEach var="adult" varStatus="i" items="${wt_adult}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<img style="width: 70px; height: auto;"
								src="../webtoons/${adult.title}/${adult.image}" />
						</div>
						<div class="col-xs-6">${adult.title}</div>
						<div class="col-xs-2"><br/><span class="label label-danger">${adult.heart}</span></div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-4">
				<h2>기타</h2>
				<c:forEach var="etc" varStatus="i" items="${wt_etc}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<img style="width: 70px; height: auto;"
								src="../webtoons/${etc.title}/${etc.image}" />
						</div>
						<div class="col-xs-6">${etc.title}</div>
						<div class="col-xs-2"><br/><span class="label label-danger">${etc.heart}</span></div>
					</div>
				</c:forEach>
			</div>
		</div>




		</div>
		<!-- container -->

		<!-- 풋터 -->
		<%@include file="../adminPage/adminInclude/footer.jsp"%>
	</c:if>


</body>
</html>