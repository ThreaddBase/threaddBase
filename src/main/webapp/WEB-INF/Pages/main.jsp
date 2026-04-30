<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
</head>
<body>
    <a href="<%=request.getContextPath()%>/logout">Logout</a>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="post.jsp" %>
</body>
</html>