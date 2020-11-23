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

.account_button{
	width: 80px;
 	height:30px;
 	background-color: #fff;
 	border: 2px solid #6e6f74;
 	}
.account_button:hover {
	background-color: #6e6f74;
	color: white;
}
</style>
<script>
  function checkValue()
		{
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
    <p><a href="/">home</a>><a href="/taste">가계부</a>>가계부 글쓰기</p>
    <br><br>

    <div class="write_body">
        <form class="formsize" action="account_WriteAction?id=<%=sessionID %>" method="post" name="write_taste">
      <table class="writeForm">
    <input type="hidden" name="category" value="account">
      <input type="hidden" name="title" value="가계부">
        <tr>
          <td class="writeForm">작성할날짜</td>
          <td><input type="date" name="datea" size="50"></td>
        </tr>
        <tr>
          <td class="writeForm">작성자</td>
          <td><%=sessionID %></td>
        </tr>
        <tr>
          <td class="writeForm">지출액</td>
          <td><input type="number" name="account"></td>
        </tr>
      </table> 
      <textarea name="content" id="content" cols="120" rows="100"  style="resize: none;"></textarea>
      	<script>CKEDITOR.replace('content',{
      	      	height : '800px',filebrowserUploadUrl:'/mine/imageUpload.do'});</script>
      <input type="button" value="글 작성" class="account_button" onclick="checkValue()"style="margin-left: 760px;"> 
    </form>
    <a href="/account?pagenum=1&pagelast=10"><button class="account_button"  style="margin-left: 840px;position: absolute; bottom: 0px;">글 목록</button></a>    
  	</div>
  	
 <jsp:include page="../aside.jsp"></jsp:include>

</div>
  <footer>
  </footer>
  
</body>
</html>