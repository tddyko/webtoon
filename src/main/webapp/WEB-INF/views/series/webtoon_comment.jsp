<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach items="${list}" var="row" varStatus="i">
          <ul class="media-list">
            <li class="media">
              <div class="comment">
                <div class="from-group media-body">
                   <span class="label label-info">작성자</span><strong class="text-success">${row.username}(${row.email})</strong>
                   <span class="label label-warning">날짜</span><fmt:formatDate value="${row.write_date}" pattern="yyyy/MM/dd" />
               <span class="label label-warning">시간</span><fmt:formatDate value="${row.write_date}" type="time" />
               <button class="glyphicon glyphicon-thumbs-up btn btn-primary" onclick="like(${row.idx})"> ${row.heart}</button>
                 <button class="glyphicon glyphicon-thumbs-down btn btn-danger" onclick="hate(${row.idx})"> ${row.hate}</button>
                <hr>
                 <c:if test="${member.email==row.email}">
               <span class="text-muted pull-right">
                   <button class="btn btn-danger btn-xs fa fa-times" onclick="del(${row.idx})">삭제</button>
                </span>
                 </c:if>         
                 <div class="form-group">
                  <div class="" style="width: 100%">
                     ${row.content}
                  </div> 
               </div>   
                </div>
                <div class="clearfix"></div>
              </div>
            </li>
          </ul>
</c:forEach>