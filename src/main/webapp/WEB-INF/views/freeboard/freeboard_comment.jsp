<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="row" varStatus="i">
 <div class="alert alert-info"> 
<div class="form-group">
  <span class="label label-info">작성자</span>${row.username}(${row.email})<span class="label label-warning">날짜</span>${row.write_date}<br>
 
  <c:if test="${member.email==row.email}"> <span style="float:  right">
<button class="btn btn-danger" onclick="del(${row.idx})">삭제</button>
  </span>
  </c:if>
<div class="form-group">
				<div class="" style="width: 100%">
				${row.content}
				</div> 
				
			</div>	
</div>


<button class="btn btn-primary" id="replybtn${i.count}" 
 onclick="reply(${row.idx},'div${i.count}','replybtn${i.count}')"> 답글 <span class="badge">${row.replyCount}</span> </button>

<div id="div${i.count}"></div>
</div>

</c:forEach>

