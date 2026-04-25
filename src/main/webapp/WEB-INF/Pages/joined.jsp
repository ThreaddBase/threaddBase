<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/joined.css">
</head>
<body>
<%@ include file="userPortal.jsp" %>

  <nav class="tabs">
    <div class="tabs-inner">
      <a href="/Threaddbase/user">Profile</a>
      <a href="/Threaddbase/user/joined" class="active">Joined Communities</a>
      <a href="/Threaddbase/user/bookmark" >Bookmark</a>
      <a href="/Threaddbase/user/notification">Notification</a>
      <a href="/Threaddbase/user/setting">Settings</a>
    </div>
  </nav>

  <div class="page-title">
    <h1>Joined Communities</h1>
  </div>

  <section class="posts">
    <article class="post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Community A</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">View Updates</button>
        <button class="leave-btn">Leave</button>
      </div>
    </article>

    <article class="post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Community B</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">View Updates</button>
        <button class="leave-btn">Leave</button>
      </div>
    </article>

    <article class="post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Community C</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">View Updates</button>
        <button class="leave-btn">Leave</button>
      </div>
    </article>

    <div class="more-section">
      <h2>More communities</h2>
      <button class="load-more-btn">Load More</button>
    </div>
  </section>

  <div class="recommended-section">
    <h2>Recommended Communities</h2>

    <article class="post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Community E</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">Join Community</button>
        <button class="leave-btn">Hide</button>
      </div>
    </article>

    <article class="post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Community F</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">Join Community</button>
        <button class="leave-btn">Hide</button>
      </div>
    </article>

    <article class="post">
      <div class="post-left">
        <div class="mini-avatar"></div>
        <div>
          <h4>Community G</h4>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit...</p>
        </div>
      </div>
      <div class="post-buttons">
        <button class="view-btn">Join Community</button>
        <button class="leave-btn">Hide</button>
      </div>
    </article>
  </div>
 </body>
 </html>