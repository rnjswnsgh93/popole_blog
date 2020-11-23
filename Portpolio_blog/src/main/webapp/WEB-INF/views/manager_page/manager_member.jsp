<%@page import="com.study.springboot.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%ArrayList<MemberDto> member_list=(ArrayList<MemberDto>)session.getAttribute("member_list");
    int count_member=(int)session.getAttribute("count_member");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery.bxslider.css">
  <link rel="stylesheet" href="../css/header_nav_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<style>
 /* 전체 wrap */
#wrap_global{
  width: 1024px;
  margin: 0 auto;
  min-height:1000px ;
}
.loginForm{
  border: 0.5px solid #e7e5e2;
  margin: 0 auto;
  width: 600px;
  height: 300px;
  text-align: center;
 
}
.mypage_list{
  display: inline;
  float: left;
  width: 200px;
  height: 300px;
  font-family: 'Nanum Pen Script', cursive;
  font-size: 30px;
  margin-right: 0;
  padding: 0;
  

border: 1px solid  #e7e5e2; text-align: center;
}
.content{
  border: 1px solid  #e7e5e2;
  display: inline;
  float: right;
  width: 700px;
  min-height: 300px;
  margin-right: 200px;
  margin-left: 0;
  padding: 0;
  vertical-align: 100%;
  font-family: 'Nanum Gothic', sans-serif;
  text-align: center;
  
}
.member{
  margin-top: 10px; 
}
input{
  border: 1px solid #e7e5e2;
  margin-left: 50px;
}
.file{
  background-color: #e9edfc;
}
input[type=button]{
  border: none;
  margin: 0 auto;
}
td{
  border-bottom: 2px solid #e9edfc;
}
tr:nth-child(2n){
  background-color: #f5f5f5;
}.ac{
background-color: #d8ecff;

}


</style>
</head>
<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
    <jsp:include page="manager_navi.jsp" />
    <br><br>
      <p><a href="manager_member">관리자 페이지</a>> 회원관리</p> 
      <br><br><br><br>
      <div class="main" style="width: 1200px;">
      <div class="mypage_list">
        <div class="member">
          <ul>
         <a href="manager_member?pagenum=1&pagelast=10" ><li>회원 관리</li></a>
        <a href="manager_baner" ><li>배너 관리</li></a>
        <a href="manager_writelist?pagenum=1&pagelast=10" ><li>게시글 관리</li></a>
          </ul>
       </div>
       </div>
 
       <div class="content">
        <table>
          <tr style="background-color: #e7e5e2;">
            <td style="width: 100px;">아이디</td>
            <td style="width: 100px;">닉네임</td>
            <td style="width: 200px;">생년월일</td>
            <td style="width: 200px;">가입 날짜</td>
            <td style="width: 100px;">삭제</td>
          </tr>
          <c:forEach var="dto" items="${member_list}">
          <tr>
            <td>${dto.id }</td>
            <td>${dto.name }</td>
            <td>${dto.birth }</td>
            <td>${dto.reg }</td>
            <td>
            <form action="manager_delete?id=${dto.id}" method="post">
              <input type="submit" value="삭제" >
            </form>
            </td>       
          </tr>
         </c:forEach>
        </table>
     </div>
     <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div style="text-align: center;">
    <%for(int i=1;i<=count_member;i+=10){
   if(Integer.valueOf(request.getParameter("pagenum")) == i){%>
    <label><a class="page-link ac" href="manager_member?pagenum=<%=i%>&pagelast=<%=i+9%>"><%= (i/10)+1 %></a></label>
    <%} else{%>
      <label><a class="page-link" href="manager_member?pagenum=<%=i%>&pagelast=<%=i+9%>"><%= (i/10)+1 %></a></label>
      <%} %>
      <%} %>
	</div>
    </div>
  </div>

  <footer>
  </footer>
  
  
</body>
</html>