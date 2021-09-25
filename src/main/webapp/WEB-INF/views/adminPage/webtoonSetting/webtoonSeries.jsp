<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
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

function webtoon_Delete(idx,image,week,title){
	if(confirm('삭제하시겠습니까?')){
		location.href="${path}/adminPage/webtoonDelete.do?idx="+idx+"&image="+image+"&week="+week+"&title="+title;
	}
}

//추가하기
function webtoonInsert(){
	location.href="${path}/adminPage/webtoonInsert?week=${week}";
}
//목록띄우기
function webtoonSeries(){
	location.href="${path}/adminPage/webtoonSetting";
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

	<!-- 요일별 웹툰 -->
	<div class="table-responsive">
		<button onclick="webtoonInsert()" class="right">추가하기</button>
		<table class="table">
			<thead>
				<tr class="info">
					<th>메인사진</th>
					<th>idx</th>
					<th>title<br />(제목)
					</th>
					<th>category<br />(장르)
					</th>
					<th>finish<br />(완결여부)
					</th>
					<th>image<br />(이미지)
					</th>
					<th>week<br />(업데이트 주)
					</th>
					<th>heart<br />(좋아요)
					</th>
					<th>summary<br />(내용요약)
					</th>
					<th>visibility</th>
					<th>각 Episode 설정</th>
					<th>편집/삭제</th>

				</tr>
			</thead>
			<c:forEach var="toon" items="${series}">
				<tr>
					<td><img style="width: 120px; height: 100px;" src="../webtoons/${toon.title}/${toon.image}" /></td>
					<td>${toon.idx}</td>
					<td>${toon.title}</td>
					<td>${toon.category}</td>
					<td>${toon.finish}</td>
					<td>${toon.image}</td>
					<td>${toon.week}</td>
					<td>${toon.heart}</td>
					<td><textarea 
							style="width: 300px; height: 100px;"  readonly="readonly">${toon.summary}</textarea></td>
					<td>${toon.visibility}</td>
					<td><button onclick="location.href='${path}/adminPage/webtoonEpiSetting?title=${toon.title}'" >에피소드별 설정</button></td>
					<td><button
							onclick="location.href='${path}/adminPage/webtoonUpdate?idx=${toon.idx}'">수정</button>&nbsp;
						<button
							onclick="webtoon_Delete(${toon.idx},'${toon.image}','${toon.week}','${toon.title}')">삭제</button></td>
				</tr>

			</c:forEach>
		</table>
	</div>

	<hr />




	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>

</body>
</html>