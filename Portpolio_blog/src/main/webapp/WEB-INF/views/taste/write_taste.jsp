<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%String sessionID=(String)session.getAttribute("sessionID"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <link rel="stylesheet" href="css/jquery.bxslider.css">
  <link rel="stylesheet" href="css/header_nav_footer.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&family=Sunflower:wght@300&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
<script src = "${path}/ckeditor/ckeditor.js"></script>
<style>
 /* 전체 wrap */
#wrap_global{
  width: 1400px;
  margin: 0 auto;
  min-height:1500px ;
}
.writeForm{
 
  border: 0.5px solid #e7e5e2;
}
.write_body{
  display: inline;
  float: left;
  width: 920px;
  margin: 0;
  position: relative;
  }
.taste_button{
 width: 100px;
 height: 30px;
 border-radius: 10px;
 background-color: #fff;
 border: 2px solid #e6f4fa;
}
.taste_button:hover {
	background-color: #e6f4fa;
	font-weight: bold;
}

</style>
<script>
	function checkValue(){
		 var fileCheck = document.getElementById("filename").value;
		  if(!fileCheck){
		      alert("대표이미지 파일을 선택해주세요.");
		      return false;
		  }
	if (confirm("글 작성을 하시겠습니까?") == true){    //확인
	document.write_taste.submit();
	}else{   //취소
	return;	
	}
	} 
</script>


</head>

<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br>
   	<jsp:include page="../navi.jsp" />
    <br><br>
     <jsp:include page="../top_ad.jsp" />
    <br><br>
    <p><a href="/">home</a>><a href="/taste">맛집</a>><a href="#">맛집글쓰기</a></p>
    <br><br>

    <div class="write_body">
     <form action="taste_WriteAction" method="post" name="write_taste" enctype="multipart/form-data">
    <input type="hidden" name="category" value="taste">
    <input type="hidden" name="hit" value="0">
    <input type="hidden" name="id" value="<%=sessionID%>">
      <table class="writeForm">
        <tr>
          <td class="writeForm">대표이미지</td>
          <td><input type="file" name="filename" id="filename"></td>
        </tr>
        <tr>
          <td class="writeForm">제목</td>
          <td><input type="text" name="title" size="50"></td>
        </tr>
        <tr>
          <td class="writeForm">작성자</td>
          <td><%=sessionID%></td>
        </tr>
      </table> 
      <textarea name="content" id="content" cols="120" rows="100"  style="resize: none;"></textarea>
      	<script>CKEDITOR.replace('content',{height : '800px',width : '1000px',filebrowserUploadUrl:'/mine/imageUpload.do'});</script>
      <input type="button" value="글 작성" class="taste_button" onclick="checkValue()" style="margin-left: 800px;"> 
    </form>
    <a href="/taste?pagenum=1&pagelast=5"><button class="taste_button" style="margin-left: 900px;position: absolute; bottom: 0px;">글 목록</button></a>    
  	</div>
  	
 <jsp:include page="../aside.jsp"></jsp:include>

</div>
  <footer>
  </footer>
  
</body>
</html>