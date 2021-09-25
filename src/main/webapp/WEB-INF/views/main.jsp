<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="include/header.jsp"%>

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

<style type="text/css">
#main_carousel {
	height: 440px;
	background-color: #171624;
	width: 100%;
	padding-top: 20px;
}
</style>

<!-- 소수점표시 라이브러리 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>

	<div class="page-header" align="center">
		<a href="${path}"> <img src="images/logo.jpg">
		</a>
	</div>
	<%@ include file="include/menu.jsp"%>


	<!-- 광고 -->
	<div id="main_carousel" class="container">
		<!-- <h1>인기웹툰!!</h1> -->
		<!--The main div for carousel-->
		<div class="container text-center">
			<div class="carousel slide row" data-ride="carousel"
				data-type="multi" data-interval="2000" id="fruitscarousel">

				<div class="carousel-inner">
					<div class="item active">
						<div class="col-md-3 col-sm-4 col-xs-12">
							<a href="${path}/series/series_list.do?title=${carousel[0].title}"><img
								style="opacity: 0.8" src="images/main_advertising/${carousel[0].ad_image}"
								class="img-responsive"></a>
							<div class="carousel-caption">
								<h3>${carousel[0].title}</h3>
								<h4>${carousel[0].summary}</h4>
								<span class="label label-danger">${carousel[0].type}</span>
							</div>
						</div>
					</div>
					<c:forEach var="crl" begin="1" items="${carousel}">
						<div class="item">
							<div class="col-md-3 col-sm-4 col-xs-12">
								<a href="${path}/series/series_list.do?title=${crl.title}"><img style="opacity: 0.8"
									src="images/main_advertising/${crl.ad_image}"
									class="img-responsive"></a>
								<div class="carousel-caption">
									<h3 >${crl.title}</h3>
									<h4>${crl.summary}</h4>
									<span class="label label-danger">${crl.type}</span>
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
	</div>


	<br />
	<br />
	<!-- 추천 웹툰 -->
	<div class="container" style="width: 100%;">
		<hr class="hr-small">
		<h1 align="center">고객님 취.향.저.격.앙.기.모.띠!! 전체 인기순!</h1>


		<div class="row">
			<div class="col-sm-1 col-md-1"></div>
			<c:forEach var="heart" end="4" items="${heartList}">
				<div class="col-sm-2 col-md-2">
					<div class="thumbnail">
						<a href="${path}/series/series_list.do?title=${heart.title}"><img
							class=" img-responsive" style="width: 100%; height: 200px;"
							src="webtoons/${heart.title}/${heart.image}"
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

	<hr class="hr-small">





	<!-- 장르별 랭킹-->
	<div class="container">
		<h1>장르별 인기랭킹!</h1>

		<div class="row">
			<div class="col-lg-4">
				<h3>액션</h3>
				<hr />
				<c:forEach var="action" varStatus="i" end="4" items="${wt_action}">

							<div class="row">
								<div class="col-xs-1">
									<p>${i.count}</p>
								</div>
								<div  class="col-xs-3">
									<a href="${path}/series/series_list.do?title=${action.title}"><img
										style="width: 70px; height: 70px;"
										src="webtoons/${action.title}/${action.image}" /></a>
								</div>
								<div class="col-xs-6"><br/>${action.title}</div>
								<div class="col-xs-2">
									<br /> <span class="label label-danger">${action.heart}</span>
								</div>
							</div>

				</c:forEach>
			</div>
			<div class="col-lg-4">
				<h2>로맨스</h2>
				<hr />
				<c:forEach var="romance" varStatus="i" end="4" items="${wt_romance}">

					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<a href="${path}/series/series_list.do?title=${romance.title}"><img
								style="width: 70px; height: 70px;"
								src="webtoons/${romance.title}/${romance.image}" /></a>
						</div>
						<div class="col-xs-6">${romance.title}</div>
						<div class="col-xs-2">
							<br /> <span class="label label-danger">${romance.heart}</span>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-4">
				<h2>코믹</h2>
				<hr />
				<c:forEach var="comic" varStatus="i" end="4" items="${wt_comic}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<a href="${path}/series/series_list.do?title=${comic.title}"><img
								style="width: 70px; height: 70px;"
								src="webtoons/${comic.title}/${comic.image}" /></a>
						</div>
						<div class="col-xs-6">${comic.title}</div>
						<div class="col-xs-2">
							<br /> <span class="label label-danger">${comic.heart}</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<hr class="hr-small">

		<div class="row">
			<div class="col-lg-4">
				<h2>학교</h2>
				<hr />
				<c:forEach var="school" varStatus="i" end="4" items="${wt_school}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<a href="${path}/series/series_list.do?title=${school.title}"><img
								style="width: 70px; height: 70px;"
								src="webtoons/${school.title}/${school.image}" /></a>
						</div>
						<div class="col-xs-6">${school.title}</div>
						<div class="col-xs-2">
							<br /> <span class="label label-danger">${school.heart}</span>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-4">
				<h2>성인</h2>
				<hr />
				<c:forEach var="adult" varStatus="i" end="4" items="${wt_adult}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<a href="${path}/series/series_list.do?title=${adult.title}"><img
								style="width: 70px; height: 70px;"
								src="webtoons/${adult.title}/${adult.image}" /></a>
						</div>
						<div class="col-xs-6">${adult.title}</div>
						<div class="col-xs-2">
							<br /> <span class="label label-danger">${adult.heart}</span>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-lg-4">
				<h2>기타</h2>
				<hr />
				<c:forEach var="etc" varStatus="i" end="4" items="${wt_etc}">
					<div class="row">
						<div class="col-xs-1">
							<p>${i.count}</p>
						</div>
						<div class="col-xs-3">
							<a href="${path}/series/series_list.do?title=${etc.title}"><img
								style="width: 70px; height: 70px;"
								src="webtoons/${etc.title}/${etc.image}" /></a>
						</div>
						<div class="col-xs-6">${etc.title}</div>
						<div class="col-xs-2">
							<br /> <span class="label label-danger">${etc.heart}</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>




	</div>
	<!-- container -->

	<!-- 풋터 -->
	<%@include file="include/footer.jsp"%>

</body>
</html>