<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>
<script type="text/javascript">
function main_ad_Delete(idx){
	if(confirm('삭제하시겠습니까?')){
	location.href="${path}/adminPage/mainAdvertisingDelete.do?idx="+idx;
	}
}
function main_ad_Insert(){
	alert('인서트합니다.');
	location.href="${path}/adminPage/mainAdvertisingInsert";
}
</script>
<!-- 차트그래프  -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<!-- 평균보기 -->
<script>
google.load('visualization', '1', {

	'packages' : [ 'corechart' ]

});


// 평균보기
function chartAvg(){
	
	var start = $("#start").val();
	var end = $("#end").val();
	if(start==null || start==""){
		alert('시작날짜를 입력하세요');
		return;
	}else if(end==null||end==""){
		alert('끝날짜를 입력하세요');
		return;
	}else if(start > end){
		alert('시작날짜보다 끝날짜가 크거나 같아야 합니다.');
		return;
	}else{
		google.setOnLoadCallback(drawChartAvg);
		drawChartAvg(start,end);
		
	}
	
	
}


function drawChartAvg(start,end) {
//json 데이터 받아오기
//dataType : "json" 결과값이 json 형식
//async : false 비동기식 옵션을 끔(동기식)
	var jsonData = $.ajax({
		url : "${path}/chart/chartAvg?start="+start+"&end="+end,
		//url : "${path}/json/sampleData.json",
		dataType : "json",
		async : false
	// 응답텍스트 결과값을 써줌(서버의 응답 텍스트)
	}).responseText;
	// 얼러트로 할수있지~만 콘솔로 출력해봄
	//console.log(jsonData);
// json 데이터를 데이터테이블로 변환
	var data = new google.visualization.DataTable(jsonData);

	// 종류 PieChart ,LineChart , ColumnChart
	var chart = new google.visualization.LineChart(document

			.getElementById('chart_avg'));
	// draw (데이터,옵션)
	chart.draw(data, {
		title:"광고 수입 월 평균 | 단위:(만원)",
		width : 500,
		height : 240

	});

}

</script>

<!-- 총액보기 -->
<script>
/* google.load('visualization', '1', {

	'packages' : [ 'corechart' ]

}); */


// 총액
function chartTotal(){
	google.setOnLoadCallback(drawChartTotal);
	var start2 = $("#start").val();
	var end2 = $("#end").val();
	
	if(start2==null || start2==""){
		alert('시작날짜를 입력하세요');
		return;
	}else if(end2==null||end2==""){
		alert('끝날짜를 입력하세요');
		return;
	}else if(start2 > end2){
		alert('시작날짜보다 끝날짜가 크거나 같아야 합니다.');
		return;
	}
	drawChartTotal(start2,end2);
	
}


function drawChartTotal(start2,end2) {
//json 데이터 받아오기
//dataType : "json" 결과값이 json 형식
//async : false 비동기식 옵션을 끔(동기식)
	var jsonData = $.ajax({
		url : "${path}/chart/chartTotal?start="+start2+"&end="+end2,
		//url : "${path}/json/sampleData.json",
		dataType : "json",
		async : false
	// 응답텍스트 결과값을 써줌(서버의 응답 텍스트)
	}).responseText;
	// 얼러트로 할수있지~만 콘솔로 출력해봄
	//console.log(jsonData);
// json 데이터를 데이터테이블로 변환
	var data = new google.visualization.DataTable(jsonData);

	// 종류 PieChart ,LineChart , ColumnChart
	var chart = new google.visualization.LineChart(document

			.getElementById('chart_total'));
	// draw (데이터,옵션)
	chart.draw(data, {
		title:"광고 수입 월 총액 | 단위:(만원)",
		width : 500,
		height : 240

	});

}

</script>






</head>
<body>

	<%
		out.println(application.getRealPath("/WEB-INF/views//"));
	%>
	<!-- 로고,메뉴 -->
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>


	<div class="table-responsive">
		<button onclick="main_ad_Insert()" class="right">추가하기</button>
		<table class="table">
			<thead>
				<tr class="info">
					<th>idx</th>
					<th>title(제목)</th>
					<th>type(장르)</th>
					<th>fee(광고비)</th>
					<th>ad_start(시작일)</th>
					<th>ad_end(종료일)</th>
					<th>ad_image(이미지)</th>
					<th>summary(내용요약)</th>
					<th>편집/삭제</th>
				</tr>
			</thead>
			<c:forEach var="crl" items="${carousel}">
				<tr>
					<td>${crl.idx}</td>
					<td>${crl.title}</td>
					<td>${crl.type}</td>
					<td>${crl.fee}</td>
					<td>${crl.ad_start}</td>
					<td>${crl.ad_end}</td>
					<td>${crl.ad_image}</td>
					<td>${crl.summary}</td>
					<td><button
							onclick="location.href='${path}/adminPage/mainAdvertisingUpdate.do?idx=${crl.idx}'">수정</button>&nbsp;
						<button onclick="main_ad_Delete(${crl.idx})">삭제</button></td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<hr />
	<!--그래프  -->
	<div>

		시작날짜<input id="start" type="month" name="start" /> 끝날짜<input id="end"
			type="month" name="end" />
		<button class="btn btn-info" type="button" onclick="chartAvg()">월
			평균 금액보기</button>
		<button class="btn btn-primary" type="button" onclick="chartTotal()">월
			총 금액보기</button>

	</div>

	<hr />
	<div class="row">
		<div style="width: 100%; height: 300px;"
			class="col-xs-5 col-sm-5 col-lg-5" id="chart_avg"></div>

		<div style="width: 100%; height: 300px;"
			class="col-xs-5 col-sm-5 col-lg-5" id="chart_total"></div>
	</div>



	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>


</body>
</html>