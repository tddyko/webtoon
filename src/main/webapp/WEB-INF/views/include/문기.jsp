<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- core tag 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 네비 -->

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="${path}">짭툰</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">전체 보기 <span class="sr-only">(current)</span>
				</a></li>
				<li><a href="${path}/series/weekly">연재</a></li>
				<li><a href="#">완결</a></li>
				<li><a href="#">신작</a></li>
				<li><a href="#">top10</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="${path}/freeboard/freeboard_list.do">자유게시판</a></li>
						<li><a href="${path}/freeboard">얼짱</a></li>
						<li><a href="${path}/qnaboard/qnaboard_list.do">Q&A</a></li>
					</ul></li>
			</ul>



			<ul class="nav navbar-nav navbar-right">
				<li class="hidden-xs">
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<span class="label label-info">웹툰찾기</span> <input type="text"
								class="form-control" placeholder="serch">
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</li>
				
				<c:choose>
					<c:when test="${sessionScope.member==null}">
						<li><a href="${path}/member/login">로그인</a></li>
						<li><a href="${path}/member/check">회원가입</a></li>
					</c:when>
					<c:otherwise>					
						<li><a href="${path}/member/information">마이페이지</a></li>
						<li><a href="${path}/member/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
















