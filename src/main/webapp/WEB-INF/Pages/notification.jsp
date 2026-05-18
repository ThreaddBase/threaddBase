<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 </html> --%>
 
 
 
 
 
 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <a href="/Threaddbase/user/joined">Joined Communities</a>
      <a href="/Threaddbase/user/bookmark">Bookmark</a>
      <a href="/Threaddbase/user/notification" class="active">Notification</a>
      <a href="/Threaddbase/user/setting">Settings</a>
    </div>
  </nav>

    <div class="title">
        <div class="title-heading">
            <h1>Notifications</h1>
            <a href="<%=request.getContextPath()%>/user/notification"
               class="title-note">Mark all as read</a>
        </div>
        <div class="title-actions">
            <a href="#">Clear All</a>
        </div>
    </div>

    <!-- NOTIFICATIONS LIST -->
    <section class="posts">

        <c:choose>
            <c:when test="${empty notificationList}">
                <div style="text-align:center; padding:40px; color:#aaa; font-size:16px;">
                    No notifications yet.
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <article class="post">
                        <div class="post-left">
                            <div class="mini-avatar"></div>
                            <div>
                                <h4>Admin Notification</h4>
                                <p>${n.notificationMessage}</p>
                                <small style="color:#aaa; font-size:11px;">
                                    ${n.notificationDate} &nbsp; ${n.notificationTime}
                                </small>
                            </div>
                        </div>
                        <div class="post-buttons">
                            <button class="action-btn">Mark as Read</button>
                        </div>
                    </article>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </section>

</body>
</html> --%>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notifications</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notification.css">
</head>
<body>

<%@ include file="userPortal.jsp" %>

<nav class="tabs">
    <div class="tabs-inner">
        <a href="<%=request.getContextPath()%>/user">Profile</a>
        <a href="<%=request.getContextPath()%>/user/joined">Joined Communities</a>
        <a href="<%=request.getContextPath()%>/user/bookmark">Bookmark</a>
        <a href="<%=request.getContextPath()%>/user/notification" class="active">Notification</a>
        <a href="<%=request.getContextPath()%>/user/setting">Settings</a>
    </div>
</nav>

<div class="title">
    <div class="title-heading">
        <h1>Notifications</h1>
        <a href="<%=request.getContextPath()%>/user/notification"
           class="title-note">Mark all as read</a>
    </div>
    <div class="title-actions">
        <a href="#">Clear All</a>
    </div>
</div>

<!-- NOTIFICATIONS LIST -->
<section class="posts">
    <c:choose>
        <c:when test="${empty notificationList}">
            <div style="text-align:center; padding:40px; color:#aaa; font-size:16px;">
                No notifications yet.
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="n" items="${notificationList}">
                <article class="post">
                    <div class="post-left">
                        <div class="mini-avatar"></div>
                        <div>
                            <h4>Admin Notification</h4>
                            <p>${n.notificationMessage}</p>
                            <small style="color:#aaa; font-size:11px;">
                                ${n.notificationDate} &nbsp; ${n.notificationTime}
                            </small>
                        </div>
                    </div>
                    <div class="post-buttons">
                        <button class="action-btn">Mark as Read</button>
                    </div>
                </article>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</section>

</body>
</html>
 --%>
 
 
 
 <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <a href="/Threaddbase/user/joined">Joined Communities</a>
      <a href="/Threaddbase/user/bookmark">Bookmark</a>
      <a href="/Threaddbase/user/notification" class="active">Notification</a>
      <a href="/Threaddbase/user/setting">Settings</a>
    </div>
  </nav>

    <div class="title">
        <div class="title-heading">
            <h1>Notifications</h1>
            <a href="<%=request.getContextPath()%>/user/notification"
               class="title-note">Mark all as read</a>
        </div>
        <div class="title-actions">
            <a href="#">Clear All</a>
        </div>
    </div>

    <!-- NOTIFICATIONS LIST -->
    <section class="posts">

        <c:choose>
            <c:when test="${empty notificationList}">
                <div style="text-align:center; padding:40px; color:#aaa; font-size:16px;">
                    No notifications yet.
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <article class="post">
                        <div class="post-left">
                            <div class="mini-avatar"></div>
                            <div>
                                <h4>Admin Notification</h4>
                                <p>${n.notificationMessage}</p>
                                <small style="color:#aaa; font-size:11px;">
                                    ${n.notificationDate} &nbsp; ${n.notificationTime}
                                </small>
                            </div>
                        </div>
                        <div class="post-buttons">
                            <button class="action-btn">Mark as Read</button>
                        </div>
                    </article>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </section>

</body>
</html> --%>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notifications</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notification.css">
</head>
<body>

<%@ include file="userPortal.jsp" %>

<nav class="tabs">
    <div class="tabs-inner">
        <a href="<%=request.getContextPath()%>/user">Profile</a>
        <a href="<%=request.getContextPath()%>/user/joined">Joined Communities</a>
        <a href="<%=request.getContextPath()%>/user/bookmark">Bookmark</a>
        <a href="<%=request.getContextPath()%>/user/notification" class="active">Notification</a>
        <a href="<%=request.getContextPath()%>/user/setting">Settings</a>
    </div>
</nav>

<div class="title">
    <div class="title-heading">
        <h1>Notifications</h1>
        <a href="<%=request.getContextPath()%>/user/notification"
           class="title-note">Mark all as read</a>
    </div>
    <div class="title-actions">
        <a href="#">Clear All</a>
    </div>
</div>

<section class="posts">
    <c:choose>
        <c:when test="${empty notificationList}">
            <div style="text-align:center; padding:60px; color:#aaa; font-size:16px;">
                No notifications yet.
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="n" items="${notificationList}">
                <article class="post">
                    <div class="post-left">
                        <div class="mini-avatar"></div>
                        <div>
                            <h4>Admin</h4>
                            <p>${n.notificationMessage}</p>
                            <small style="color:#aaa; font-size:11px; display:block; margin-top:4px;">
                                ${n.notificationDate} &nbsp; ${n.notificationTime}
                            </small>
                        </div>
                    </div>
                    <div class="post-buttons">
                        <button class="action-btn">Mark as Read</button>
                    </div>
                </article>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</section>

</body>
</html> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notifications</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notification.css">
</head>
<body>

<%@ include file="userPortal.jsp" %>

<nav class="tabs">
    <div class="tabs-inner">
        <a href="<%=request.getContextPath()%>/user">Profile</a>
        <a href="<%=request.getContextPath()%>/user/joined">Joined Communities</a>
        <a href="<%=request.getContextPath()%>/user/bookmark">Bookmark</a>
        <a href="<%=request.getContextPath()%>/user/notification" class="active">Notification</a>
        <a href="<%=request.getContextPath()%>/user/setting">Settings</a>
    </div>
</nav>

<div class="title">
    <div class="title-heading">
        <h1>Notifications</h1>
        <a href="<%=request.getContextPath()%>/user/notification?action=markRead"
           class="title-note">Mark all as read</a>
    </div>
    <div class="title-actions">
        <a href="<%=request.getContextPath()%>/user/notification?action=clearAll">
            Clear All
        </a>
    </div>
</div>

<section class="posts">
    <c:choose>
        <c:when test="${empty notificationList}">
            <div style="text-align:center; padding:60px; color:#aaa; font-size:16px;">
                No notifications yet.
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="n" items="${notificationList}">
                <article class="post ${n.read ? 'post-read' : 'post-unread'}">
                    <div class="post-left">
                        <div class="mini-avatar"></div>
                        <div>
                            <h4>Admin</h4>
                            <p>${n.notificationMessage}</p>
                            <small style="color:#aaa; font-size:11px;
                                          display:block; margin-top:4px;">
                                ${n.notificationDate} &nbsp; ${n.notificationTime}
                            </small>
                        </div>
                    </div>
                    <div class="post-buttons">
                        <a href="<%=request.getContextPath()%>/user/notification?action=markRead"
                           class="action-btn">Mark as Read</a>
                    </div>
                </article>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</section>

</body>
</html> --%>


<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Notification History</title>

<link rel="stylesheet"
href="<%=request.getContextPath()%>/CSS/userNav.css">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/CSS/util.css">

<link rel="stylesheet"
href="<%=request.getContextPath()%>/CSS/notification.css">

</head>

<body>

<%@ include file="userPortal.jsp" %>

<!-- TABS -->

<nav class="tabs">

    <div class="tabs-inner">

        <a href="<%=request.getContextPath()%>/user">

            Profile

        </a>

        <a href="<%=request.getContextPath()%>/user/joined">

            Joined Communities

        </a>

        <a href="<%=request.getContextPath()%>/user/bookmark">

            Bookmark

        </a>

        <a href="<%=request.getContextPath()%>/user/notification"
           class="active">

            Notification

        </a>

        <a href="<%=request.getContextPath()%>/user/setting">

            Settings

        </a>

    </div>

</nav>

<!-- TITLE -->

<div class="title">

    <div class="title-heading">

        <h1>Notification History</h1>

    </div>

</div>

<!-- POSTS -->

<section class="posts">

    <c:choose>

        <c:when test="${empty notificationList}">

            <div style="
                text-align:center;
                padding:60px;
                color:#aaa;
                font-size:16px;
            ">

                No notifications yet.

            </div>

        </c:when>

        <c:otherwise>

            <c:forEach var="n"
                       items="${notificationList}">

                <article class="post
                    ${n.read ? 'post-read' : 'post-unread'}">

                    <div class="post-left">

                        <div class="mini-avatar"></div>

                        <div>

                            <h4>Admin</h4>

                            <p>

                                ${n.notificationMessage}

                            </p>

                            <small style="
                                color:#aaa;
                                font-size:11px;
                                display:block;
                                margin-top:4px;
                            ">

                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}

                            </small>

                        </div>

                    </div>

                </article>

            </c:forEach>

        </c:otherwise>

    </c:choose>

</section>

</body>
</html>