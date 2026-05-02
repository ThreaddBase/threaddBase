<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/community.css">
</head>
<body>
    <!-- <a href="<%=request.getContextPath()%>/logout">Logout</a> -->
    <%@ include file="sidebar.jsp" %>
    
    <div class="category-list">
        <%@ include file="post.jsp" %>
    </div>
    
    
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/js/all.min.js" 
integrity="sha512-6BTOlkauINO65nLhXhthZMtepgJSghyimIalb+crKRPhvhmsCdnIuGcVbR5/aQY2A+260iC1OPy1oCdB6pSSwQ==" 
crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
</body>
</html>