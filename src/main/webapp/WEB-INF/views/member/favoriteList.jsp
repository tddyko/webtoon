<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<c:forEach var="favor" items="${favorList}">

								<div class="col-sm-1"></div>
								<div class="col-sm-3">${favor.w_title}</div>
								<div class="col-sm-3">${favor.plus_date}</div>
								<div class="col-sm-5" align="right">
									<button class="btn btn-primary"
										onclick="location.href='/webtoon/series/series_list.do?title=${favor.w_title}'">보러가기</button>
									<button class="btn btn-danger"
										onclick="favoriteDelete(${favor.idx})">삭제</button>
								</div>
							</c:forEach>