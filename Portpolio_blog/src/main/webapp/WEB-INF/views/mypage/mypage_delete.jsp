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
  height: 300px;
  margin-right: 100px;
  vertical-align: 100%;
  
}
input{
 border-left-width:0;border-right-width:0;border-top-width:0;border-bottom-width:1;
}

.deletebtn{
  width: 500px; margin-bottom: 5px;
}
</style>
<script>
  function checkValue()
		{
      if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
      document.form.submit();
        }else{   //취소
        return;	
		}
    }
</script>
</head>
<header></header>
<body>
  <div id="wrap_global">
    <br><br><br>
    <jsp:include page="../navi.jsp" />
    <br><br>
   <jsp:include page="../top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>><a href="/mypage_home">마이페이지</a>> 회원 탈퇴</p>
    <br><br>
      <div class="mypage_list">
       <div class="member">
        <a class="mypage_a" href="mypage_home" ><p>내 정보</p></a><br>
        <a class="mypage_a" href="mypage_modyfi?id=<%=session.getAttribute("sessionID") %>" ><p>회원정보 변경</p></a><br>
        <a class="mypage_a" href="mypage_writelist?pagenum=1&pagelast=10" ><p>작성한 글목록</p></a><br>
        <a class="mypage_a" href="mypage_delete" ><p>회원 탈퇴</p></a>
      </div>
      </div>

      <div class="content">
        <h2 style="text-align: center;">회원 탈퇴</h2><br><br>
        <form action="member_delete" name="form" method="post"> 
          <h3><p>비밀번호 입력 <input type="password" name="password"></p></h3>
          <br><br><br>
          <input class="deletebtn btn btn-secondary" type="button"  onclick="checkValue()" value="탈퇴">
          <a href="#"><button onclick="" class="deletebtn btn btn-secondary">취소</button></a>
        </form>
      
      
      </div>

  </div>
  <footer>
  </footer>
  
  
</body>
</html>