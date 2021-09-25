<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="row" varStatus="i">
 <div class="alert alert-warning"> 
<div class="form-group">
  <span class="label label-info">작성자</span>${row.username}(${row.email})<span class="label label-warning">날짜</span>${row.write_date}<br>
 
  <c:if test="${member.email==row.email}"> <span style="float:  right">
<button class="btn btn-danger" onclick="replydel(${row.idx})">삭제</button>
  </span>
  </c:if>
<div class="form-group">
				<div class="" style="width: 100%">
				${row.content}
				</div> 
				
			</div>	
</div>
</div>

</c:forEach>
    
	<div>
		<textarea class="alert alert-warning" style="width: 80%; float: left"
			name="content" id="reply${fc_idx}"></textarea>
		<button  class="btn btn-danger" style="width: 20%" onclick="replyInsert('${fc_idx}','reply${fc_idx}')">
			<br>답글등록<br> <br>
		</button>
	</div>