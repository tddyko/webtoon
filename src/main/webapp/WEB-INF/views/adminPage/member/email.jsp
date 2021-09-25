<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../adminInclude/header.jsp"%>

<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	$("#sendEmail").click(function() {
		
		document.form1.action="${path}/adminPage/email.do";
		document.form1.submit();
	})
})
</script>
</head>
<body>
	<%@ include file="../adminInclude/top.jsp"%>
	<%@ include file="../adminInclude/menu.jsp"%>
	 <div class="container">

      <div class="row" >
         <div
            class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form method="post" role="form" name="form1">
               <fieldset>
                  <h2>메일발송</h2>
                  <hr class="colorgraph">
                  <div class="form-group">
                 <input type="text" class="form-control input-lg"
                      name="subject" placeholder="제목을 입력해주세요">
                     <input type="text" class="form-control input-lg"
                      name="email" id="inputEmail"
                        value="${email}" readonly="readonly">
                  </div>
                  <div class="form-group">
                    
                        <textarea rows="20" cols="75" name="content" placeholder="내용을 입력해주세요"></textarea>
                      </div>
                   
                  <span class="button-checkbox"> <input type="button"
                     class="btn btn-lg btn-success btn-block" value="발송"
                     id="sendEmail"><a class="btn btn-lg btn-primary btn-block" href="${path}/adminPage/member_list.do">목록</a>
                  </span>
               </fieldset>
            </form>
         </div>
      </div>

   </div>
	<%@ include file="../adminInclude/footer.jsp"%>
</body>
</html>