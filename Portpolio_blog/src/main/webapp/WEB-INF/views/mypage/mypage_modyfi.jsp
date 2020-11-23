<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="com.study.springboot.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%MemberDto dto =(MemberDto)session.getAttribute("dto");%>
    <%String mail=dto.getMail(); 
          int idx = mail.indexOf("@"); 
          String mail1 = mail.substring(0, idx);
          String mail2 = mail.substring(idx+1);
          %>
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
  height: 680px;
  margin-right: 100px;
  vertical-align: 100%;
}
input{
 border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
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
    <p><a href="/">home</a>><a href="/mypage_home">마이페이지</a> >회원정보 수정</p>
    <br><br>
      <div class="mypage_list">
       <div class="member">
        <a class="mypage_a" href="mypage_home" ><p>내 정보</p></a><br>
        <a class="mypage_a" href="mypage_modyfi?id=${dto.id}" ><p>회원정보 변경</p></a><br>
        <a class="mypage_a" href="mypage_writelist?pagenum=1&pagelast=10" ><p>작성한 글목록</p></a><br>
        <a class="mypage_a" href="mypage_delete" ><p>회원 탈퇴</p></a>
      </div>
      </div>

      <div class="content">
        <p><b>회원정보수정</b></p>
        <form method="post" action="MemberModyfi?id=${dto.id}" 
        name="userInfo" onsubmit="return checkValue()" class="joinAction">
        <br><br>
          <div>
            <h6 class="join_text">기존 비밀번호<h6>
            <span><input type="password" name="old_password" size="30"></span>
          </div><br>
          <div>
            <h6 class="join_text">새로운 비밀번호<h6>
            <span><input type="password" name="new_password" size="30"></span>
          </div><br>
          <div>
            <h6 class="join_text">비밀번호 확인<h6>
            <span><input type="password" name="passwordcheck" size="30"></span>
          </div><br>
          <div>
            <h6 class="join_text">이름<h6>
            <span><input type="text" name="name" size="30" value="${dto.name}"></span>
          </div><br>
          <div>
            <h6 class="join_text">생년월일<h6>
            <span>${dto.birth}</span>
                       
          </div><br>
          <div>
            <h6 class="join_text">이메일<h6>
            <span><input type="text" name="mail1" maxlength="50" value="<%=mail1%>">@
              <select name="mail2" value="<%=mail2%>">
                <option>naver.com</option>
                <option>daum.net</option>
                <option>gmail.com</option>
                <option>nate.com</option>						
              </select></span>
          </div><br>
          <div><br>
            <span><input type="submit" value="회원정보 수정" class="bt btn btn-secondary">
            <input type="button" value="취소" onclick="goFirstForm()" class="bt btn btn-secondary"></span>
          </div>
       
         
        </form>
      
      
      </div>

  </div>
  <footer>
  </footer>
  
  
</body>
</html>