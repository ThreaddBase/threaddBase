<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/adminHome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/createNotification.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Admin Home</title>
</head>
<body>
  <%@ include file="adminSidebar.jsp" %>
<%@ include file="createNotification.jsp" %>

  <!-- MAIN CONTENT -->
 <div class="main-content">

    <!-- Top bar: Search + Profile -->
    <div class="top-bar">
      <div class="search-box">
        <input type="text" placeholder="Search" />
        <i class="fas fa-magnifying-glass"></i>
      </div>
      <button class="profile-btn">
        <i class="fas fa-circle-user"></i>
        <a href="<%=request.getContextPath()%>/admin">Profile</a>
      </button>
    </div>
    
    <div class="heading-row">
            <h1 class="page-heading">Track &amp; Review<br>the Platform</h1>
            <label for="notifToggle" class="cn-trigger-btn">
		        <i class="fas fa-bell"></i> Send Notification
		    </label>
        </div>
    <main class="dashboard-content">

      <div class="top-stats-row">
        <div class="left-stats">
          <div class="stat-card">
            <div class="stat-card-title">Total Users</div>
            <div class="stat-card-number">${totalUser}</div>
          </div>
          <div class="stat-card">
            <div class="stat-card-title">Communities</div>
            <div class="stat-card-number">${totalCommunity}</div>
          </div>
        </div>

        <div class="communities-card">
          <div class="communities-card-title">Top Communities</div>
          <!-- dynamically change community numebr -->
          
          <c:forEach var="c" items="${topCommunity}" varStatus="count">
          		<div class="community-list-item">
          			<span class="community-rank">${count.index + 1}</span>
            		<span class="community-name">${c.name}</span>
            		<span class="community-dash">–</span>
            		<span class="community-count">${c.userCount}</span>
          		</div>
          </c:forEach>
        </div>
      </div>

      <hr class="section-divider" />

      <div class="bottom-section">

        <div class="left-bottom">

          <div class="status-card">
            <div class="status-card-title">Community Status</div>
            <div class="donut-wrapper">
              <svg class="donut-chart" viewBox="0 0 42 42" xmlns="http://www.w3.org/2000/svg">
                <circle cx="21" cy="21" r="15.9155" fill="transparent"
                  stroke="#4ecdc4" stroke-width="6"
                  stroke-dasharray="25 75"
                  stroke-dashoffset="0"
                  transform="rotate(-90 21 21)" />
                <circle cx="21" cy="21" r="15.9155" fill="transparent"
                  stroke="#d4a574" stroke-width="6"
                  stroke-dasharray="40 60"
                  stroke-dashoffset="-25"
                  transform="rotate(-90 21 21)" />
                <circle cx="21" cy="21" r="15.9155" fill="transparent"
                  stroke="#e05555" stroke-width="6"
                  stroke-dasharray="35 65"
                  stroke-dashoffset="-65"
                  transform="rotate(-90 21 21)" />
                <circle cx="21" cy="21" r="11" fill="#393E46" />
              </svg>
            </div>
          </div>

          <div class="legend-card">
           <div class="status-card-title">Requested Communities</div>
            <c:forEach var= "requestCommunity" items="${topRequestedNames}">
			    <div class="legend-item">
			        <span class="legend-label">${requestCommunity.communityName}</span>
			    </div>
			</c:forEach>
		</div>

        </div>

        <div class="report-card">
          <div class="report-card-header">
            <span class="report-card-title">Report Status</span>

          </div>
          <div class="report-admin-row">
            <span>${AdminName}</span>
            <span>${today}</span>
          </div>
          
          <c:forEach var="c" items="${allCommunity}">
	          <div class="community-report-item">
	            <span class="report-community-name">${c.name}</span>
	            <button class="expand-btn">
	            <a href ="<%=request.getContextPath()%>/community/view?id=${c.id}">Get Me There </a>
	            </button>
	          </div>
          </c:forEach>
        </div>
      </div>
    </main>
  </div>
</body>
</html>