<%@page import="com.study.springboot.dto.VisitDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%ArrayList<VisitDto> visit_list=(ArrayList<VisitDto>)session.getAttribute("visit_list"); %>
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
.visit_wirte{
  margin-top:20px ;
  width: 800px;
  height: 250px;
  background-color: #f5f4f3;
}
.visit_submit{
  width: 67px;
  height: 30px;
  margin-left: 660px;
  
  
}
input[type=text]{
  border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
  margin-top: 20px;
  margin-bottom: 10px;
  margin-right: 5px;
  background-color: #f5f4f3;
  font: bold;
}
input[type=password]{
  border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
  margin-top: 20px;
  margin-bottom: 10px;
  margin-right: 5px;
  background-color: #f5f4f3;
  font: bold;
}
.visit_list{
  width: 900px;
  border-top: 0.5px solid #e7e5e2;
 
}
.reply{
  margin-left: 20px;
  border: 0.5px solid #e7e5e2;
}
.visit_body{
 width: 800px; display: inline;
 float: left;

}
.visit_button{
	border: none;
	color:black;
	background-color: none;
	float: right;
	
}
</style>
<script type="text/javascript">
	function delete_visit(data){
		location.href="delete_visit?no="+data;
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
    <br><br><br>

    <div class="visit_body">

    <div class="visit_wirte">
    <form action="visitAction" method="POST">
    	<input type="hidden" name="category" value="방명록">
        <input type="text" name="id" placeholder="닉네임"><input type="password" name="password" placeholder="비밀번호"><br>
       <textarea style="resize: none; border: 0.5px solid #858483;" name="content" cols="100" rows="5"></textarea><br>
       <input type="submit"  value="작성" class="visit_submit btn-secondary" >
      </div>
    </form>
    <br><br><br>
    
    
    <div class="visit_list">
    <c:forEach var="dto" items="${ visit_list }">
      <c:if test="${dto.step eq '0'}"> 
      <p style="background-color: #e7e5e2;"> ${dto.id } ${dto.reg}</p>
      <p>${dto.content }<button class="visit_button" onclick="delete_visit(${dto.no})">삭제하기</button></p>
  
      <form action="reply?no=${dto.no}" method="POST">
        <input type="submit" value="답글달기" style="color: blue; background-color:white; border: none;">
      </form>
      </c:if>
     <c:if test="${dto.step eq '1'}"> 
      <div class="reply">   
      <p style="background-color: #f5f4f3;"> ㄴ ${dto.id }  ${dto.reg}</p>
      <p>${dto.content }<button class="visit_button"onclick="delete_visit(${dto.no})">삭제하기</button></p>
      </div>
      </c:if>
      
      </c:forEach>
      </div>
      </div>
      
     
   <jsp:include page="../aside.jsp" />
    

  </div>
  <div style="clear: left;"></div>
  <footer>

  </footer>  
  
</body>
</html>