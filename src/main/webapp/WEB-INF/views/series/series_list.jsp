<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../include/header.jsp"%>


<!-- 요일버튼 이벤트 -->
<script type="text/javascript">
	$(document).ready(function() {

		$("#sun").click(function() {
			location.href = "${path}/series/weekly.do?week=Sun";
		});
		$("#mon").click(function() {
			location.href = "${path}/series/weekly.do?week=Mon";
		});
		$("#tue").click(function() {
			location.href = "${path}/series/weekly.do?week=Tue";
		});
		$("#wed").click(function() {
			location.href = "${path}/series/weekly.do?week=Wed";
		});
		$("#thu").click(function() {
			location.href = "${path}/series/weekly.do?week=Thu";
		});
		$("#fri").click(function() {
			location.href = "${path}/series/weekly.do?week=Fri";
		});
		$("#sat").click(function() {
			location.href = "${path}/series/weekly.do?week=Sat";
		});

	});
</script>
<!-- 웹툰결제하기  -->
<c:if test="${buy!=null}">
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							if (confirm('구매하지 않은 웹툰입니다. 구매하시겠습니까?')) {
								location.href = "${path}/series/buy_webtoon.do?title=${title}&no="+${no};
							}
						})
	</script>
</c:if>

<script type="text/javascript">
	
	function favorite(){
		if(${sessionScope.member==null})		{
			if(confirm('로그인이 필요합니다')){
				location.href="${path}/member/login";
				return;
			}
		}else{
			var url ="${path}/series/favorite_wt.do?title="+'${webtoon.title}';
			$.ajax({
			      type: "post",
			      url: url,
			      success : function(data) {
			      var i = parseInt(data);
			if(i==1){
			alert('관심으로 등록되었습니다.');
			}else if(i==2){
			alert('이미등록된 웹툰입니다.');
			}else if(i==3){
			alert('로그인후 사용하여주세요');
			location.href="${path}/member/login";
			}
		}
			});
	}
	}
</script>


<!-- 소수점표시 라이브러리 -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 글자자르기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
</head>
<body>


	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

	<!-- 요일별 네비바 -->
	<div class="container" align="center">
		<ul class="breadcrumb">
			<li><button id="sun" class="btn btn-danger">&nbsp;일&nbsp;
				</button></li>
			<li><button id="mon" class="btn btn-danger">&nbsp;월&nbsp;
				</button></li>
			<li><button id="tue" class="btn btn-danger">&nbsp;화&nbsp;
				</button></li>
			<li><button id="wed" class="btn btn-danger">&nbsp;수&nbsp;
				</button></li>
			<li><button id="thu" class="btn btn-danger">&nbsp;목&nbsp;
				</button></li>
			<li><button id="fri" class="btn btn-danger">&nbsp;금&nbsp;
				</button></li>
			<li><button id="sat" class="btn btn-danger">&nbsp;토&nbsp;
				</button></li>
		</ul>
	</div>
	<hr />

	<!-- 메인 이미지 -->

	<!-- 컴퓨터 -->
	<div class="container  hidden-xs" style="width: 80%;" align="center">
		<div class="row">
			<div style="height: 100px;" class="col-xs-12 col-lg-12 col-sm-12"></div>
			<div style="height: 100px;" class="col-xs-3 col-lg-3 col-sm-3">
				<img style="width: 100%; height: 150px;"
					src="../webtoons/${webtoon.title}/${webtoon.image}" />
			</div>

			<div style="height: 100px;" class="col-xs-6 col-lg-6 col-sm-6">
				<h2 style="color: gray;">${webtoon.title}</h2>
				<p>
					<c:choose>
						<c:when test="${fn:length(webtoon.summary) > 50}">
							<c:out value="${fn:substring(webtoon.summary,0,49)}" />...</c:when>
						<c:otherwise>
							<c:out value="${webtoon.summary}" />
						</c:otherwise>
					</c:choose>
				</p>

			</div>

			<div class="col-xs-3 col-lg-3 col-sm-3">
				<span class="label label-danger">${webtoon.category}</span> <span
					class="label label-info">별점 : ${webtoon.heart}</span> <span
					class="label label-danger">${webtoon.week}</span><br />
			</div>
			<div style="height: 100px;" class="col-xs-9"></div>
			<div style="height: 100px; margin-right: 0px;" class="col-xs-3">
				<h5 class="btn btn-warning" onclick="favorite()">★ 관심웹툰등록</h5>
			</div>
		</div>
	</div>
	<!-- 모바일용 -->
	<div class="container hidden-lg">
		<div class="row">

			<div style="height: 100px;" class="col-xs-12 col-lg-12 col-sm-12">
				<img style="width: 80%; height: 80%;"
					src="../webtoons/${webtoon.title}/${webtoon.image}" />
			</div>
			<div style="height: 100px;" class="col-xs-12 col-lg-12 col-sm-12">
				<h2 style="color: gray;">${webtoon.title}</h2>
				<p>
					<c:choose>
						<c:when test="${fn:length(webtoon.summary) > 10}">
							<c:out value="${fn:substring(webtoon.summary,0,9)}" />...</c:when>
						<c:otherwise>
							<c:out value="${webtoon.summary}" />
						</c:otherwise>
					</c:choose>
				</p>


			</div>

			<div style="height: 100px;" class="col-xs-12 col-lg-12 col-sm-12">
				<h5 class="label label-danger">${webtoon.category}</h5>
				<h5 class="label label-info">별점 : ${webtoon.heart}</h5>
				<br />
				<h5 class="btn btn-success" onclick="favorite()">★ 관심웹툰등록</h5>
			</div>

		</div>
	</div>


	<hr />
	<!-- 컴퓨터 웹툰목록 -->
	<div style="width: 80%;" class="container hidden-xs">
		<c:forEach var="epi" varStatus="i" items="${episode}">
			<div class="row">
				<div style="height: 70px;" class="col-md-3 col-xs-3 col-sm-3">
					<c:if test="${epi.cost=='유료'}">
						<a
							href="${path}/series/webtoon_list.do?title=${epi.title}&no=${epi.no}">
							<img class="img-responsive" style="width: 80%; height: 90px;"
							src="../webtoons/${epi.title}/${epi.no}/${epi.image}" />
						</a>
					</c:if>
					<c:if test="${epi.cost=='무료'}">
						<a
							href="${path}/series/webtoon_list.do?title=${epi.title}&no=${epi.no}">
							<img class="img-responsive" style="width: 80%; height: 90px;"
							src="../webtoons/${epi.title}/${epi.no}/${epi.image}" />
						</a>
					</c:if>
				</div>

				<div style="height: 70px;" class="col-md-4 col-xs-4 col-sm-4">
					<br /> ${epi.no}화 <span class="hidden-xs">${epi.no_title}</span>
					<c:if test="${i.count==1}">
						<span class="label label-danger">new</span>
					</c:if>
				</div>

				<div style="height: 70px;"
					class="col-md-1 col-xs-1 col-sm-1 hidden-xs">
					<br /> <span class="hidden-xs"><fmt:formatNumber
							value="${epi.star}" pattern="0.0" /></span>
				</div>
				<div class="col-md-3 col-xs-3 col-sm-3">
					<br />
					<p class="hidden-xs">${epi.write_date}</p>
				</div>
				<div style="height: 70px;" class="col-md-1 col-xs-1 col-sm-1">
					<br />
					<c:choose>
						<c:when test="${epi.cost=='유료'}">
							<span class="label label-danger">유료</span>
							<br />
                     ${epi.coin}coin
               </c:when>
						<c:otherwise>
							<span class="label label-info">무료</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr />
		</c:forEach>
	</div>


	<!-- 모바일웹툰목록 -->
	<div style="width: 95%;" class="container hidden-lg">
		<c:forEach var="epi" varStatus="i" items="${episode}">
			<div class="row">
				<div style="height: 70px;" class="col-md-3 col-xs-3 col-sm-3">
					<c:if test="${epi.cost=='유료'}">
						<a
							href="${path}/series/webtoon_list.do?title=${epi.title}&no=${epi.no}">
							<img class="img-responsive" style="width: 100%; height: 90px;"
							src="../webtoons/${epi.title}/${epi.no}/${epi.image}" />
						</a>
					</c:if>
					<c:if test="${epi.cost=='무료'}">
						<a
							href="${path}/series/webtoon_list.do?title=${epi.title}&no=${epi.no}">
							<img class="img-responsive" style="width: 100%; height: 90px;"
							src="../webtoons/${epi.title}/${epi.no}/${epi.image}" />
						</a>
					</c:if>
				</div>

				<div style="height: 70px;" class="col-md-4 col-xs-4 col-sm-4">
					<br /> ${epi.no}화
					<c:if test="${i.count==1}">
						<span class="label label-danger">new</span>
					</c:if>
				</div>

				<div class="col-md-3 col-xs-3 col-sm-3">
					<br />
					<p class="hidden-xs">${epi.write_date}</p>
					<p class="hidden-lg">
						<fmt:formatDate value="${epi.write_date}" pattern="MM-dd" />
					</p>
				</div>
				<div style="height: 70px;" class="col-md-1 col-xs-1 col-sm-1">
					<br />
					<c:choose>
						<c:when test="${epi.cost=='유료'}">
							<span class="label label-danger">유료</span>
							<br />
                     ${epi.coin}coin
               </c:when>
						<c:otherwise>
							<span class="label label-info">무료</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr />
		</c:forEach>
	</div>




	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>


</body>
</html>