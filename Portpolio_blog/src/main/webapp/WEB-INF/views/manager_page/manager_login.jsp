<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  border: 0.2px solid #e7e5e2;
  margin: 0 auto;
  width: 600px;
  height: 300px;
  text-align: center;
 
}
.main{
  width: 1500px;
  margin: 0 auto;
}
form h2{
  background-color:#e7e5e2;
  color: #5e5e5e;
}

</style>
</head>
<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
    <jsp:include page="manager_navi.jsp" />
    <br><br><br><br><br><br>
      <div class="main">
          <div class="form">
            <img src="../images/manager_login.jpg" style="width: 400px;height: 300px; display: inline; float: left;">
            <form action="manager_loginAction" class="loginForm">
              <h2>관리자 로그인</h2><br>
                <input type="text" name="id" size="30" placeholder="아이디를 입력하세요"><br><br>
                <input type="password" name="password" size="30" placeholder="비밀번호를 입력하세요">
              <div><br>
                <span><input type="submit" value="로그인" class="bt btn btn-secondary"></span>
              </div>
            </form>
          </div>
          </div>
     </div>
  
  </div>
  <footer>
  </footer>
  
  
</body>
</html>