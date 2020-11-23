<%@page import="java.util.ArrayList"%>
<%@page import="com.study.springboot.dto.AccountDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%AccountDto account_dto=(AccountDto)session.getAttribute("account_dto"); %>
    <%ArrayList<AccountDto> account_list=(ArrayList<AccountDto>)session.getAttribute("account_list"); %>
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
.view_body{
  display: inline;
  float: left;
}
.listandwirte_button{
 	width: 80px;
 	height:30px;
 	background-color: #fff;
 	border: 2px solid #6e6f74;
 	
}
.listandwirte_button:hover {
	background-color: #6e6f74;
	color: white;

}
</style>
<script type="text/javascript">
	function goCheck(value){
		if(value =="1"){
			location.href="account?pagenum=1&pagelast=10";}
		
		if(value =="2"){
			location.href = "write_account";}	
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
    <p><a href="/">home</a>><a href="/account">가계부</a>> 가계부 글</p>
    <br><br>

    <div class="view_body">
   
    <h3>작성한 날짜 :<%=account_dto.getContentdate() %></h3>
    <p>작성자 :<u><%=account_dto.getId() %></u></p>
    <p>사용 금액 :<u><%=account_dto.getAccount() %></u></p>
    <div  style="width: 900px; min-height: 1000px; border: 0.5px solid #e7e5e2 ;"><p><%=account_dto.getContent() %></p></div>
    <div style="margin-left: 730px;">
      <span><input type="button" value="글 목록" onclick="goCheck(1)" class="listandwirte_button"></span>
      <span style="display: inline;float:right;"><input type="button" value="글쓰기" onclick="goCheck(2)" class="listandwirte_button"></span>
    </div>
  </div>

 <jsp:include page="../aside.jsp"></jsp:include>
    
    <br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <div style="border: 0.5px solid #e7e5e2; overflow: hidden; width: 900px;font-size:20px">
      <p><b>최신 가계부 글</b></p>
      <c:forEach var="dto" items="${account_list}" end="2">
      <div>[${dto.id}] <a href="${dto.category}_view?no=${dto.no}">&nbsp;&nbsp;&nbsp; 사용금액 ${dto.account} 사용날짜[${dto.contentdate}]</a></div>
      </c:forEach>
    </div>
  </div>
  <footer>

  </footer>
  
</body>
</html>