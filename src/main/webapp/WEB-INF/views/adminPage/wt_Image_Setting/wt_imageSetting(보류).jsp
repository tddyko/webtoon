<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<c:if test"${wt_image }"></c:if>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</form>
			</div>

		</div>
	</div>
</div>