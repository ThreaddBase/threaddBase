<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/profile.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="userPortal.jsp" %>

<nav class="tabs">
    <div class="tabs-inner">
        <a href="<%=request.getContextPath()%>/user?id=${user.id}" class="active">Profile</a>
        <c:if test="${user.id == sessionScope.loggedUser.id}">
            <a href="<%=request.getContextPath()%>/user/joined">Joined Communities</a>
            <a href="<%=request.getContextPath()%>/user/bookmark">Bookmark</a>
            <a href="<%=request.getContextPath()%>/user/notification">Notification</a>
        </c:if>
    </div>
</nav>
<section class="posts">
<h2>Posts</h2>
    <c:choose>
        <c:when test="${not empty postList}">
            <c:forEach var="post" items="${postList}">
                <%@ include file="post.jsp" %>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p class="no-posts">No posts yet.</p>
        </c:otherwise>
    </c:choose>
</section>
</body>
 </html>