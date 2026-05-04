<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/error.css">
<title>404 Page not Found</title>
</head>
<body>
	<div class="Error-404">
        <h1>404</h1>
        <h2>Page Not Found</h2>
        <p>Its seems that the page you are A for doesnt exist</p>
        <a href="<%=request.getContextPath()%>/home" class="home-btn">Home</a>
    </div>
</body>
</html>