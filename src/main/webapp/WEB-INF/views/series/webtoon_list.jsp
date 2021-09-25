<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>짭툰</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1.0">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<script type="text/javascript">
var next=1;
</script>

<script type="text/javascript">
$(document).ready(function() {
   $("#morebtn").css('visibility','hidden');
$("#more").click(function() {
more(1);
$("#more").attr('disabled',true);
})
})
</script>

<script type="text/javascript">
$(document).ready(function() {
   $("#insertComment").click(function() {
      if(${sessionScope.member==null}){
         alert("로그인 후 이용해주세요");
         location.href="${path}/member/login";
         return;
      }
      var title='${webtoon[0].title}';
      var no =${webtoon[0].no};
      var content=$("#content").val();
      var param= "title="+title+"&no="+no+"&content="+content;
        var url = "${path}/webtoon_comment/insert.do";
      $.ajax({
         type: "post",
         url: url,
         data: param,
      success : function() {
         $("#content").val("");
      next =1;
   $("#tar").html("");
         more(1);
      }
      });
   })
})
</script>

<script type="text/javascript">
function more(nextPage) {
   var curPage=parseInt(nextPage);
   var title='${webtoon[0].title}';
   var no =${webtoon[0].no};
   var curPage = next;
   var url = "${path}/webtoon_comment/list.do?"+"title="+title+"&no="+no+"&curPage="+curPage;

   $.ajax({
      type: "post",
      contentType:"application/json",
      url: url,
      success : function(data) {
         
         $("#tar").append(data);
         if(next==1){
            $("#morebtn").css('visibility','visible');
         }
         next++;
         totPage();
         if(next>$("#totPage").val()){
            $("#morebtn").css('visibility','hidden');
         };
      }
   })
}
</script>
<script type="text/javascript">
function del(idx) {
   if(confirm('삭제 하시겠습니까?')){
      idx= parseInt(idx);
      var url = "${path}/webtoon_comment/delete.do";
      param="idx="+idx;      
      $.ajax({
         type: "post",
         url: url,
         data: param,
         success: function() {
            next =1;
            $("#tar").html("");
                  more(1);
         }
      })
   }
}
</script>

<script type="text/javascript">
function totPage() {
   var title='${webtoon[0].title}';
   var no =${webtoon[0].no};
   var curPage = next;
   var url = "${path}/webtoon_comment/totPage.do?"+"title="+title+"&no="+no;
   
   $.ajax({
      type: "post",
      url: url,
      success : function(data) {
      var totPage = parseInt(data);
      $("#totPage").val(totPage);
      }
   })
}
</script>

<script type="text/javascript">

function like(idx) {
   var m_idx = 0;
   if(${sessionScope.member==null}){
      alert("로그인 후 이용해주세요");
      location.href="${path}/member/login";
      return false;
   }else{
      m_idx = $("#m_idx").val();
   }
   var c_idx = parseInt(idx);
   var url = "${path}/webtoon_comment_like/like.do";
   param="c_idx="+idx+"&m_idx="+m_idx;   
   
   $.ajax({
      type: "post",
      url: url,
      data: param,
      success : function(data) {
         if(data==1){
            alert('좋아요');
         }else if(data==2){
            alert('좋아요 취소');
         }else {
            alert('오류');
         }
         next =1;
         $("#tar").html("");
               more(1);
      }
   });
}
</script>

<script type="text/javascript">

function hate(idx) {
   var m_idx = 0;
   if(${sessionScope.member==null}){
      alert("로그인 후 이용해주세요");
      location.href="${path}/member/login";
      return false;
   }else{
      m_idx = $("#m_idx").val();
   }
   var c_idx = parseInt(idx);
   
   var url = "${path}/webtoon_comment_hate/hate.do";
   param="c_idx="+idx+"&m_idx="+m_idx;   
   
   $.ajax({
      type: "post",
      url: url,
      data: param,
      success : function(data) {
         if(data==1){
            alert('싫어요');
         }else if(data==2){
            alert('싫어요 취소');
         }else {
            alert('오류');
         }
         next =1;
         $("#tar").html("");
               more(1);
      }
   });
}
</script>

<!-- 댓글 style -->
<style type="text/css">
.container {margin-top: 60px;}
.comments ul ul {margin-left: 60px;}
.comments .comment img {margin-right: 20px;}
.comments .comment {padding: 6px;}
.comments .comment:hover {background: #eee;}
</style>



<!-- 요일버튼 이벤트 -->
<script type="text/javascript">
   $(document).ready(function() {

      $("#sun").click(function() {
         location.href = "${path}/series/weekly.do?week=Sun";
      });
      $("#mon").click(function() {
         location.href = "${path}/series/weekly.do?week=Mon";
      });
      $("#tue").click(function() {
         location.href = "${path}/series/weekly.do?week=Tue";
      });
      $("#wed").click(function() {
         location.href = "${path}/series/weekly.do?week=Wed";
      });
      $("#thu").click(function() {
         location.href = "${path}/series/weekly.do?week=Thu";
      });
      $("#fri").click(function() {
         location.href = "${path}/series/weekly.do?week=Fri";
      });
      $("#sat").click(function() {
         location.href = "${path}/series/weekly.do?week=Sat";
      });

   });
</script>

<script>
function star(별){
   var star=parseInt (별);
   location.href="${path}/series/star?title=${title}&no=${no}&idx=${sessionScope.member.idx}&star="+star;
}
</script>

<script type="text/javascript">
var op = true;
$(document).click(function() {
   if(op==true){
      $("#naviTop").css('visibility','visible');
      $("#naviFoot").css('visibility','visible');
      op =false;
   }else{
      $("#naviTop").css('visibility','hidden');
      $("#naviFoot").css('visibility','hidden');
      op= true;
   }
   
   
})
</script>

</head>

<body>
   <!-- 헤더,네비  -->
   <%@ include file="../include/top.jsp"%>
   <%@ include file="../include/Webtoonmenu.jsp"%>

   <!--    리모콘 탑 -->
   <nav class="navbar navbar-inverse navbar-fixed-top" id="naviTop"
      style="visibility: hidden;">
      <div class="container-fluid">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
            <a class="navbar-brand" href="${path}/" style="color: red">FakeToon</a>
            <a class="navbar-brand"
               href="${path}/series/series_list.do?title=${title}">${title}</a> <a
               class="navbar-brand">${no}화</a>
         </div>
      </div>
      <!-- /.container-fluid -->
   </nav>
   <!-- 리모콘 탑 -->
   <!-- 리모콘 foot -->
   <nav class="navbar navbar-inverse navbar-fixed-bottom"
      style="visibility: hidden;" id="naviFoot">
      <div class="container-fluid" align="center">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="row">
            <c:if test="${page.curPage > 1}">
               <a
                  href="${path}/series/webtoon_list.do?title=${title}&no=${page.prevPage}"
                  class="navbar-brand col-xs-1" style="width: 10%"
                  aria-label="Previous">&laquo;</a>
            </c:if>

            <a class="navbar-brand col-xs-10" style="width: 80%">${page.curPage}화</a>
            <c:if test="${page.curPage < page.totPage}">
               <a
                  href="${path}/series/webtoon_list.do?title=${title}&no=${page.nextPage}"
                  class="navbar-brand col-xs-1" style="width: 10%" aria-label="Next">&raquo;</a>
            </c:if>
         </div>
      </div>
      <!-- /.container-fluid -->
   </nav>
   <!-- 리모콘 foot -->


   <c:if test="${sessionScope.member!=null}">
      <div class="dropdown">
         <button id="dLabel" type="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            별점 주기 <span class="caret"></span>
         </button>
         <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
            <li onclick="star('10')"><span class="glyphicon glyphicon-star"></span>
               <span class="glyphicon glyphicon-star"></span> <span
               class="glyphicon glyphicon-star"></span> <span
               class="glyphicon glyphicon-star"></span> <span
               class="glyphicon glyphicon-star"></span></li>
            <li onclick="star('8')"><span class="glyphicon glyphicon-star"></span><span
               class="glyphicon glyphicon-star"></span><span
               class="glyphicon glyphicon-star"></span><span
               class="glyphicon glyphicon-star"></span></li>
            <li onclick="star('6')"><span class="glyphicon glyphicon-star"></span><span
               class="glyphicon glyphicon-star"></span><span
               class="glyphicon glyphicon-star"></span></li>
            <li onclick="star('4')"><span class="glyphicon glyphicon-star"><span
                  class="glyphicon glyphicon-star"></span></span></li>
            <li onclick="star('2')"><span class="glyphicon glyphicon-star"></span></li>
         </ul>
      </div>
   </c:if>


   <!-- 별점체크햇는지 체크메세지 -->
   <c:if test="${check!=null }">
      <div class="panel panel-default">${check}</div>
   </c:if>



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



   <!-- 웹툰 -->
   <div class="media">
      <c:forEach var="toon" items="${webtoon}">
         <div class="media-center" align="center">
            <img class="img-responsive"
               src="../webtoons/${toon.title}/${toon.no}/${toon.image}.jpg"
               alt="${toon.title}만화${toon.no}화${toon.image}번">
         </div>
      </c:forEach>
   </div>
   <!-- 웹툰 -->
   
   <!-- 댓글 -->
   <div class="container">
     <div class="row">
       <div class="col-md-12">
         <div class="panel panel-info">
           <div class="panel-heading">
                댓글
           </div>
           <div class="panel-body comments">
             <textarea class="form-control" id="content" name="content" rows="5"></textarea>
             <br>
             <button type="button" class="btn btn-info pull-right" id="insertComment">댓글등록</button>
             <div class="clearfix"></div>
             <hr>
             <button id="more" class="btn btn-info" style="width: 100%">댓글보기</button>
             <hr>
         <div>
            <div id="tar"></div>
               <div id="morebtn" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                  <button class="btn btn-info" style="width: 100%" onclick="more('next')">더보기</button>
               </div>
         </div>


           </div>
         </div>
       </div>
     </div>
   </div>
   <!-- 댓글 -->


   <!-- 풋터 -->
   <%@include file="../include/footer.jsp"%>



   <input type="hidden" id="totPage" value="${totPage}">
   <input type="hidden" id="m_idx" value="${member.idx}">
</body>
</html>