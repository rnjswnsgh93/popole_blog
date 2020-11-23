<%@page import="com.study.springboot.dto.BannerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%BannerDto banner_dto=(BannerDto)session.getAttribute("banner_dto"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.ad{
  width: 1100px;
  height: 200px;

}</style>
</head>

<body>
 <img src="../upload/${banner_dto.filead}" alt="TOP광고" class="ad">
</body>
</html>