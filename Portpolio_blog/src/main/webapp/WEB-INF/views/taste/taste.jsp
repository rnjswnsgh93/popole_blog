<%@page import="com.study.springboot.dto.TasteDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%ArrayList<TasteDto> taste_list=(ArrayList<TasteDto>)session.getAttribute("taste_list"); 
      ArrayList<TasteDto> taste_hitlist=(ArrayList<TasteDto>)session.getAttribute("taste_hitlist"); 
    	 int taste_count=(int)session.getAttribute("taste_count");  
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
    	if(pagefrontlast>=taste_count+5){
    		pagefront=taste_count-(taste_count%5)+1;
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
       overflow: hidden;
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
    display: inline-block;
    float: left;
   }
.content_a{
color: black;
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
    <p><a href="/">home</a>> 맛집</p>
    <br><br>
    <p style="float: left;">맛집 인기글<a href="write_taste?sessionID=<%session.getAttribute("sessionID"); %>" style="margin-left:570px;">글쓰기</a></p><br>
    
   <c:forEach var="dto" items="${ taste_hitlist }" end="2">
    <div class="card" style="width: 14rem;">
    <a href="taste_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="upload/${dto.filename}" class="card-img-top" alt="http://placehold.it/200x200"></a>
   <div class="card-body">
    <p class="card-text">${dto.title }</p>
    </div>
    </div>
    </c:forEach>

    <hr>
   	<br><br><br><br>
    
    <table width="800" cellpadding="0" cellspacing="0"></tablewidth>
     <c:forEach var="dto" items="${ taste_list }" end="5">
      <tr>
       <th><a href="taste_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="upload/${dto.filename}" alt="대표 이미지" class="content_img"></a></th>
        <th class="content"><a href="taste_view?no=${dto.no}&pagenum=1&pagelast=5" class="content_a"> ${dto.title} </a> <br><br><br><br><br>
    	<small>작성자: ${dto.id} 조회수 :${dto.hit}</small>
        </th>
        
      </tr>
      </c:forEach>
    </table>
  </div><br><br><br><br><br><br><br>
  
  <jsp:include page="../aside.jsp"></jsp:include>
  
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <div>
   <nav aria-label="Page navigation example" style="margin-left:350px;">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="taste?pagenum=1&pagelast=5" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="taste?pagenum=<%=pageback%>&pagelast=<%=pagebacklast%>"> < </a></li>
    <%for(int i=1;i<=taste_count;i+=5){ 
     if(Integer.valueOf(request.getParameter("pagenum")) == i){%>
    <li class="page-item active"><a class="page-link" href="taste?pagenum=<%=i%>&pagelast=<%=i+4%>"><%= (i/5)+1 %></a></li>
    <%} else{%>
    <li class="page-item"><a class="page-link" href="taste?pagenum=<%=i%>&pagelast=<%=i+4%>"><%= (i/5)+1 %></a></li>
      <%} %>
      <%} %>
      <li class="page-item"><a class="page-link" href="taste?pagenum=<%=pagefront%>&pagelast=<%=pagefrontlast%>">></a></li>
      <li class="page-item">
      <a class="page-link" href="taste?pagenum=<%=taste_count-(taste_count%5)+1%>&pagelast=<%=taste_count-(taste_count%5)+5 %> " aria-label=">>">
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