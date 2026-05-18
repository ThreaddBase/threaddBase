<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notification.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
	integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <%@ include file="userPortal.jsp" %>

        <nav class="tabs">
            <div class="tabs-inner">
                <a href="/Threaddbase/user">Profile</a>
                <a href="/Threaddbase/user/joined">Joined Communities</a>
                <a href="/Threaddbase/user/bookmark">Bookmark</a>
                <a href="/Threaddbase/user/notification" class="active">Notification</a>
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
                    <c:forEach var="n" items="${notificationList}">
                        <article class="post ${n.read ? 'post-read' : 'post-unread'}">
                            <div class="post-left">
                                <div class="mini-avatar"><i class="fa-solid fa-bell"></i></div>
                                <div>
                                    <h4>Admin</h4>
                                    <p> ${n.notificationMessage}</p>

                                    <small style="
                                                color:#aaa;
                                                font-size:11px;
                                                display:block;
                                                margin-top:4px;
                                            ">

                                        ${n.notificationDate} &nbsp; ${n.notificationTime}
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