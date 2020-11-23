<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
}
.loginForm{
  border: 0.5px solid #e7e5e2;
  margin: 0 auto;
  width: 600px;
  height: 300px;
  text-align: center;
 
}
.main{
  width: 1024px;
  margin: 0 auto;
}
.form{
  display: inline;
  float: right;
  font-family: 'Nanum Gothic', sans-serif;
}
.login_img{
  display: inline-block;
}
.bt{
  width: 300px;
  margin: 1px;
}
input{
 border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
}
form h2{
  background-color:#e7e5e2;
  color: #5e5e5e;
}
</style>
<script type="text/javascript">
	function joinForm(value){
		if(value =="1"){
			location.href="join";}
			}

</script>
</head>

<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
   <jsp:include page="navi.jsp" />
   <br><br>
    <jsp:include page="top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>>로그인</p>
    <br><br>
  </div>
    </div>
    <div class="main">
      <div class="login_img">
        <img src="images/login.png" alt="로그인이미지" style="width: 400px;height: 300px;">
      </div>
        <div class="form">
          <form action="loginAction" class="loginForm">
            <h2>로그인</h2><br>
              <input type="text" name="id" size="30" placeholder="아이디를 입력하세요"><br><br>
              <input type="password" name="password" size="30" placeholder="비밀번호를 입력하세요">
            <div><br>
              <span><input type="submit" value="로그인" class="bt btn btn-secondary"></span>
            </div>
            <div>
              <span><input type="button" value="회원가입" onclick="joinForm(1)" class="bt btn btn-secondary"></span>
            </div><br>
          </form>
        </div>
        </div>
   </div>
   <footer></footer>
</body>
</html>