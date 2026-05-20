<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Comments</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewComment.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

    <a href="<%=request.getContextPath()%>/user/home"><i class="fa-solid fa-circle-arrow-left back-button"></i></a>

    <!-- Post Author Profile -->

    <div class="profile">
        
            <c:choose>
                <c:when test="${not empty post.userProfilePicBase64}">
                    <img class="comment-avatar" src="data:image/jpeg;base64,${post.userProfilePicBase64}" alt="avatar">
                </c:when>
                <c:otherwise>
                    <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg"
                         alt="avatar">
                </c:otherwise>
            </c:choose>
        
        <div class="content">
            <h1>${post.userFirstName} ${post.userLastName}</h1>
            	<span>${post.postDate}</span>
            	<p>${post.caption}</p>
        </div>
    </div>

    <!-- Post Image -->
    <c:if test="${not empty post.postImageBase64}">
        <div class="main_content">
            <img src="data:image/jpeg;base64,${post.postImageBase64}" alt="post image">
        </div>
    </c:if>

    <!-- Post Actions — keep as plain spans, no wrapper divs -->
    <div class="post-actions">
        <span><i class="fa-regular fa-circle-check"></i> ${post.voteCount}</span>
        <span><i class="fa-regular fa-comment"></i> ${post.commentCount}</span>
        <span><i class="fa-regular fa-bookmark"></i> ${post.bookmarkCount}</span>
        <span class="report"><i class="fa-solid fa-triangle-exclamation"></i></span>
    </div>
    
    <!-- Comment Input -->
	<div class="comment-box">
	    <form class="post-form" action="<%=request.getContextPath()%>/comment" method="post">
	        <input type="hidden" name="postId" value="${post.postId}" />
	        <input type="text" name="content" placeholder="Hop into the conversation...">
	        <button type="submit">Post</button>
	    </form>
	</div>
	    
    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>
	
    <!-- Comment Input -->
	<section class="comment-section">
        <c:forEach var="comment" items="${comments}">
            <%@ include file="comment.jsp" %>
        </c:forEach>
    </section>

</body>
</html>