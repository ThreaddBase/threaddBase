<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			
			<c:forEach var="community" items="${communityList}">
				<div class="community-card">
                	<c:choose>
				        <c:when test="${not empty community.communityProfileBase64}">
				            <img class="community-thumb"
				                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
				                 alt="avatar"/>
				        </c:when>
				        <c:otherwise>
				            <img class="community-thumb"
				                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
				                 alt="avatar"/>
				        </c:otherwise>
				    </c:choose>
                <div class="card-details">
                    <div class="card-title">${community.name}</div>
                    <div class="card-created">Created at - ${community.createdAt}</div>
                    <div class="card-desc">${community.description}</div>
                    <div class="card-action-btns">
                        <button class="view-btn"><a href="<%=request.getContextPath()%>/community/view?id=${community.id}">View Community</a></button>
                        <button class="delete-btn">Delete Community</button>
                    </div>
                </div>
            </div>
				
			</c:forEach>
			
			<c:if test="${empty communityList}">
                <div class="no-data">No Community found.</div>
            </c:if>
        </div>
    </div>
</body>
</html>