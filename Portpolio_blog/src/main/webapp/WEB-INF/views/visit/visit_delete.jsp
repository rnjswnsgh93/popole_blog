<%@page import="com.study.springboot.dto.VisitDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String no=request.getParameter("no");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery.bxslider.css">
  <link rel="stylesheet" href="css/header_nav_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">

<style>
 /* 전체 wrap */
#wrap_global{
  width: 1400px;
  margin: 0 auto;
  min-height:1500px ;
}
.visit_submit{
  width: 90px;
  height: 30px;
  margin-left: 760px;
  
}
input[type=password]{
  margin-top: 20px;
  margin-bottom: 10px;
  margin-right: 5px;
  background-color: rgb(240,236,235);
  font: bold;
}
.visit_delete_body{
display:inline;
float:left;
width: 900px;
}
</style>
</head>

<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
   	<jsp:include page="../navi.jsp" />
   <br><br>
     <jsp:include page="../top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>><a href="/visit">방명록</a>> 댓글</p>
    <br><br><br><br>
    
    <div class="visit_delete_body">
    <p>작성할때 입력한 비밀번호 입력하세요</p><hr>
	<form action="visit_deleteAction?no=<%=no %>" method="post">
	<p>비밀번호 <input type="password" name="password"> </p>
	<input type="submit" value="삭제" >
	</form>
    </div>
    
    <jsp:include page="../aside.jsp" />
    
    
  </div>
 


    <footer>

    </footer>
  
</body>
</html>