<!--     <div class="noti-panel">
        <div class="noti-header">
            <h3>Notifications</h3>
            <button class="mark-as-read">Mark as Read</button>
        </div>
        <hr>
        <ul class="noti-list">
            <li><span>Shanice101 commented on your thread, “So true, wish it was me!”!</span></li>
            <li><span>BabaRamdev192 liked your thread!</span></li>
            <li><span>Harleyman900 replied to your comment, “Yea, that does happen from time t...</span></li>
            <li><span>Your post, “Check out my pet rock!” got 3 reports!</span></li>
            <li><span>David292 mentioned you in a thread!</span></li>
            <li><span>Davie505 posted a new thread in “Animals_club” community. </span></li>
            <li><span>hyeana202 commented on your thread, “THAT IS DOPE DUDE!!”</span></li>
            <li><span>Shanice101 replied to your comment, “Is there any recommendations you give...</span></li>
        </ul>
    </div>

<script>
    const markAsReadBtn = document.querySelector('.mark-as-read');
    const notiItems = document.querySelectorAll('.noti-list li');

    markAsReadBtn.addEventListener('click', () => {
        notiItems.forEach(item => {
            item.style.opacity = '0.5';
        });
    });

    const notipanel = document.querySelector('.noti-panel');
    let notificationStatus = false;
    function showNotification() {
        if(notificationStatus) {
            notipanel.style.display = 'none';
            notificationStatus = false;
            return;
        }
        else {
            notipanel.style.display = 'block';
            notificationStatus = true;
        }
    }
</script> -->

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="noti-panel">
    <div class="noti-header">
        <h3>Notifications</h3>
        Mark as read sends GET to servlet then redirects back
        <a href="<%=request.getContextPath()%>/notification?action=markRead"
           class="mark-as-read">Mark as Read</a>
    </div>
    <hr>
    <ul class="noti-list">
        <c:choose>
            <c:when test="${empty notificationList}">
                <li><span>No notifications yet.</span></li>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <li>
                        <span>${n.notificationMessage}</span>
                        <small style="color:#aaa; font-size:11px; display:block; margin-top:4px;">
                            ${n.notificationDate} ${n.notificationTime}
                        </small>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="noti-panel">
    <div class="noti-header">
        <h3>Notifications</h3>
        <a href="<%=request.getContextPath()%>/user/notification"
           class="mark-as-read">Mark as Read</a>
    </div>
    <hr>
    <ul class="noti-list">
        <c:choose>
            <c:when test="${empty notificationList}">
                <li><span>No notifications yet.</span></li>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <li>
                        <span>${n.notificationMessage}</span>
                        <small style="color:#aaa; font-size:11px;
                                      display:block; margin-top:4px;">
                            ${n.notificationDate} &nbsp; ${n.notificationTime}
                        </small>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="noti-panel" id="notiPanel">
    <div class="noti-header">
        <h3>Notifications</h3>
        <a href="<%=request.getContextPath()%>/user/notification"
           class="mark-as-read">See All</a>
    </div>
    <hr>
    <ul class="noti-list">
        <c:choose>
            <c:when test="${empty notificationList}">
                <li><span style="color:#aaa;">No notifications yet.</span></li>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <li>
                        <span>${n.notificationMessage}</span>
                        <small>${n.notificationDate} &nbsp; ${n.notificationTime}</small>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="noti-panel">
    <div class="noti-header">
        <h3>Notifications</h3>
        <a href="<%=request.getContextPath()%>/user/notification"
           class="mark-as-read">Mark as Read</a>
    </div>
    <hr>
    <ul class="noti-list">
        <c:choose>
            <c:when test="${empty notificationList}">
                <li><span>No notifications yet.</span></li>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <li>
                        <span>${n.notificationMessage}</span>
                        <small style="color:#aaa; font-size:11px;
                                      display:block; margin-top:4px;">
                            ${n.notificationDate} &nbsp; ${n.notificationTime}
                        </small>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div> --%>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="noti-panel" id="notiPanel">
    <div class="noti-header">
        <h3>Notifications</h3>
        <a href="<%=request.getContextPath()%>/user/notification"
           class="mark-as-read">Mark as Read</a>
    </div>
    <hr>
    <ul class="noti-list">
        <c:choose>
            <c:when test="${empty notificationList}">
                <li><span>No notifications yet.</span></li>
            </c:when>
            <c:otherwise>
                <c:forEach var="n" items="${notificationList}">
                    <li>
                        <span>${n.notificationMessage}</span>
                        <small style="color:#aaa; font-size:11px;
                                      display:block; margin-top:4px;">
                            ${n.notificationDate} &nbsp; ${n.notificationTime}
                        </small>
                    </li>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </ul>
</div> --%>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <div class="noti-header">

        <h3>Notifications</h3>

        <a href="<%=request.getContextPath()%>/user/notification?action=markRead"
           class="mark-btn">
            Mark as Read
        </a>

    </div>

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">
                <div class="empty-noti">
                    No notifications yet.
                </div>
            </c:when>

            <c:otherwise>

                <c:forEach var="n" items="${notificationList}">

                    <div class="noti-item ${n.read ? 'read' : 'unread'}">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>${n.notificationMessage}</p>

                            <small>
                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}
                            </small>

                        </div>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">
            View All Notifications →
        </a>

    </div>

</div> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <div class="noti-header">

        <h3>Notifications</h3>

        <a href="<%=request.getContextPath()%>/user/notification?action=markRead"
           class="mark-btn">

            Mark as Read

        </a>

    </div>

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">

                <div class="empty-noti">
                    No notifications yet.
                </div>

            </c:when>

            <c:otherwise>

                <c:forEach var="n" items="${notificationList}">

                    <div class="noti-item ${n.read ? 'read' : 'unread'}">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>${n.notificationMessage}</p>

                            <small>
                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}
                            </small>

                        </div>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">

            View All Notifications →

        </a>

    </div>

</div> --%>



<%-- <%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false"%>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <!-- HEADER -->

    <div class="noti-header">

        <h3>Notifications</h3>

        <div class="header-actions">

            <a href="<%=request.getContextPath()%>/user/home?action=markRead&popup=open"
               class="mark-btn">

                Mark as Read

            </a>

            <!-- CLOSE BUTTON -->

            <label for="notiToggle"
                   class="close-btn">

                ×

            </label>

        </div>

    </div>

    <!-- SUCCESS MESSAGE -->

    <c:if test="${not empty successMessage}">

        <div class="success-box">

            ✓ ${successMessage}

        </div>

    </c:if>

    <!-- BODY -->

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">

                <div class="empty-noti">

                    No notifications yet.

                </div>

            </c:when>

            <c:otherwise>

                <c:forEach var="n"
                           items="${notificationList}">

                    <div class="noti-item
                        ${n.read ? 'read' : 'unread'}">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>

                                ${n.notificationMessage}

                            </p>

                            <small>

                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}

                            </small>

                        </div>

                        <c:if test="${n.read}">

                            <div class="tick-mark">

                                ✓

                            </div>

                        </c:if>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <!-- FOOTER -->

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">

            View All Notifications →

        </a>

    </div>

</div> --%>



<%-- <%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false"%>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <!-- HEADER -->

    <div class="noti-header">

        <h3>Notifications</h3>

        <div class="header-actions">

            <!-- MARK READ -->

            <a href="<%=request.getContextPath()%>/user/home?action=markRead"
               class="mark-btn">

                Mark as Read

            </a>

            <!-- CLEAR ALL -->

            <a href="<%=request.getContextPath()%>/user/home?action=clearAll"
               class="clear-btn">

                Clear All

            </a>

            <!-- CLOSE -->

            <label for="notiToggle"
                   class="close-btn">

                ×

            </label>

        </div>

    </div>

    <!-- SUCCESS -->

    <c:if test="${not empty successMessage}">

        <div class="success-box">

            ✓ ${successMessage}

        </div>

    </c:if>

    <!-- BODY -->

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">

                <div class="empty-noti">

                    No notifications yet.

                </div>

            </c:when>

            <c:otherwise>

                <c:forEach var="n"
                           items="${notificationList}">

                    <div class="noti-item
                    ${n.read ? 'read' : 'unread'}">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>

                                ${n.notificationMessage}

                            </p>

                            <small>

                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}

                            </small>

                        </div>

                        <c:if test="${n.read}">

                            <div class="tick-mark">

                                ✓

                            </div>

                        </c:if>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <!-- FOOTER -->

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">

            View All Notifications →

        </a>

    </div>

</div> --%>




<%-- <%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false"%>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <!-- HEADER -->

    <div class="noti-header">

        <h3>Notifications</h3>

        <div class="header-actions">

            <!-- MARK READ -->

            <a href="<%=request.getContextPath()%>/user/home?action=markRead"
               class="mark-btn">

                Mark as Read

            </a>

            <!-- CLEAR ALL -->

            <a href="<%=request.getContextPath()%>/user/home?action=clearAll"
               class="clear-btn">

                Clear All

            </a>

            <!-- CLOSE -->

            <label for="notiToggle"
                   class="close-btn">

                ×

            </label>

        </div>

    </div>

    <!-- SUCCESS -->

    <c:if test="${not empty successMessage}">

        <div class="success-box">

            ✓ ${successMessage}

        </div>

    </c:if>

    <!-- BODY -->

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">

                <div class="empty-noti">

                    No notifications yet.

                </div>

            </c:when>

            <c:otherwise>

                <c:forEach var="n"
                           items="${notificationList}">

                    <div class="noti-item
                    ${n.read ? 'read' : 'unread'}">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>

                                ${n.notificationMessage}

                            </p>

                            <small>

                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}

                            </small>

                        </div>

                        <c:if test="${n.read}">

                            <div class="tick-mark">

                                ✓

                            </div>

                        </c:if>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <!-- FOOTER -->

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">

            View All Notifications →

        </a>

    </div>

</div> --%>



<%-- <%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <!-- HEADER -->

    <div class="noti-header">

        <h3>Notifications</h3>

        <div class="header-actions">

            <!-- MARK READ -->

            <a href="<%=request.getContextPath()%>/user/home?action=markRead"
               class="mark-btn">

                Mark as Read

            </a>

            <!-- CLEAR POPUP -->

            <a href="<%=request.getContextPath()%>/user/home?action=clearPopup"
               class="clear-btn">

                Clear All

            </a>

            <!-- CLOSE -->

            <label for="notiToggle"
                   class="close-btn">

                ×

            </label>

        </div>

    </div>

    <!-- SUCCESS MESSAGE -->

    <c:if test="${not empty successMessage}">

        <div class="success-box">

            ✓ ${successMessage}

        </div>

    </c:if>

    <!-- BODY -->

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">

                <div class="empty-noti">

                    No notifications in popup.

                </div>

            </c:when>

            <c:otherwise>

                <c:forEach var="n"
                           items="${notificationList}">

                    <div class="noti-item
                    ${n.read ? 'read' : 'unread'}">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>

                                ${n.notificationMessage}

                            </p>

                            <small>

                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}

                            </small>

                        </div>

                        <c:if test="${n.read}">

                            <div class="tick-mark">

                                ✓

                            </div>

                        </c:if>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <!-- FOOTER -->

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">

            View All Notifications →

        </a>

    </div>

</div>

 --%>
 
 
 
 
 <%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
isELIgnored="false"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<div class="notification-overlay"></div>

<div class="noti-panel">

    <!-- HEADER -->

    <div class="noti-header">

        <h3>Notifications</h3>

        <div class="header-actions">

            <!-- MARK READ -->

            <a href="<%=request.getContextPath()%>/user/home?action=markRead"
               class="mark-btn">

                Mark as Read

            </a>

            <!-- CLOSE -->

            <label for="notiToggle"
                   class="close-btn">

                ×

            </label>

        </div>

    </div>

    <!-- SUCCESS -->

    <c:if test="${not empty successMessage}">

        <div class="success-box">

            ✓ ${successMessage}

        </div>

    </c:if>

    <!-- BODY -->

    <div class="noti-body">

        <c:choose>

            <c:when test="${empty notificationList}">

                <div class="empty-noti">

                    No unread notifications.

                </div>

            </c:when>

            <c:otherwise>

                <c:forEach var="n"
                           items="${notificationList}">

                    <div class="noti-item unread">

                        <div class="dot"></div>

                        <div class="noti-content">

                            <p>

                                ${n.notificationMessage}

                            </p>

                            <small>

                                ${n.notificationDate}
                                &nbsp;
                                ${n.notificationTime}

                            </small>

                        </div>

                    </div>

                </c:forEach>

            </c:otherwise>

        </c:choose>

    </div>

    <!-- FOOTER -->

    <div class="noti-footer">

        <a href="<%=request.getContextPath()%>/user/notification">

            View All Notifications →

        </a>

    </div>

</div>