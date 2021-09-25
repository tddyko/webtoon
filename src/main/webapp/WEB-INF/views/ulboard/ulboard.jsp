<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function insert() {
		if(${sessionScope.member==null}){
			if(confirm('로그인이 필요합니다.\n로그인 하시겠습니까?')){
				
				location.href="${path}/member/login";
			}
			}
		else{
			location.href="${path}/ulboard/ulboardInsert";
			}
	}
</script>

</head>

<body>

	<!-- 헤더,네비  -->
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>

	<!-- 카테고리 -->
  

	<!-- 페이지제목 -->
	<div class="page-header">
		<h1>커뮤니티</h1>
	</div>

	<div class="container">
		<div class="row">
			<%@ include file="../include/boardCategory.jsp"%>

			<div class="col-lg-8">
				<h1>
					<strong>자유게시판</strong>
				</h1>

				<table class="table">
					<thead>
						<tr>
							<td align="center" width="50"><strong>번호</strong></td>
							<td><strong>제목</strong></td>
							<td align="center" width="120"><strong>이름</strong></td>
							<td align="center" width="80"><strong>조회수</strong></td>
							<td align="center" width="70"><strong>날짜</strong></td>
						</tr>
					</thead>
					<c:forEach var="row" items="${list}">
						<tr>
							<td align="center">${row.idx}
							<td>${row.title}</td>
							<td align="center">${row.username}</td>
							<td align="center">${row.viewcount}</td>
							<td align="center">${row.write_date}</td>
						</tr>
					</c:forEach>
					<!-- <tr>
						<td align="center">53</td>
						<td><a href="#">길을 찾고싶은데..&nbsp;<span class='badge'>2</span>
						</a>&nbsp;</td>
						<td align="center"><a href="mailto:ad@ad.adasd">안세진</a></td>
						<td align="center">16/03/17</td>
						<td align="center">82</td>
					</tr> -->

				</table>


				<div style="text-align: center">
					<ul class='pagination'>
						<li class='disabled'><a
							href='http://seungangelx.cafe24.com/qboard_bs/board.php?table=test1&search=&page=1'>1</a></li>
						<li><a
							href='http://seungangelx.cafe24.com/qboard_bs/board.php?table=test1&search=&page=2'>2</a></li>
						<li><a
							href='http://seungangelx.cafe24.com/qboard_bs/board.php?table=test1&search=&page=3'>3</a></li>
						<li><a
							href='http://seungangelx.cafe24.com/qboard_bs/board.php?table=test1&search=&page=4'>4</a></li>
						<li><a
							href='http://seungangelx.cafe24.com/qboard_bs/board.php?table=test1&search=&page=5'>5</a></li>
						<li><a
							href='http://seungangelx.cafe24.com/qboard_bs/board.php?table=test1&search=&page=6'>6</a></li>
					</ul>
				</div>


				<div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<form>
							<div class="input-group">
								<input type="text" id="search" value="" class="form-control">
								<div class="input-group-btn">
									<button type="button" class="btn btn-default" tabindex="-1"
										id="search_form">검색</button>
								</div>
							</div>
							<!-- /.input-group -->
						</form>

					</div>
					<div class="col-lg-4" style="text-align: right">
						<button onclick="insert()" class="btn btn-default">글쓰기</button>
					</div>
				</div>
			</div>
			<!-- /.col-lg-8-->
		</div>
		<!-- /.row-->
	</div>
	<!-- /.container -->


	<!-- 풋터 -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>