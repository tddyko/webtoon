<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {

		$("#sun").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Sun";
		});
		$("#mon").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Mon";
		});
		$("#tue").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Tue";
		});
		$("#wed").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Wed";
		});
		$("#thu").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Thu";
		});
		$("#fri").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Fri";
		});
		$("#sat").click(function() {
			location.href = "${path}/adminPage/webtoonSetting.do?week=Sat";
		});

	});
</script>
<script type="text/javascript">
function wt_episodeInsert(){
	location.href="${path}/adminPage/wt_episodeInsert?title=${wtE_title}";
}
function wt_episodeDelete(idx){
	if(confirm('삭제하시겠습니까?')){
		location.href="${path}/adminPage/wt_episodeDelete?idx="+idx;	
	}
}
function wt_imgSetting(title,no){
	
	alert(title);
	location.href="${path}/adminPage/wt_imageSeries?title="+title+"&no="+no;
}

</script>







</head>
<body>

	
	
	<!-- 로고,메뉴 -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>


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

	<!-- 컨텐츠 -->
	<div class="table-responsive">
		<button onclick="wt_episodeInsert()" class="right">추가하기</button>


		<table class="table">
			<thead>
				<tr class="info">
					<th>image</th>
					<th>idx</th>
					<th>title</th>
					<th>no</th>
					<th>no_title</th>
					<th>viewcount</th>
					<th>start</th>
					<th>write_date</th>
					<th>visibility</th>
					<th>유료,무료</th>
					<th>코인</th>
					<th>해당웹툰 이미지 설정</th>
					<th>편집,삭제</th>
				</tr>
			</thead>
			<c:forEach var="epi" items="${wtEpisode}">
				<tr>
					<td><img style="width: 120px; height: 100px;"
						src="../webtoons/${epi.title}/${epi.no}/${epi.image}" />
						<h5>${epi.image}</h5></td>
					<td>${epi.idx}</td>
					<td>${epi.title}</td>
					<td>${epi.no}</td>
					<td>${epi.no_title}</td>
					<td>${epi.viewcount}</td>
					<td>${epi.star}</td>
					<td>${epi.write_date}</td>
					<td>${epi.visibility}</td>
					<td>${epi.cost}</td>
					<td>${epi.coin}</td>
					<td><button onclick="wt_imgSetting('${epi.title}',${epi.no})">이미지
							설정</button></td>
					<td>
					
					<button
							onclick="location.href='${path}/adminPage/wt_episodeUpdate?idx=${epi.idx}'">수정</button>&nbsp;
						<button onclick="wt_episodeDelete(${epi.idx})">삭제</button></td>
				</tr>
			</c:forEach>
		</table>

	</div>

	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>