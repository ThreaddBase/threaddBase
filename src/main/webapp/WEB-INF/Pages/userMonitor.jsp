<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userMonitor.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>User Monitor</title>
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


    <!-- ========================
       MAIN CONTENT
  ========================= -->
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

        <!-- Page heading + Filter button -->
        <div class="heading-row">
            <h1 class="page-heading">Monitor &amp; Manage<br>the Users</h1>
            <button class="filter-btn">Filter/Sort</button>
        </div>

        <!-- User table -->
        <div class="table-area">

            <!-- Column headers -->
            <div class="table-headers">
                <span>User</span>
                <span>Email Address</span>
                <span>Post</span>
                <span>Comment</span>
                <span></span>
            </div>

            <!-- User row 1 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 2 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 3 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 4 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 5 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 6 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 7 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 8 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 9 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 10 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 11 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 12 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 13 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

            <!-- User row 14 -->
            <div class="user-row">
                <div class="user-name-cell">
                    <div class="user-avatar"></div>
                    <span>Jhon DOE</span>
                </div>
                <div class="user-email">DoetheJhon122@gmail.com</div>
                <div class="user-post">103</div>
                <div class="user-comment">921</div>
                <div class="user-actions">
                    <button class="actions-btn">Actions</button>
                    <span class="three-dots">&#8942;</span>
                </div>
            </div>

        </div>
        <!-- end table area -->

    </div>
    <!-- end main content -->
</body>
</html>