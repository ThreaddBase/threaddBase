<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 </html> --%>
 
 
 
 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/profile.css">

</head>
<body>

<%@ include file="userPortal.jsp" %>

<nav class="tabs">
  <div class="tabs-inner">

    <!-- FIXED LINKS (NO /user/home BUG) -->
    <a href="<%=request.getContextPath()%>/user">Profile</a>
    <a href="<%=request.getContextPath()%>/user/joined">Joined</a>
    <a href="<%=request.getContextPath()%>/user/bookmark">Bookmark</a>
    <a href="<%=request.getContextPath()%>/user/notification">Notification</a>
    <a href="<%=request.getContextPath()%>/user/setting">Settings</a>

  </div>
</nav>

<section class="posts">

  <c:forEach var="post" items="${posts}">

    <article class="post">

      <div>
        <h4>${post.userFirstName} ${post.userLastName}</h4>
        <small>${post.postDate}</small>
        <p>${post.caption}</p>

        <div>
          👍 ${post.voteCount}
          💬 ${post.commentCount}
          🔖 ${post.bookmarkCount}
        </div>
      </div>

      <c:if test="${post.postImage != null}">
        <img src="data:image/jpeg;base64,${post.postImageBase64}" />
      </c:if>

    </article>

  </c:forEach>

</section>

</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.PostModel, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/profile.css">
</head>
<body>

<%@ include file="userPortal.jsp" %>

<nav class="tabs">
  <div class="tabs-inner">
    <a href="<%=request.getContextPath()%>/user" class="active">Profile</a>
    <a href="<%=request.getContextPath()%>/user/joined">Joined Communities</a>
    <a href="<%=request.getContextPath()%>/user/bookmark">Bookmark</a>
    <a href="<%=request.getContextPath()%>/user/notification">Notification</a>
    <a href="<%=request.getContextPath()%>/user/setting">Settings</a>
  </div>
</nav>

<section class="posts">
<%
  List<PostModel> userPosts = (List<PostModel>) request.getAttribute("userPosts");
  String loggedUser = (String) session.getAttribute("loggedUser");

  if (userPosts != null && !userPosts.isEmpty()) {
    for (PostModel post : userPosts) {
%>
  <article class="post user-post">
    <div class="post-left">
      <div class="mini-avatar"></div>
      <div>
        <h4><%= loggedUser != null ? loggedUser : "User" %></h4>
        <small>
          <iconify-icon icon="lucide:calendar" width="14"></iconify-icon>
          <%= post.getPostDate() %>
        </small>
        <h5>
          <iconify-icon icon="lucide:users" width="14"></iconify-icon>
          <%= post.getCommunityName() != null ? post.getCommunityName() : "Community" %>
        </h5>
        <p><%= post.getPostCaption() != null ? post.getPostCaption() : "" %></p>
        <div class="post-actions">
          <span>
            <iconify-icon icon="lucide:thumbs-up" width="16"></iconify-icon>
            <%= post.getLikeCount() %>
          </span>
          <span>
            <iconify-icon icon="lucide:message-circle" width="16"></iconify-icon>
            <%= post.getCommentCount() %>
          </span>
          <span>
            <iconify-icon icon="lucide:bookmark" width="16"></iconify-icon>
          </span>
        </div>
      </div>
    </div>
    <% if (post.getPostImageBase64() != null) { %>
    <div class="post-image">
      <img src="data:image/jpeg;base64,<%= post.getPostImageBase64() %>"
           alt="Post Image" />
    </div>
    <% } %>
  </article>
<%
    }
  } else {
%>
  <p class="no-posts">You haven't made any posts yet.</p>
<%
  }
%>
</section>

</body>
</html>