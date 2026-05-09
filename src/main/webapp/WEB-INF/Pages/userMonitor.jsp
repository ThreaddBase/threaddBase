<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userMonitor.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>User Monitor</title>
</head>
<body>
    <!-- ========================
       LEFT SIDEBAR
  ========================= -->
	<%@ include file="adminSidebar.jsp" %>
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
			    <span>Reports</span>
			    <span>Status</span>
			    <span></span>
			</div>
			
            <c:forEach var="user" items="${userList}">
            <div class="user-row">
			    <div class="user-name-cell">
				    <c:choose>
				        <c:when test="${not empty user.profilePictureBase64}">
				            <img class="user-avatar"
				                 src="data:image/jpeg;base64,${user.profilePictureBase64}"
				                 alt="avatar"/>
				        </c:when>
				        <c:otherwise>
				            <img class="user-avatar"
				                 src="<%=request.getContextPath()%>/Assets/default-avatar.jpg"
				                 alt="avatar"/>
				        </c:otherwise>
				    </c:choose>
				    <span>${user.firstName} ${user.lastName}</span>
				</div>

                    Email
                    <div class="user-email">${user.email}</div>

                    Post Count
                    <div class="user-post">${user.postCount}</div>

                    Comment Count
                    <div class="user-comment">${user.commentCount}</div>

                    Report Count
                    <div class="user-report">${user.reportCount}</div>

                    Status Badge
                    <div class="user-status">
                        <c:choose>
                            <c:when test="${user.status == 'Active'}">
                                <span class="status-badge active">Active</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-badge banned">Banned</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    Actions
                    <div class="user-actions">
                        <button class="actions-btn">Action</button>
                    </div>

                </div>
            </c:forEach>
            
            <c:if test="${empty userList}">
                <div class="no-data">No users found.</div>
            </c:if>
        <!-- end table area -->
		</div>
    </div>
    <!-- end main content -->
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userMonitor.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>User Monitor</title>
</head>
<body>
    <%@ include file="adminSidebar.jsp" %>

    <div class="main-content">

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
            <h1 class="page-heading">Monitor &amp; Manage<br>the Users</h1>
            <button class="filter-btn">Filter/Sort</button>
        </div>

        <div class="table-area">

            <div class="table-headers">
                <span>User</span>
                <span>Email Address</span>
                <span>Post</span>
                <span>Comment</span>
                <span>Reports</span>
                <span>Status</span>
                <span></span>
            </div>

            <c:forEach var="user" items="${userList}">
                <div class="user-row">
                    <div class="user-name-cell">
                        <c:choose>
                            <c:when test="${not empty user.profilePictureBase64}">
                                <img class="user-avatar"
                                     src="data:image/jpeg;base64,${user.profilePictureBase64}"
                                     alt="avatar"/>
                            </c:when>
                            <c:otherwise>
                                <img class="user-avatar"
                                     src="<%=request.getContextPath()%>/Assets/default-avatar.jpg"
                                     alt="avatar"/>
                            </c:otherwise>
                        </c:choose>
                        <span>${user.firstName} ${user.lastName}</span>
                    </div>

                    <div class="user-email">${user.email}</div>
                    <div class="user-post">${user.postCount}</div>
                    <div class="user-comment">${user.commentCount}</div>
                    <div class="user-report">${user.reportCount}</div>

                    <div class="user-status">
                        <c:choose>
                            <c:when test="${user.status == 'Active'}">
                                <span class="status-badge active">Active</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-badge banned">Banned</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Action dropdown using pure CSS details/summary -->
                    <div class="user-actions">
                        <details class="action-dropdown">
                            <summary class="actions-btn">
                                Action <i class="fas fa-chevron-down action-chevron"></i>
                            </summary>
                            <ul class="action-menu">
                                <li>
                                    <a href="<%=request.getContextPath()%>/admin/updateStatus?id=${user.id}&status=Active"
                                       class="action-option action-active">
                                        <i class="fas fa-circle-check"></i> Active
                                    </a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/admin/updateStatus?id=${user.id}&status=Banned"
                                       class="action-option action-banned">
                                        <i class="fas fa-ban"></i> Banned
                                    </a>
                                </li>
                            </ul>
                        </details>
                    </div>

                </div>
            </c:forEach>

            <c:if test="${empty userList}">
                <div class="no-data">No users found.</div>
            </c:if>
        </div>
    </div>
<script>
    document.querySelectorAll('.action-dropdown').forEach(function(details) {
        details.addEventListener('toggle', function() {
            if (details.open) {
                var btn = details.querySelector('.actions-btn');
                var rect = btn.getBoundingClientRect();
                var menu = details.querySelector('.action-menu');
                menu.style.top  = (rect.bottom + 6) + 'px';
                menu.style.left = (rect.left + rect.width / 2 - 65) + 'px';
            }
        });
    });
</script>
</body>
</html>