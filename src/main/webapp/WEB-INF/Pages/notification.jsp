<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notification.css">
</head>
<body>
<%@ include file="userPortal.jsp" %>

  <nav class="tabs">
    <div class="tabs-inner">
      <a href="/Threaddbase/user">Profile</a>
      <a href="/Threaddbase/user/joined" >Joined Communities</a>
      <a href="/Threaddbase/user/bookmark">Bookmark</a>
      <a href="/Threaddbase/user/notification" class="active">Notification</a>
      <a href="/Threaddbase/user/setting">Settings</a>
    </div>
  </nav>

    <div class="title">
        <div class="title-heading">
            <h1>Notifications</h1>
            <a href="#" class="title-note">Mark all as read</a>
        </div>
        
        <div class="title-actions">
            <a href="#">Clear All</a>
        </div>
    </div>

    <!-- NOTIFICATIONS LIST  -->
    <section class="posts">
        
        <article class="post">
            <div class="post-left">
                <div class="mini-avatar"></div>
                <div>
                    <h4>Community A</h4>
                    <p>New post in "UI Inspiration" — "10 beautiful mobile dashboard designs"</p>
                </div>
            </div>
            <div class="post-buttons">
                <button class="action-btn">Mark as Read</button>
            </div>
        </article>

        <article class="post">
            <div class="post-left">
                <div class="mini-avatar"></div>
                <div>
                    <h4>Post D</h4>
                    <p>@sarah.design replied to your comment: "This looks amazing!"</p>
                </div>
            </div>
            <div class="post-buttons">
                <button class="action-btn">Mark as Read</button>
            </div>
        </article>

        <article class="post">
            <div class="post-left">
                <div class="mini-avatar"></div>
                <div>
                    <h4>Community A</h4>
                    <p>Your post got 12 new likes</p>
                </div>
            </div>
            <div class="post-buttons">
                <button class="action-btn">Mark as Read</button>
            </div>
        </article>

        <article class="post">
            <div class="post-left">
                <div class="mini-avatar"></div>
                <div>
                    <h4>Post A</h4>
                    <p>@mike_codes mentioned you in a comment</p>
                </div>
            </div>
            <div class="post-buttons">
                <button class="action-btn">Mark as Read</button>
            </div>
        </article>

        <article class="post">
            <div class="post-left">
                <div class="mini-avatar"></div>
                <div>
                    <h4>Community B</h4>
                    <p>Weekly roundup: Top 5 design trends this month</p>
                </div>
            </div>
            <div class="post-buttons">
                <button class="action-btn">Mark as Read</button>
            </div>
        </article>

    </section>
    

 </body>
 </html>