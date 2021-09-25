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
	function webtoonUpdate() {
		
		var idx=$("#idx").val();
		var title=$("#title").val();
		var category=$("#category").val();
		var finish=$("#finish").val();
		var week=$("#week").val();
		var visibility=$("#visibility").val();
		var heart=$("#heart").val();
		var summary=$("#summary").val();
		
		if(title==null || title==""){
		 alert('제목을 입력하세요');	
		}else if(category ==null || category==""){
			alert('장르를 선택하세요');
		}else if(finish ==null || finish==""){
			alert('완결여부를 선택하세요');
		}
		else if(week ==null || week==""){
			alert('연재되는요일을 선택하세요');
		}
		else if(visibility ==null || visibility==""){
			alert('공개여부를 선택하세요');
		}
		else if(summary ==null || summary==""){
			alert('요약문을 작성하세요');
		}
		else {
			document.form1.action = "${path}/adminPage/webtoonUpdate.do";
			document.form1.submit();
		}
		
		
		
		
		
			
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
		<form method="post" name="form1" enctype="multipart/form-data">
			<table class="table">
				<thead>
					<tr class="info">
						<td>idx</td>
						<td>title(제목)</td>
						<td>category(장르)</td>
						<td>finish(완결여부)</td>
						<td>week(업로드 요일)</td>
						<td>visibility(공개여부)</td>
					</tr>
				</thead>

				<tr>
					<td><input id="idx" name="idx" type="number" value="${webtoon.idx}"
						readonly="readonly" />Auto</td>
					<td><input id="title" name="title" type="text" value="${webtoon.title}" /></td>
					<td>
					
					<select name="category"  id="category" >
					<option class="btn" value="${webtoon.category}">Existing values(${webtoon.category})</option>
					<option class="btn" value="액션">액션</option>
					<option class="btn" value="로맨스">로맨스</option>
					<option class="btn" value="코믹">코믹</option>
					<option class="btn" value="학교">학교</option>
					<option class="btn" value="성인">성인</option>
					<option class="btn" value="기타">기타</option>
					</select>
					
					</td>
					<td><select id="finish" name="finish">
							<option class="btn" value="${webtoon.finish}" selected="selected">Existing
								values(${webtoon.finish})</option>
							<option class="btn" value="N">미완결</option>
							<option class="btn" value="Y">완결</option>
					</select></td>


					<td><select id="week" name="week">
							<option class="btn" value="${webtoon.week}" selected="selected">Existing
								values(${webtoon.week })</option>
							<option class="btn" value="Sun">Sun</option>
							<option class="btn" value="Mon">Mon</option>
							<option class="btn" value="Tue">Tue</option>
							<option class="btn" value="Wed">Wed</option>
							<option class="btn" value="Thu">Thu</option>
							<option class="btn" value="Fri">Fri</option>
							<option class="btn" value="Sat">Sat</option>
					</select><input name="image" type="hidden" value="${webtoon.image}" /></td>
					<td><select id="visibility" name="visibility"><option class="btn" value="${webtoon.visibility}" selected="selected">Existing values(${webtoon.visibility})</option>
						<option class="btn" value="N" >N</option>
						<option class="btn" value="Y" >Y</option>
					</select></td>
				</tr>

				<thead>
					<tr class="info">

						<td>heart(좋아요)</td>
						<td>summary(요약)</td>
						<td>&nbsp;</td>
						<td>이미지업로드</td>
						<td>현재이미지</td>
						<td>수정/취소</td>
					</tr>
				</thead>

				<tr>
					<td><input id="heart" name="heart" type="number" value="${webtoon.heart}"></td>
					<td><textarea id="summary" style="width: 300px; height: 100px;"
							name="summary" wrap="soft">${webtoon.summary}</textarea></td>
					<td>&nbsp;</td>
					<td><input id="file" name="file" type="file" /></td>
					<td><img style="width: 120px; height: 100px"
						src="../webtoons/${webtoon.title}/${webtoon.image}" /></td>
					<td><input type="button" onclick="webtoonUpdate()" value="수정" />
						<input type="button"
						onclick="location.href='${path}/adminPage/webtoonSetting.do?week=${webtoon.week}'"
						value="취소" /></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 풋터 -->
	<%@ include file="../adminInclude/footer.jsp"%>

</body>
</html>