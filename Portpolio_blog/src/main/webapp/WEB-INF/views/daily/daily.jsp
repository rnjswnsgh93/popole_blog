<%@page import="com.study.springboot.dto.DailyDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%ArrayList<DailyDto> daily_list=(ArrayList<DailyDto>)session.getAttribute("daily_list"); 
      ArrayList<DailyDto> daily_hitlist=(ArrayList<DailyDto>)session.getAttribute("daily_hitlist");  
    	 int daily_count=(int)session.getAttribute("daily_count");  
    	Integer pagelast = Integer.valueOf(request.getParameter("pagelast"));
    	Integer pagenum = Integer.valueOf(request.getParameter("pagenum"));
    	int pageback =pagenum-5;
		int pagebacklast= pagelast-5;
		int pagefront=pagenum+5;
		int pagefrontlast= pagelast+5;
    	if(pageback<1){
    		pageback=1;
    		pagebacklast=5;
    	}
    	if(pagefrontlast>=daily_count+5){
    		pagefront=daily_count-(daily_count%5)+1;
    		pagefrontlast=pagefront+4;
    	}
    	
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
    #wrap_global{
                width: 1200px;
                margin: 0 auto;
            }
  /* 인기글  */
    .card{
        display: inline-block;
        float: none;
        margin: 3px;
      }
      /* 글 내용 */
     .name{
       width:100px;
       border-right:1px solid gainsboro  ;border-bottom:1px solid gainsboro;
     }
     .content{
       
       width:580px;
       height: 100px;
       border-bottom: 1px solid gainsboro;
     }
     .hit{
       border-left:1px solid gainsboro; border-bottom: 1px solid gainsboro;
       width: 80px;
     }
     .content_img{
      display: inline-block;
      margin: 10px 5px;
      width:300px;
      height: 150px;
     }
   .session{
    width: 700px;
    display: inline;
    float: left;
    max-height:1000px;
     
   }
   .content_a{
   color:black;
   }

   
  </style>

</head>

<body>
  <header></header>
  <div id="wrap_global">
    <br><br><br><br><br>
   <jsp:include page="../navi.jsp" />
    <br><br>
   <jsp:include page="../top_ad.jsp" />
    <br><br>
    <div class="session">
    <p><a href="/">home</a>> 일상</p>
    <br><br>
    <p style="float: left;">일상 인기글<a href="write_daily" style="margin-left:570px;">글쓰기</a></p><br>
    
   <c:forEach var="dto" items="${ daily_hitlist }" end="2">
    <div class="card" style="width: 14rem;">
    <a href="daily_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="upload/${dto.filename}" class="card-img-top" alt="http://placehold.it/200x200"></a>
   <div class="card-body">
    <p class="card-text">${dto.title }<small>(${dto.hit})</small></p>
    </div>
    </div>
    </c:forEach>

    <hr>
   	<br><br><br><br>

    <table width="800" cellpadding="0" cellspacing="0">
     <c:forEach var="dto" items="${ daily_list }" >
     <tr>
        <th><a href="daily_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="upload/${dto.filename}" alt="http://placehold.it/100x100" class="content_img"></a></th>
        <th class="content"> <a href="daily_view?no=${dto.no}&pagenum=1&pagelast=5" class="content_a">${dto.title} </a><br><br><br><br><br>
       <small style="">작성자 :${dto.id} 조회수 :${dto.hit}</small>
        </th>  
      </tr>
        
      </c:forEach>
    </table>
  </div>
  
  
      
  <br><br><br><br><br><br><br>
  
	<jsp:include page="../aside.jsp"></jsp:include>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <div>
   <nav aria-label="Page navigation example" style="margin-left:350px;">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="daily?pagenum=1&pagelast=5" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="daily?pagenum=<%=pageback%>&pagelast=<%=pagebacklast%>"> < </a></li>
    <%for(int i=1;i<=daily_count;i+=5){
   if(Integer.valueOf(request.getParameter("pagenum")) == i){%>
    <li class="page-item active"><a class="page-link" href="daily?pagenum=<%=i%>&pagelast=<%=i+4%>"><%= (i/5)+1 %></a></li>
    <%} else{%>
     <li class="page-item"><a class="page-link" href="daily?pagenum=<%=i%>&pagelast=<%=i+4%>"><%= (i/5)+1 %></a></li>
      <%} %>
      <%} %>
      <li class="page-item"><a class="page-link" href="daily?pagenum=<%=pagefront%>&pagelast=<%=pagefrontlast%>">></a></li>
      <li class="page-item">
      <a class="page-link" href="daily?pagenum=<%=daily_count-(daily_count%5)+1%>&pagelast=<%=daily_count-(daily_count%5)+5 %> " aria-label=">>">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	</div>
  </div>
 <footer></footer>
 
</body>
</html>