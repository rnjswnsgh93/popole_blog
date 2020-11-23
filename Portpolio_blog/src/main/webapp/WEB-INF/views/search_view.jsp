<%@page import="com.study.springboot.dto.ManagerDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%ArrayList<ManagerDto> searchlist =(ArrayList<ManagerDto>)session.getAttribute("searchlist");  
	String search =(String)session.getAttribute("search");
	int search_count =(int)session.getAttribute("search_count");
	
	Integer pagelast = Integer.valueOf(request.getParameter("pagelast"));
	Integer pagenum = Integer.valueOf(request.getParameter("pagenum"));
	int pageback =pagenum-13;
	int pagebacklast= pagelast-13;
	int pagefront=pagenum+12;
	int pagefrontlast= pagelast+12;
	if(pageback<1){
		pageback=1;
		pagebacklast=12;
	}
	if(pagefrontlast>=search_count+12){
		pagefrontlast=search_count+10;
		pagefront=search_count-(search_count%12)+1;
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
 /* 전체 wrap */
#wrap_global{
  width: 1400px;
  margin: 0 auto;
  min-height:1500px ;
}
.writeForm{
  margin: 0 auto;
 border: 0.5px solid #e7e5e2;
 width: 900px;
}
td{
  border: 0.5px solid #e7e5e2;
}
.cartagory{
  width: 100px;
}
.memberid{
  width: 100px;
}
.title{
  width: 500px;
}
.search_body{
display: inline;
float: left;
width: 900px;
height: 700px;
}
a:active {
	background-color: black;
}

</style>
</head>
<header></header>
<body>
  <div id="wrap_global">
    <br><br><br>
  	<jsp:include page="navi.jsp" />
  
  <br><br>
     <jsp:include page="top_ad.jsp" />
    <br><br>
    <p><a href="#">home</a>> 검색결과 :${search}[<%=search_count%>개]</p>
    <br><br>
    <div class="search_body">
    	<c:forEach var="dto" items = "${searchlist}">
          <div style="width: 280px; display: inline; float: left;">
          <div class="card" style="width: 13rem;">
            <a href="${dto.category}_view?no=${dto.no}&pagenum=1&pagelast=5"><img src="../upload/${dto.filename}" class="card-img-top" alt="200x200"></a>
           <div class="card-body">
            <p class="card-text" style="text-align: center;">[${dto.category}]<b>${dto.title}</b></p>
            </div>
            </div>
          </div>   
     </c:forEach> 
     </div>
   <jsp:include page="aside.jsp" /> 
   <br><br><br>    
            <div style="clear: left"></div>
 
     <nav aria-label="Page navigation example" style="margin-left:350px;">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="search_view?search=${search}&pagenum=<%=pageback%>&pagelast=<%=pagebacklast%>"> < </a></li>
    <%for(int i=1;i<=search_count;i+=12){ %>
    <li class="page-item"><a class="page-link active" href="search_view?search=${search}&pagenum=<%=i%>&pagelast=<%=i+11%>"><%= (i/12)+1 %></a></li>
      <%} %>
      <li class="page-item"><a class="page-link" href="search_view?search=${search}&pagenum=<%=pagefront%>&pagelast=<%=pagefrontlast%>">></a></li>
      
  </ul>
</nav> 
  
  
  
  </div>
  <footer>
  </footer>
  
  
</body>
</html>