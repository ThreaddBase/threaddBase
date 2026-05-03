<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/communityManagement.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Community Management</title>
</head>
<body>
 <!-- SIDEBAR -->
    <%@ include file="adminSidebar.jsp" %>

    <!-- MAIN CONTENT -->
    <div class="main-content">

        <!-- Search centered + Profile pinned right -->
        <div class="top-bar">
            <div class="search-box">
                <input type="text" placeholder="Search" />
                <i class="fas fa-magnifying-glass"></i>
            </div>
            <button class="profile-btn">
                <i class="fas fa-circle-user"></i>
                <span>Profile</span>
            </button>
        </div>

        <!-- Title on left, Create + Filter buttons on right -->
        <div class="heading-row">
            <h1 class="page-heading">Manage, Monitor &amp;<br>Moderate the<br>Communities</h1>
            <div class="heading-buttons">
                <button class="create-community-btn">Create a new community</button>
                <div class="btn-sep"></div>
                <button class="filter-sort-btn">Filter/Sort</button>
            </div>
        </div>

        <!-- COMMUNITY CARDS -->
        <div class="community-list">

            <div class="community-card">
                <img class="community-thumb"
                    src="https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop"
                    alt="Community image" />
                <div class="card-details">
                    <div class="card-title">Community Name</div>
                    <div class="card-created">Created at - 2023-10-28</div>
                    <div class="card-desc">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
                        explicabo consequatur ex...</div>
                    <div class="card-action-btns">
                        <button class="view-btn">View Community</button>
                        <button class="delete-btn">Delete Community</button>
                    </div>
                </div>
            </div>

            <div class="community-card">
                <img class="community-thumb"
                    src="https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop"
                    alt="Community image" />
                <div class="card-details">
                    <div class="card-title">Community Name</div>
                    <div class="card-created">Created at - 2023-10-28</div>
                    <div class="card-desc">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
                        explicabo consequatur ex...</div>
                    <div class="card-action-btns">
                        <button class="view-btn">View Community</button>
                        <button class="delete-btn">Delete Community</button>
                    </div>
                </div>
            </div>

            <div class="community-card">
                <img class="community-thumb"
                    src="https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop"
                    alt="Community image" />
                <div class="card-details">
                    <div class="card-title">Community Name</div>
                    <div class="card-created">Created at - 2023-10-28</div>
                    <div class="card-desc">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
                        explicabo consequatur ex...</div>
                    <div class="card-action-btns">
                        <button class="view-btn">View Community</button>
                        <button class="delete-btn">Delete Community</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>