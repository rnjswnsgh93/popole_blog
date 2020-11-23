<%@page import="com.study.springboot.dto.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%AccountDto account_dto=(AccountDto)session.getAttribute("account_dto"); %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery.bxslider.css">
  <link rel="stylesheet" href="css/header_nav_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<script src = "${path}/ckeditor/ckeditor.js"></script>
<style>
 /* 전체 wrap */
#wrap_global{
  width: 1400px;
  margin: 0 auto;
  min-height:1500px ;
}
.writeForm{
 
  border: 0.5px solid #e7e5e2;
}
.write_body{
  display: inline;
  float: left;
  width: 920px;
  margin: 0;
  position: relative;
  }
.listbtn{
margin-left: 800px;position: absolute; bottom: 0px;"}
</style>
<script>
  function checkValue()
		{
      if (confirm("글 수정을 하시겠습니까?") == true){    //확인
      document.write_taste.submit();
        }else{   //취소
        return;	
		}
    }
</script>


</head>

<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
   	<jsp:include page="../navi.jsp" />
    <br><br>
    <jsp:include page="../top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>><a href="account">가계부</a>>가계부 쓰기</p>
    <br><br>

    <div class="write_body">
    <form class="formsize" action="account_modyfiAction?no=<%=account_dto.getNo() %>" method="post" name="write_taste">
      <table class="writeForm">
        <tr>
          <td class="writeForm">작성할날짜</td>
          <td><input type="date" name="datea" size="50" value="<%=account_dto.getContentdate()%>"></td>
        </tr>
        <tr>
          <td class="writeForm">작성자</td>
          <td><%=account_dto.getId() %></td>
        </tr>
        <tr>
          <td class="writeForm">지출액</td>
          <td><input type="text" name="account" value="<%=account_dto.getAccount()%>"></td>
        </tr>
      </table> 
      <textarea name="content" id="content" cols="100" rows="30"  style="resize: none;"><%=account_dto.getContent()%></textarea>
     <script>CKEDITOR.replace('content',{
				
      	      	height : '800px',filebrowserUploadUrl:'/mine/imageUpload.do'});</script> 
      <input type="button" value="글 수정" class="btn-secondary" onclick="checkValue()"style="margin-left: 730px;"> 
    </form>
    <a href="/account"><button class="btn-secondary listbtn" >글 목록</button></a>    
  	</div>
 
 <jsp:include page="../aside.jsp"></jsp:include>
</div>
  <footer>
  </footer>
  
</body>
</html>