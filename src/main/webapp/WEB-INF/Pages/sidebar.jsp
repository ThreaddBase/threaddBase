<input type="checkbox" id="notiToggle" <c:if test="${openPopup}"> checked </c:if> >

<div class="side-navbar">
    <a href="#" class="logo-container">
        <img src="<%=request.getContextPath()%>/Assets/logo_white.png" class="logo" alt="logo">
    </a>
    <div class="bar"></div>
    <ul class="nav-links">
        <li>
            <a href="<%=request.getContextPath()%>/user/home">
                <i class="fas fa-home"></i> <span>Home</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/community">
                <i class="fa-solid fa-user-group"></i> <span>Community</span>
            </a>
        </li>
        <li>
            <label for="notiToggle" class="noti-btn">
                <i class="fa-solid fa-bell"></i>
                <span>Notification</span>
            </label>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/logout">
                <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
            </a>
        </li>
    </ul>
</div>
<%@ include file="notificationModel.jsp" %>