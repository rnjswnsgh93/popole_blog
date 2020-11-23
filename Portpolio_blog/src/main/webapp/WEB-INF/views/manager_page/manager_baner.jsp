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
.mypage_list{
  display: inline;
  float: left;
  width: 200px;
  height: 300px;
  font-family: 'Nanum Pen Script', cursive;
  font-size: 30px;
  margin-top: 100px;

border: 1px solid  #e7e5e2; text-align: center;
}
.content{
  
  display: inline;
  float: right;
  width: 600px;
  height: 680px;
  margin-right: 100px;
  
  vertical-align: 100%;
  font-family: 'Nanum Gothic', sans-serif;
  
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


</style>
<script type="text/javascript">
var fileCheck = document.getElementById("filename").value;
if(!fileCheck){
    alert("대표이미지 파일을 선택해주세요.");
    return false;
}

</script>
</head>
<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
    <jsp:include page="manager_navi.jsp" />
    <br><br>
      <p><a href="manager_member">관리자 페이지</a>> 배너관리</p>
      <div class="mypage_list">
        <div class="member">
        <p>관리자 페이지</p><hr>
        <ul>
        <a href="manager_member?pagenum=1&pagelast=10" ><li>회원 관리</li></a>
        <a href="manager_baner" ><li>배너 관리</li></a>
        <a href="manager_writelist?pagenum=1&pagelast=10" ><li>게시글 관리</li></a>
      </ul>
       </div>
       </div>
 
       <div class="content">
        <p><h3>배너관리</h3></p><hr>
        <br>
        <form action="manager_banner" method="POST" enctype="multipart/form-data">
        <p><b>사이드 광고 관리</b></p>
        
         <p>이미지 1<input type="file" name="file1" class="file"  id="filename"><small>[가로300x세로100]</small></p>
         <p>-연결 페이지<input type="text" name="file1_link" class="link_page" ></p>
         <p>이미지 2<input type="file" name="file2" class="file"  id="filename"><small>[가로300x세로100]</small></p>
          <p>-연결 페이지<input type="text" name="file2_link" class="link_page" ></p>
         <p>이미지 3<input type="file" name="file3" class="file"  id="filename"><small>[가로300x세로100]</small></p>
          <p>-연결 페이지<input type="text" name="file3_link" class="link_page" ></p>
         <p>이미지 4<input type="file" name="file4" class="file"  id="filename"><small>[가로300x세로100]</small></p>
          <p>-연결 페이지<input type="text" name="file4_link" class="link_page" ></p>
          <br><br>
         <p><b>top 광고 관리</b></p>
         <p>이미지1 <input type="file" name="filead" class="file"  id="filename"><small>[가로1100x세로200]</small></p>
          <p>-연결 페이지<input type="text" name="filead_link" class="link_page" ></p>
         <br>
         <input type="submit" value="수정" style="margin-left: 400px;">
         <a href="#"><button style="border: none;">취소</button></a>
      </form>
     </div>
  
  </div>
  <footer>
  </footer>
  
  
</body>
</html>