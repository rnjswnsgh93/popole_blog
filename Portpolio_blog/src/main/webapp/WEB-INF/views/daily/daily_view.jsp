<%@page import="java.util.ArrayList"%>
<%@page import="com.study.springboot.dto.DailyDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  DailyDto daily_dto=(DailyDto)session.getAttribute("daily_dto"); 
       ArrayList<DailyDto> daily_list=(ArrayList<DailyDto>)session.getAttribute("daily_list"); 
       ArrayList<DailyDto> reply_list=(ArrayList<DailyDto>)session.getAttribute("reply_list"); 
       String sessionID=(String)session.getAttribute("sessionID");
       int count_reply=(int)session.getAttribute("count_reply");
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
.wrap_global{
  width: 1200px;
  margin: 0 auto;
  
}
.view_body{
  display: ;
  float: ;
}
.daily_button{
border-radius: 10px;
border:3px solid #e6f4fa;
width: 100px;
height: 30px;
background-color: #fff;
}
.daily_button:hover {
	background-color: #e6f4fa;
	font-weight: bold;
}
.reply{
margin-left: 20px;
}
.delete_button{
	float:right;
	border-radius: 10px;
	border: 2px solid #e6f4fa;
	width: 100px;
	height: 30px;
	background-color: #fff;
}
.delete_button:hover {
	background-color: #e6f4fa;
	font-weight: bold;
}
.reply_submit{
	border-radius: 10px;
	border: 2px solid #e6f4fa;
	width: 100px;
	height: 30px;
	background-color: #fff;

}
.reply_submit:hover {
	background-color: #e6f4fa;
	font-weight: bold;}
	
.view_image{
	width: 100%;
	height:300px;
	content="";
	background-size:100% 500px;
 	background-repeat: no-repeat;
      z-index: -1;
      opacity: 0.8;
     background-image:url('upload/<%=daily_dto.getFilename()%>');
    


}
.top_title{
	 width: 100%;
      height: 500px;
      position: relative;
      z-index: 3;
	margin-left: 400px; color: #fff; font-weight: bold;

}

</style>
<script type="text/javascript">
	function goCheck(value){
		if(value =="1"){
			location.href="daily?pagenum=1&pagelast=5";}
		
		if(value =="2"){
			location.href ="write_daily";	
		}
	}	
function button_modyfi(data){
			location.href ="daily_modyfi?no="+data;
			}
function button_delete(data){
				location.href ="daily_delete?no="+data;	
		}
		

function delete_daily_reply(data){
	location.href="delete_reply?no="+data;
	}

</script>

</script>
</head>

<body>
  <header></header>
  <div class="wrap_global">
    <br><br><br>
    <jsp:include page="../navi.jsp" />
      <br><br>
    <jsp:include page="../top_ad.jsp" />
    <br><br>
    <p><a href="#">home</a>><a href="#">일상</a>> 일상 글</p>
    <br><br>
 	</div>

    <div class="view_body">
    <div class="view_image"><br><br>
    <div class="top_title">
    <h1><%=daily_dto.getTitle()%></h1>
     <%if(sessionID != null && sessionID.equals(daily_dto.getId())){ %>
   		<button onclick="button_modyfi(${daily_dto.no})" class="daily_button">수정</button>
   		<button onclick="button_delete(${daily_dto.no})" class="daily_button">삭제</button>
    <%} %>
    <br><br><br><br><br><p><%=daily_dto.getReg() %></p>
    <p>작성자 :<u><%=daily_dto.getId() %></u></p>
    </div>
	</div>
	<hr><br><br>
	<div class="wrap_global">
    <div style="width: 1000px; min-height: 1000px; border-top: 0.5px solid #e7e5e2 ; border-bottom: 0.5px solid #e7e5e2 ;"><p><%=daily_dto.getContent() %></p></div>
    <div style="margin-left: 950px;">
      <span><input type="button" value="글 목록" onclick="goCheck(1)" class="daily_button"></span>
      <span><input type="button" value="글쓰기" onclick="goCheck(2)" class="daily_button"></span>
    </div>

    <br>
    <br><br><br>
    <div style="border-top: 3px solid #e4e8ff; border-bottom: 3px solid #e4e8ff; width: 1100px">
      <h4>최신 일상글</h4><br>
      <c:forEach var="dto" items="${ daily_list }" end="3">
      <div><i><a href="daily_view?no=${dto.no}&pagenum=1&pagelast=5" style="font-size: 20px; color:black;">${dto.title}</a></i>&nbsp;&nbsp;<div style="float: right;">[${dto.reg}]</div></div>
      </c:forEach>
    </div>
    <br><br><br><br><br><br><br><br>
    <p><b>댓글 작성</b></p>
    <div style="width: 1080px;">
		<form action="content_reply" method="POST">
    	<input type="hidden" name="id" value="<%=sessionID%>">
    	<input type="hidden" name="viewno" value="<%=daily_dto.getNo()%>">
    	<input type="hidden" name="step" value="0">
       <textarea style="resize: none; border: 0.5px solid #858483;" name="content" cols="150" rows="5"></textarea><br>
       <input type="submit"  value="작성" class="delete_button" >
    </form>
      </div>
    
    <br><br><br>
    댓글:[<%=count_reply %>]개
     <div class="visit_list">
    <c:forEach var="dto" items="${ reply_list }">
      <c:if test="${dto.step eq '0'}"> 
      <p style="background-color: #e7e5e2;"> ${dto.id } ${dto.reg}</p>
      <p>${dto.content }<button class="delete_button" onclick="delete_daily_reply(${dto.no})">삭제하기</button></p>  
        
     <a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
	답글달기
	</a><div style="DISPLAY: none">
  <form action="content_reply_step1" method="POST">
    	<input type="hidden" name="id" value="<%=sessionID%>">
    	<input type="hidden" name="viewno" value="<%=daily_dto.getNo()%>">
    	<input type="hidden" name="step" value="1">
    	<input type="hidden" name="group" value="${dto.group}">
  	<textarea rows="5" cols="150" name="content" ></textarea>
        <input type="submit" value="답글작성" class="reply_submit">
 
      </form>
</div>
      </c:if>
     <c:if test="${dto.step eq '1'}"> 
      <div class="reply">   
      <p style="background-color: #f5f4f3;"> ㄴ ${dto.id }  ${dto.reg}</p>
      <p>${dto.content }<button class="delete_button"onclick="delete_daily_reply(${dto.no})">삭제하기</button></p>
      </div>
      </c:if>
      </c:forEach>
      </div> 
      
    

 
 </div>
</div>
  <footer>

  </footer>
  
</body>
</html>