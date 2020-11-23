<%@page import="com.study.springboot.dto.ManagerDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%ArrayList<ManagerDto> mypagelist=(ArrayList<ManagerDto>)session.getAttribute("mypagelist");
  	 int mypagelist_count=(int)session.getAttribute("mypagelist_count");  %>
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
  width: 1300px;
  margin: 0 auto;
  min-height:1500px ;
}

.member{
  margin-top: 80px; 
}
p{
  margin: 0;
}
.mypage_list{
  display: inline;
  float: left;
  width: 300px;
  height: 300px;

border: 1px solid  #e7e5e2; text-align: center;
}
.content{
  
  display: inline;
  float: right;
  width: 800px;
  height: 300px;
  margin-right: 100px;
  vertical-align: 100%;
  text-align: center;
}
input{
 border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
}

table{

  border-color: #e7e5e2;
}
tr:first-child{
background-color:#eaebdd;
}
tr:nth-child(2n){
  background-color: #f5f5f5;
}
.ac{
background-color: #d8ecff;
}

</style>
</head>
<header></header>
<body>
  <div id="wrap_global">
    <br><br><br>
    <jsp:include page="../navi.jsp" />
    <br><br>
    <jsp:include page="../top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>><a href="/mypage_home">마이페이지</a>> 작성한 글 목록</p>
    <br><br>
      <div class="mypage_list">
       <div class="member">
        <a class="mypage_a" href="mypage_home" ><p>내 정보</p></a><br>
        <a class="mypage_a" href="mypage_modyfi?id=<%=session.getAttribute("sessionID")%>" ><p>회원정보 변경</p></a><br>
        <a class="mypage_a" href="mypage_writelist?pagenum=1&pagelast=10" ><p>작성한 글목록</p></a><br>
        <a class="mypage_a" href="mypage_delete" ><p>회원 탈퇴</p></a>
      </div>
      </div>
      <div class="content">
      <p style="text-align: left;"><b>게시글 갯수(<%=mypagelist_count %>)</b></p>
        <table>
          <tr>
            <td style="width: 200px; height: 30px;">카테고리</td>
            <td style="width: 300px;" >제목</td>
            <td style="width: 300px;" >작성 날짜</td>
          </tr>
          <c:forEach var="dto" items="${ mypagelist }">
          <tr>
            <td style="height: 30px;">${dto.category}</td>
            <td><a href="${dto.category}_view?no=${dto.no}">${dto.title}</a></td>
            <td>${dto.reg}</td>
          </tr>
          </c:forEach>
        </table>
   
      </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
     <div style="text-align: center; margin-left: 300px;">
    <%for(int i=1;i<=mypagelist_count;i+=10){
   if(Integer.valueOf(request.getParameter("pagenum")) == i){%>
    <label><a class="page-link ac" href="mypage_writelist?pagenum=<%=i%>&pagelast=<%=i+9%>"><%= (i/10)+1 %></a></label>
    <%} else{%>
      <label><a class="page-link" href="mypage_writelist?pagenum=<%=i%>&pagelast=<%=i+9%>"><%= (i/10)+1 %></a></label>
      <%} %>
      <%} %>
      </div>
  </div>
  <footer>
  </footer>
  
  
</body>
</html>