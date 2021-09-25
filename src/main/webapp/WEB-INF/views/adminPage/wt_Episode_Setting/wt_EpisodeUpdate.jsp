<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>


<script type="text/javascript">
	function update() {
		var idx = $("#idx").val();
		var title = $("#title").val();
		var no = $("#no").val();
		var no_title = $("#no_title").val();
		var viewcount = $("#viewcount").val();
		var star = $("#star").val();
		var write_date = $("#write_date").val();
		var image = $("#image").val();
		var file = $("#file").val();
		var visibility = $("#visibility").val();
		
		var coin = $("#coin").val();
		var cost = $("#cost").val();

		
		if (idx == null || idx == "") {
			alert('뒤로 가기 후 다시 해보세요');
		} else if (title == null || title == "") {
			alert('제목을 입력하세요');
		} else if (no == null || no == "") {
			alert('몇화인지 입력을 하세요');
		} else if (no_title == null || no_title == "") {
			alert('소제목을 입력하세요');
		}else if(cost == null || cost==""){
			alert('무료,유료여부체크');
		}else if(coin == null || coin==""){
			alert('코인값을 입력하세요\n무료시0');
		}else if(cost=="유료" && coin<=0){
			alert('유료,무료,코인체크1');
		}else if(cost=="무료" && coin !=0){
			alert('유료,무료,코인체크2');
		}
		else if (viewcount == null || viewcount == "") {
			alert('조회수를 입력하세요');
		} else if (star == null || star == "") {
			alert('별점을 입력하세요');
		} else if (write_date == null || write_date == "") {
			alert('업데이트 날짜를 선택해주세요');
		}/* else if(image==null||image==""){
					alert('');
				} */else if (visibility == null || visibility == "") {
			alert('공개여부를 선택하세요');
		}else{
			document.form1.action = "${path}/adminPage/wt_episodeUpdate.do";
			document.form1.submit();	
		}
	}
</script>
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
		<form method="post" name="form1" enctype="multipart/form-data">

			<table class="table">
				<thead>
					<tr class="info">
						<th>idx</th>
						<th>title</th>
						<th>no</th>
						<th>no_title</th>
						<th>cost</th>
						<th>viewcount</th>
					</tr>
				</thead>
				<tr>
					<td><input type="number" name="idx" value="${wt_update.idx}" id="idx"  readonly="readonly"/></td>
					<td><input type="text" name="title" id="title"
						value="${wt_update.title}" readonly="readonly" /></td>
					<td><input type="number" name="no" id="no" value="${wt_update.no}" /></td>
					<td><input type="text" name="no_title" id="no_title"  value="${wt_update.no_title}"/></td>
					<td><select name="cost" id ="cost">
						<option  value="${wt_update.cost}" selected="selected">Value(${wt_update.cost})</option>
						<option value="무료">무료</option>
						<option value="유료">유료</option>
					</select></td>
					<td><input type="number" name="viewcount" id="viewcount"
						value="${wt_update.viewcount}" /></td>
				</tr>

				<thead>
					<tr class="info">
						<th>star</th>
						<th>write_date</th>
						<th>image</th>
						<th>visibility</th>
						<th>코인</th>
						<th>수정/취소</th>
					</tr>
				</thead>
				<tr>
					<td><input type="number" name="star" id="star" value="${wt_update.star}" /></td>
					<td><input type="date" name="write_date" id="write_date" value="${wt_update.write_date}"/></td>
					<td><input type="file" name="file" id="file" />
						<h5>현재이미지</h5><img style="width: 120px; height: 100px;" src="../webtoons/${wt_update.title}/${wt_update.no}/${wt_update.image}" /></td>
					<td>
					<input type="hidden" name="image" value="${wt_update.image}" />
					<select id="visibility" name="visibility">
							<option value="${wt_update.visibility}" selected="selected">Existing
								values(${wt_update.visibility})</option>
							<option value="N" >N</option>
							<option value="Y">Y</option>
					</select></td>
					<td><input type="number" name="coin" id="coin" value="${wt_update.coin}" /></td>
					<td><input type="button" onclick="update()" value="수정" />&nbsp;
						<input type="button"
						onclick="location.href='${path}/adminPage/webtoonEpiSetting?title=${wt_update.title}'"
						value="취소" /></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	
	
	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>

</body>
</html>