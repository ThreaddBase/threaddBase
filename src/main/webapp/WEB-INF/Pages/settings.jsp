<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/settings.css">
</head>
<body>
<%@ include file="userPortal.jsp" %>

  <nav class="tabs">
    <div class="tabs-inner">
      <a href="/Threaddbase/user" >Profile</a>
      <a href="/Threaddbase/user/joined" >Joined Communities</a>
      <a href="/Threaddbase/user/bookmark" >Bookmark</a>
      <a href="/Threaddbase/user/notification">Notification</a>
      <a href="/Threaddbase/user/setting" class="active">Settings</a>
    </div>
  </nav>

  <div class="title">
    <div class="title-heading">
      <h1>Settings</h1>
    </div>
  </div>

  <section class="posts settings-list">
    <article class="post setting-item">
      <div class="post-left">
        <div>
          <h4>Public Fullname</h4>
        </div>
      </div>
      <div class="post-buttons">
        <label class="toggle-switch">
          <input type="checkbox" checked />
          <span class="slider"></span>
        </label>
      </div>
    </article>

    <article class="post setting-item">
      <div class="post-left">
        <div>
          <h4>Public email address</h4>
        </div>
      </div>
      <div class="post-buttons">
        <label class="toggle-switch">
          <input type="checkbox" checked />
          <span class="slider"></span>
        </label>
      </div>
    </article>

    <article class="post setting-item">
      <div class="post-left">
        <div>
          <h4>Public profile picture</h4>
        </div>
      </div>
      <div class="post-buttons">
        <label class="toggle-switch">
          <input type="checkbox" />
          <span class="slider"></span>
        </label>
      </div>
    </article>

    <article class="post setting-item">
      <div class="post-left">
        <div>
          <h4>Public joined communities</h4>
        </div>
      </div>
      <div class="post-buttons">
        <label class="toggle-switch">
          <input type="checkbox" checked />
          <span class="slider"></span>
        </label>
      </div>
    </article>

    <article class="post setting-item">
      <div class="post-left">
        <div>
          <h4>Public Bookmarks</h4>
        </div>
      </div>
      <div class="post-buttons">
        <label class="toggle-switch">
          <input type="checkbox" checked />
          <span class="slider"></span>
        </label>
      </div>
    </article>

    <article class="post setting-item">
      <div class="post-left">
        <div>
          <h4>Enable Notifications</h4>
        </div>
      </div>
      <div class="post-buttons">
        <label class="toggle-switch">
          <input type="checkbox" />
          <span class="slider"></span>
        </label>
      </div>
    </article>

    <div class="post-footer">
      <button class="save-button">Save Settings</button>
    </div>
  </section>
 </body>
 </html>