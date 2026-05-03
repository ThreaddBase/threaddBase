<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/dashboard.css">

</head>
<body>

 <!-- ========================
       LEFT SIDEBAR
  ========================= -->
  <div class="side-navbar">

    <!-- Decorative light strip -->
    <div class="bar"></div>

    <!-- Logo -->
    <a href="#" class="logo-container">
      <img src="images/logo_white.png" alt="threadbase logo" class="logo">
    </a>

    <!-- Nav links -->
    <ul class="nav-links">

      <li>
        <a href="dashboard.html" class="active">
          <i class="fas fa-chart-line"></i>
          <span class="link-text">Dashboard</span>
        </a>
      </li>

      <li>
        <a href="community.html">
          <i class="fa-solid fa-user-group"></i>
          <span class="link-text">Community</span>
        </a>
      </li>

      <li>
        <a href="monitor.html" class="active">
          <i class="fas fa-users-cog"></i>
          <span class="link-text">User Management</span>
        </a>
      </li>

      <li>
        <a href="#">
          <i class="fas fa-sign-out-alt"></i>
          <span class="link-text">Logout</span>
        </a>
      </li>

    </ul>
  </div>


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
        <span>Profile</span>
      </button>
    </div>
    <div class="heading-row">
            <h1 class="page-heading">Track &amp; Review<br>the Platform</h1>
            
        </div>
    <main class="dashboard-content">

      <div class="top-stats-row">
        <div class="left-stats">
          <div class="stat-card">
            <div class="stat-card-title">Total Users</div>
            <div class="stat-card-number">500</div>
          </div>
          <div class="stat-card">
            <div class="stat-card-title">Communities</div>
            <div class="stat-card-number">07</div>
          </div>
        </div>

        <div class="communities-card">
          <div class="communities-card-title">Top Communities</div>
          <div class="community-list-item">
            <span class="community-rank">1.</span>
            <span class="community-name">Community number 1</span>
            <span class="community-dash">–</span>
            <span class="community-count">109 Users</span>
          </div>
          <div class="community-list-item">
            <span class="community-rank">2.</span>
            <span class="community-name">Community number 2</span>
            <span class="community-dash">–</span>
            <span class="community-count">99 Users</span>
          </div>
          <div class="community-list-item">
            <span class="community-rank">3.</span>
            <span class="community-name">Community number 3</span>
            <span class="community-dash">–</span>
            <span class="community-count">90 Users</span>
          </div>
          <div class="community-list-item">
            <span class="community-rank">4.</span>
            <span class="community-name">Community number 4</span>
            <span class="community-dash">–</span>
            <span class="community-count">88 Users</span>
          </div>
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
                <circle cx="21" cy="21" r="11" fill="#e0e0e0" />
              </svg>
            </div>
          </div>

          <div class="legend-card">
            <div class="legend-title">legends</div>
            <div class="legend-item">
              <span class="legend-icon" style="color: #4ecdc4;">C</span>
              <span class="legend-label">Community 1</span>
            </div>
            <div class="legend-item">
              <span class="legend-icon" style="color: #d4a574;">C</span>
              <span class="legend-label">Community 2</span>
            </div>
            <div class="legend-item">
              <span class="legend-icon" style="color: #e05555;">C</span>
              <span class="legend-label">Community 3</span>
            </div>
          </div>

        </div>

        <div class="report-card">
          <div class="report-card-header">
            <span class="report-card-title">Report Status</span>
            <button class="generate-btn">Generate Report</button>
          </div>
          <div class="report-admin-row">
            <span>Admin Name</span>
            <span>2026-09-11</span>
          </div>
          <div class="community-report-item">
            <span class="report-community-name">Community One</span>
            <button class="expand-btn">Expand</button>
          </div>
          <div class="community-report-item">
            <span class="report-community-name">Community Two</span>
            <button class="expand-btn">Expand</button>
          </div>
          <div class="community-report-item">
            <span class="report-community-name">Community Three</span>
            <button class="expand-btn">Expand</button>
          </div>
          <div class="community-report-item">
            <span class="report-community-name">Community Four</span>
            <button class="expand-btn">Expand</button>
          </div>
          <div class="community-report-item">
            <span class="report-community-name">Community Five</span>
            <button class="expand-btn">Expand</button>
          </div>
        </div>

      </div>

    </main>
  </div>

</body>
</html>