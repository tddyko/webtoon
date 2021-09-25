<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../include/header.jsp"%>
<c:if test="${message != null}">
   <script type="text/javascript">
      alert("인증번호가 일치하지 않습니다.")
   </script>
</c:if>

<script type="text/javascript">
   $(document).ready(function() {
      $("#idCheck").click(function() {
            if($("#certification").val().length != 8){
               alert("인증번호는 8자리 입니다!");
               return false;
            }
         document.form1.action = "${path}/member/changepw";
         document.form1.submit();
      })
   })
</script>
<script type="text/javascript">
var time = 300;
</script>
<script>
$(document).ready(function() {
   setInterval("changeTime()", 1000);
//     setTimeout("changeTime()",1000);
});
function changeTime() {
//    var arrTime = new Array();
//    arrTime[0] = "2:00";
//    arrTime[1] = "1:00";
//    arrTime[2] = "0:00";
//    for(i=0; i<=arrTime.length; i++){
//       if(arrTime == arrTime[2]){
//          break;
//       }
//    }
time--;
$("#time").html(time);
if(time==0){
   location.href="${path}/member/check";
}
}
</script>
</head>
<body>
   <!-- 헤더,네비  -->
   <%@ include file="../include/top.jsp"%>
   <%@ include file="../include/menu.jsp"%>
   <!-- 로그인 -->

   <div class="container">

      <div class="row" style="margin-top: 60px">
         <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form method="post" role="form" name="form1">
               <fieldset>
                  <h2>비밀번호 변경</h2>
                  <hr class="colorgraph">
                  <div class="form-group">
                     <input type="text" class="form-control input-lg"
                        placeholder="이메일 입력" name="email" id="inputEmail"
                        value="${email}" readonly="readonly">
                  </div>
                  <div class="form-group">
                  <h4>메일로 인증번호를 발송하였습니다 메일을 확인후 인증번호를 입력해주세요</h4>
                     <input type="text" id="certification" class="form-control input-lg"
                        placeholder="인증번호 8자리 입력" name="uuid">
                        <div id="timeCount"><span id="time"></span>초이내에 인증번호를 입력하세요</div>
                  </div>
                  <span class="button-checkbox"> <input type="button"
                     class="btn btn-lg btn-success btn-block" value="인증번호입력"
                     id="idCheck">
                  </span>
               </fieldset>
            </form>
         </div>
      </div>

   </div>
   <!--    여기까지 -->

   <%@include file="../include/footer.jsp"%>


</body>
</html>