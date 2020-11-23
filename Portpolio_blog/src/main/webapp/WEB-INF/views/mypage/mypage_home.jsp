<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="com.study.springboot.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%MemberDto dto =(MemberDto)session.getAttribute("dto");%>
    <%Integer dailycount =(Integer)session.getAttribute("dailycount");%>
    <%Integer tastecount =(Integer)session.getAttribute("tastecount");%>
    <%Integer accountcount =(Integer)session.getAttribute("accountcount");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery.bxslider.css">
  <link rel="stylesheet" href="css/header_nav_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<style>
 /* 전체 wrap */
#wrap_global{
  width: 1024px;
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
  border: 1px solid  #e7e5e2;
  display: inline;
  float: right;
  width: 500px;
  height: 750px;
  margin-right: 100px;
  vertical-align: 100%;
}
.join_text{
  font-weight: bold;
}
.myinfo_modyfi_a{
  text-align: center;
  text-decoration: none;
  font-size: 20px;
  font-weight: bold;
  
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
    <p><a href="/">home</a>><a href="mypage_home">마이페이지</a>>내 정보</a></p>
    <br><br>
      <div class="mypage_list">
       <div class="member">
        <a class="mypage_a" href="mypage_home" ><p>내 정보</p></a><br>
        <a class="mypage_a" href="mypage_modyfi?id=${dto.id}" ><p>회원정보 변경</p></a><br>
        <a class="mypage_a" href="mypage_writelist?pagenum=1&pagelast=10"><p>작성한 글목록</p></a><br>
        <a class="mypage_a" href="mypage_delete" ><p>회원 탈퇴</p></a>
      </div>
      </div>

      <div class="content">
        <p style="text-align: center; font-size: 40px;"><b>회원정보</b></p>
        <br><br>
        	<div>
            <h6 class="join_text">아이디<h6>
            <span><p>${dto.id}</p></span>
          </div><br>
          <div>
          <div>
            <h6 class="join_text">이름<h6>
            <span><p>${dto.name}</p></span>
          </div><br>
          <div>
            <h6 class="join_text">생년월일<h6>
            <span><p>${dto.birth}</p></span>
            </div><br>
            <div>
            <h6 class="join_text">이메일<h6>
            <span><p>${dto.mail}</p></span>
          </div><br>
          <div>
            <h6 class="join_text">일상글<h6>
            <span><p><%=dailycount %>개</p></span>
          </div><br>
          <div>
            <h6 class="join_text">맛집글<h6>
            <span><p><%=tastecount %>개</p></span>
          </div><br>
          <div>
            <h6 class="join_text">가계부<h6>
            <span><p><%=accountcount %>개</p></span>
          </div><br>
          <div class="myinfo_modyfi_a">
            <a href="/mypage_modyfi?id=${dto.id}" style="color:rgba(34, 66, 71, 0.671); ">회원정보 수정</a>
          </div>
      </div>

  </div>
  </div>
  <footer>
  </footer>
  
  
</body>
</html>