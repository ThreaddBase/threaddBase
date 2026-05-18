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
    
    <article class="post">
      <div class="post-left">
        <div class="bookmark-badge"><iconify-icon icon="mdi:star" width="16"></iconify-icon></div>
        <div>
          <h4>Post A</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">View Post</button>
        <button class="leave-btn">Remove Bookmark</button>
      </div>
    </article>

    <article class="post">
      <div class="post-left">
        <div class="bookmark-badge"><iconify-icon icon="mdi:star" width="16"></iconify-icon></div>
        <div>
          <h4>Post C</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">View Post</button>
        <button class="leave-btn">Remove Bookmark</button>
      </div>
    </article>

    <article class="post">
      <div class="post-left">
        <div class="bookmark-badge"><iconify-icon icon="mdi:star" width="16"></iconify-icon></div>
        <div>
          <h4>Post E</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">View Post</button>
        <button class="leave-btn">Remove Bookmark</button>
      </div>
    </article>
  </section>
 </body>
 </html>