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
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/bookmark.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="userPortal.jsp" %>

  <nav class="tabs">
    <div class="tabs-inner">
      <a href="/Threaddbase/user">Profile</a>
      <a href="/Threaddbase/user/joined" >Joined Communities</a>
      <a href="/Threaddbase/user/bookmark" class="active">Bookmark</a>
      <a href="/Threaddbase/user/notification">Notification</a>
    </div>
  </nav>

    <div class="page-title">
    <h1>Bookmarks</h1>
  </div>
  
  <section class="posts"> 
	<c:forEach var="bookmark" items="${bookmarkList}">
	  <article class="post">
	    <div class="post-left">
	      <div class="bookmark-badge"><i class="fa-solid fa-bookmark"></i></div>
	      <div>
	        <h4>${bookmark.userFirstName} ${bookmark.userLastName}</h4>
	        <p>${bookmark.postCaption}</p>
	      </div>
	    </div>
	    <div class="post-buttons">
	      <button class="view-btn">View Post</button>
 	      <a href="<%=request.getContextPath()%>/user/bookmark?postId=${bookmark.postId}">
	        <button class="leave-btn">Remove Bookmark</button>
	      </a> 
	    </div>
	  </article>
	</c:forEach>

  </section>
 </body>
 </html>