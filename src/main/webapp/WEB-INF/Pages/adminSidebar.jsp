<div class="side-navbar">
    <a href="#" class="logo-container">
        <img src="<%=request.getContextPath()%>/Assets/logo_white.png" class="logo" alt="logo">
    </a>
    <div class="bar"></div>
    <ul class="nav-links">
        <li>
            <a href="<%=request.getContextPath()%>/admin/home">
                <i class="fas fa-chart-line"></i> <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/admin/community">
                <i class="fa-solid fa-user-group"></i> <span>Community</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/admin/userManagement">
                <i class="fas fa-users-cog"></i> <span>User</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/logout">
                <i class="fas fa-sign-out-alt"></i> <span>Logout</span>
            </a>
        </li>
    </ul>
</div>