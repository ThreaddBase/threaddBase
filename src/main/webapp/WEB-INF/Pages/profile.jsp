<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/profile.css">
</head>
<body>
<header class="Top-section">
</header>
<%@ include file="userPortal.jsp" %>

  <nav class="tabs">
    <div class="tabs-inner">
      <a href="/Threaddbase/user"  class="active">Profile</a>
      <a href="/Threaddbase/user/joined" >Joined Communities</a>
      <a href="/Threaddbase/user/bookmark" >Bookmark</a>
      <a href="/Threaddbase/user/notification">Notification</a>
      <a href="/Threaddbase/user/setting">Settings</a>
    </div>
  </nav>

 <section class="posts">
    <article class="post user-post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Harry Newgate</h4>
          <small><iconify-icon icon="lucide:calendar" width="14"></iconify-icon> 2024-01-01</small>
          <h5><iconify-icon icon="lucide:users" width="14"></iconify-icon> Community Name</h5>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
          <div class="post-actions">
            <span><iconify-icon icon="lucide:thumbs-up" width="16"></iconify-icon> 24</span>
            <span><iconify-icon icon="lucide:message-circle" width="16"></iconify-icon> 8</span>
            <span><iconify-icon icon="lucide:bookmark" width="16"></iconify-icon></span>
          </div>
        </div>
      </div>
      <div class="post-image">
        <img src="https://images.pexels.com/photos/2161449/pexels-photo-2161449.jpeg?auto=compress&cs=tinysrgb&w=400" alt="Community post" />
      </div>
    </article>

    <article class="post user-post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Harry Newgate</h4>
          <small><iconify-icon icon="lucide:calendar" width="14"></iconify-icon> 2023-11-21</small>
          <h5><iconify-icon icon="lucide:users" width="14"></iconify-icon> Community Name</h5>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
          <div class="post-actions">
            <span><iconify-icon icon="lucide:thumbs-up" width="16"></iconify-icon> 12</span>
            <span><iconify-icon icon="lucide:message-circle" width="16"></iconify-icon> 5</span>
            <span><iconify-icon icon="lucide:bookmark" width="16"></iconify-icon></span>
          </div>
        </div>
      </div>
      <div class="post-image">
        <img src="https://images.pexels.com/photos/3756679/pexels-photo-3756679.jpeg?auto=compress&cs=tinysrgb&w=400" alt="Community post" />
      </div>
    </article>
 </section>
 </body>
 </html>