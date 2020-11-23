<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="css/header_nav_footer.css">
</head>
<body>
<div id="navi">
 <a class="nav_a_logo" href="/"><label> Day&day</label></a><br>
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
    <form class="form-inline my-2 my-lg-0" style="display: inline;" action="search_view" method="get">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
      <input type="hidden" name="pagenum" value="1">
      <input type="hidden" name="pagelast" value="12">
      <button class="btn btn-outline-secondary" type="submit">Search</button>
    </form>
  </div>
</body>
</html>