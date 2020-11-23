<%@page import="com.study.springboot.dto.TasteDto"%>
<%@page import="com.study.springboot.dto.DailyDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ArrayList<DailyDto> daily_list=(ArrayList<DailyDto>)session.getAttribute("daily_list"); %>
<% ArrayList<TasteDto> taste_list=(ArrayList<TasteDto>)session.getAttribute("taste_list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="css/jquery.bxslider.css">
    <link rel="stylesheet" href="css/header_nav_footer.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
    
  <style>
     .wrap_global{
                width: 1024px;
                margin: 0 auto;
            }
      .card{
        display: inline-block;
       
        margin:0 auto;
      }
      .form-inline my-2 my-lg-0{
        float: right;
      }
  
    .session{
      text-align: center;
      margin: 0 auto;
    }
    .slider_img{
      width: 100%;height: 400px;
    }
    .mainlogo{
      width: 100%;
      height: 500px;
      text-align: center;
      line-height: 500px;
      position: relative;
      z-index: 1;
     
    }
    .mainlogo::after{
      width: 100%;
      height: 500px;
      content: "";
      background-image: url('images/kitten-1.jpeg');
      background-size:100% 500px;
      background-repeat: no-repeat;
      position: absolute;
      top: 0;
      left: 0;
      z-index: -1;
      opacity: 0.5;

    }

  </style>
</head>
<body>
<header></header>
      <div class="mainlogo">
    <a class="nav_a_logo" href="/"><label> Day&day</label></a>
     </div>
     <hr>
     <div class="wrap_global">
     <div id="navi">
          <a class="nav_a" href="/daily?pagenum=1&pagelast=5">일상</a>
          <a class="nav_a" href="/taste?pagenum=1&pagelast=5">맛집</a>
          <a class="nav_a" href="/visit">방명록</a>
          <%if(session.getAttribute("sessionID") ==null) {%>
          <a class="nav_a" href="/login">로그인</a>
          <%} %>
          <%if(session.getAttribute("sessionID") !=null){%>
          <a class="nav_a" href="/account?pagenum=1&pagelast=10">가계부</a>
          <a class="nav_a" href="/mypage_home">마이페이지</a>
          <a class="nav_a" href="/logout">로그아웃</a>
 <%} %>
    <form class="form-inline my-2 my-lg-0" style="display: inline;"action="search_view" method="get">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search"">
      <input type="hidden" name="pagenum" value="1">
      <input type="hidden" name="pagelast" value="12">
      <button class="btn btn-outline-secondary" type="submit">Search</button>
    </form>
  </div>
    </div>
  <hr>
  <br><br>
  <div class="session">
  <p><b>일상 최신글</b><a href="/daily?pagenum=1&pagelast=5" style="margin-left:800px;">more</a></p><br><br>
    
    <c:forEach var="dto" items="${ daily_list }" end="2">
    <div class="card" style="width: 18rem;">
    <a href="daily_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="upload/${dto.filename}" class="card-img-top" alt="200x200"></a>
   <div class="card-body">
    <p class="card-text">${dto.title}</p>
    </div>
    </div>
    </c:forEach>
    <br><br>
    <hr>
    <p><b>맛집 최신글</b><a href="/taste?pagenum=1&pagelast=5" style="margin-left:800px;">more</a></p><br><br>
    <c:forEach var="dto" items="${ taste_list }" end="2">
    <div class="card" style="width: 18rem;">
    <a href="taste_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="upload/${dto.filename}" class="card-img-top" alt="200x200"></a>
   <div class="card-body">
    <p class="card-text">${dto.title}</p>
    </div>
    </div>
    </c:forEach>
  </div>

</div>
<footer>
  <a href="manager_login">
   <p style="color: white; text-align: center;"> 관리자 모드</p></a>
</footer>
  </body>
</html>