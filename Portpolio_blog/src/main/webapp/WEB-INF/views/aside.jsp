<%@page import="com.study.springboot.dto.BannerDto"%>
<%@page import="com.study.springboot.dto.ManagerDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%ArrayList<ManagerDto> asidelist=(ArrayList<ManagerDto>)session.getAttribute("asidelist"); 
 	BannerDto banner_dto=(BannerDto)session.getAttribute("banner_dto"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.aside_img{
width: 300px;
height: 100px;
border: 0.2px solid #e7e5e2;
object-fit: contain;
}
</style>
</head>
<body>
  <div class="aside" style="margin-left:130px ;">
    <div class="catagory">
    <p><b>카테고리</b></p>
    <a href="/daily?pagenum=1&pagelast=5" class="aside_a"><p>>일상</p></a>
    <a href="/taste?pagenum=1&pagelast=5" class="aside_a"><p>>맛집</p></a>
    <a href="/visit" class="aside_a"><p>>방명록</p></a>
  </div>
  <br><br><br><br>
  <div class="list">
    <p>최신글</p>
    <c:forEach var="dto" items="${asidelist}" end="3">
    <p>><a href="${dto.category}_view?no=${dto.no}&pagenum=1&pagelast=5" class="aside_a"> ${dto.title}</a>[${dto.category}]</p>
    </c:forEach>
  </div><br><br>
  <div class="aside_ad">
   <a href="http://${banner_dto.file1_link }"> <img src="../upload/${banner_dto.file1 }" alt="광고1" class="aside_img"></a><br><br>
   <a href="http://${banner_dto.file2_link }"> <img src="../upload/${banner_dto.file2}" alt="광고2" class="aside_img"></a><br><br>
   <a href="http://${banner_dto.file3_link }"> <img src="../upload/${banner_dto.file3 }" alt="광고3" class="aside_img"></a><br><br>
   <a href="http://${banner_dto.file4_link }"> <img src="../upload/${banner_dto.file4 }" alt="광고4" class="aside_img"></a>
  </div>
  
  </div>
</body>
</html>