
<div class="notification-overlay"></div>
<div class="noti-panel">

    <!-- HEADER -->
    <div class="noti-header">
        <h3>Notifications</h3>
        <div class="header-actions">

            <!-- MARK READ -->
            <a href="<%=request.getContextPath()%>/user/home?action=markRead" class="mark-btn">
                Mark as Read
            </a>

            <!-- CLOSE -->
            <label for="notiToggle" class="close-btn">
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
                <c:forEach var="n" items="${notificationList}">
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