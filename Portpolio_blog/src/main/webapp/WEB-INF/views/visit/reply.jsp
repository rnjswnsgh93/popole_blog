<%@page import="com.study.springboot.dto.VisitDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%VisitDto visit_dto=(VisitDto)session.getAttribute("visit_dto"); %>
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
  width: 1200px;
  margin: 0 auto;
  min-height:1500px ;
}
.visit_wirte{
  margin-top:20px ;
  width: 850px;
  height: 220px;
  background-color: #f5f4f3;
}
.visit_submit{
  width: 90px;
  height: 30px;
  margin-left: 760px;
  
  
}
input[type=text]{
  border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
  margin-top: 20px;
  margin-bottom: 10px;
  margin-right: 5px;
  background-color: rgb(240,236,235);
  font: bold;
}
.reply_list{
  width: 850px;
  border: 0.5px solid #e7e5e2;
}
p:nth-child(3){
  margin: 0;
}
.reply_body{
  width: 900px;
  display: inline;
  float: left;
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
    <br><br>

    <div class="reply_body">
    <div class="reply_list">
      <p style="background-color: #858483;"> ${visit_dto.id}  ${visit_dto.reg}</p>
      <p>${visit_dto.content}</p>
    </div><br><br>
    <p>답글작성</p><hr>
    <div class="visit_wirte">
    <form action="replyAction" method="POST">
    	<input type="hidden" name="group" value="${visit_dto.no}" >
    	<input type="hidden" name="category" value="댓글" >
        <input type="text" name="id" placeholder="닉네임"><input type="text" name="password" placeholder="비밀번호"><br>
       <textarea style="resize: none; border: 0.5px solid #858483;" name="content" cols="100" rows="5"></textarea><br>
       <input type="submit"  value="작성" class="visit_submit btn-secondary" >
      </div>
    </form>
  </div>
    <div class="aside">
      <div class="catagory">
      <p><b>카테고리</b></p>
      <a href="/daily" class="aside_a"><p>>일상</p></a>
      <a href="/taste" class="aside_a"><p>>맛집</p></a>
      <a href="/visit" class="aside_a"><p>>방명록</p></a>
    </div>
    <br><br><br><br>
    <div class="list">
      <p>최신글</p>
      <a href="" class="aside_a"><p>> ~~~~~~~~</p></a>
      <a href="" class="aside_a"><p>> ~~~~~~~~</p></a>
      <a href="" class="aside_a"><p>> ~~~~~~~~</p></a>
      <a href="" class="aside_a"><p>> ~~~~~~~~</p></a>
      <a href="" class="aside_a"><p>> ~~~~~~~~</p></a>
    </div><br><br>
    <div class="aside_ad">
      <img src="http://placehold.it/300x100">
      <img src="http://placehold.it/300x100">
      <img src="http://placehold.it/300x100">
      <img src="http://placehold.it/300x100">
    </div>
    </div>

  </div>
    <footer>

    </footer>
  
</body>
</html>