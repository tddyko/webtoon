<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp"%>
<script>
	$(document).ready(function() {
		$("#informationUpdate_btn").click(function() {
			location.href = "${path}/member/information_update_pwinput";
		});
		$('#exampleModal').on('show.bs.modal', function(event) {
		});
		$('#myfavorite').on('show.bs.modal', function(event) {
		});
	});
</script>
<script type="text/javascript">
function listup() {
	url = "${path}/member/favoriteList.do";
	$.ajax({
		type: "post",
		contentType:"application/json",
		url: url,
		success : function(data) {
			$("#favoritetarget").html("");
			$("#favoritetarget").append(data);

		}
	})	
}
</script>

<script type="text/javascript">
	function favoriteDelete(idx){
		if(${sessionScope.member==null})		{
			if(confirm('로그인이 필요합니다')){
				location.href="${path}/member/login";
				return;
			}
		}else{
			
			var url ="${path}/member/favoriteDelete.do?idx="+idx;
			$.ajax({
				type:"post",
				url : url,
				success:function(){
					
					listup();
					$("#favorite").click();
					
				}
			});
		}
		
	}
</script>


<script>
function bye(){
	if(confirm('탈퇴하시겠습니까?')){
		alert('들어올땐 마음대로 들어왔지만\n함부로 나갈 수없습니다^^');	
	}else{
		alert('좋은생각입니다!');
	}
	
}
</script>


</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="../include/menu.jsp"%>


	<div style="width: 80%" class="container">
		<h1 align="center">회원정보</h1>
		<div class="form-group" align="center">
			<input type="text" class="form-control input-lg"
				value="회원 이메일  ${member.email}" readonly="readonly"> <input
				type="text" class="form-control input-lg"
				value="회원 이름  ${member.username}" readonly="readonly"> <input
				type="text" class="form-control input-lg"
				value="보유 코인  ${member.coin}" readonly="readonly"> <input
				type="text" class="form-control input-lg"
				value="휴대폰   ${member.phone}" readonly="readonly">
		</div>
		<input class="btn btn-primary" type="button"
			id="informationUpdate_btn" value="비밀 번호 변경">
		<button type="button" class="btn btn-warning" data-toggle="modal"
			data-target="#exampleModal" data-whatever="@mdo">∑ 구매목록</button>
		<button id="favorite" type="button" class="btn btn-success" data-toggle="modal"
			data-target="#myfavorite" data-whatever="@mdo" onclick="listup()">★ 	관심상품</button>
		<button  type="button" class="btn btn-danger" onclick="bye()">-_-+ 회원탈퇴</button>	
	</div>




	<!-- 나의구매리스트 -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">My List</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">구매목록</label>
						<hr />
						<div class="row">
							<c:forEach var="list" items="${myList}">

								<div class="col-sm-3">${list.title}</div>
								<div class="col-sm-2">${list.no}화</div>
								<div class="col-sm-2">${list.coin}코인</div>
								<div class="col-sm-3">${list.buy_date}</div>
								<div class="col-sm-2">
									<button class="btn btn-primary"
										onclick="location.href='${path}/series/webtoon_list.do?title=${list.title}&no=${list.no}'">보러가기</button>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>



	<!-- 나의 관심상품 -->
	<div class="modal fade" id="myfavorite" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">My Favorite
						Webtoon</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">관심상품 목록</label>
						<hr />
						<div class="row" id="favoritetarget">
							
						</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>







	<%@include file="../include/footer.jsp"%>
</body>
</html>