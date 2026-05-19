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
                <a href="<%=request.getContextPath()%>/admin">Profile</a>
            </button>
        </div>

        <!-- Page heading + Filter button -->
        <div class="heading-row">
            <h1 class="page-heading">Monitor &amp; Manage<br>the Users</h1>
              
              
        <form action="<%=request.getContextPath()%>/admin/userManagement" method="get">
		  <div class="select-wrapper">
        <select name="filterStatus" onchange="this.form.submit()" class="filter-btn">
            <option value="all"    ${selectedFilter == 'all'          ? 'selected' : ''}>Filter/Sort</option>
            <option value="active" ${selectedFilter == 'active' ? 'selected' : ''}>Active</option>
            <option value="banned"  ${selectedFilter == 'banned'  ? 'selected' : ''}>Banned</option>
        </select>
		  </div>
		</form>
		
		
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

                    <div class="actions-btn">
               <form action="<%=request.getContextPath()%>/admin/userManagement" method="post">
			    <input type="hidden" name="action" value="updateStatus"/>
			    <input type="hidden" name="userId" value="${user.id}"/>
			    <div class="user-actions">
			        <select name="status" onchange="this.form.submit()">
			            <option value="" disabled selected>Action</option>
			            <option value="active" ${user.status == 'Active' ? 'selected' : ''}>Active</option>
			            <option value="banned" ${user.status == 'Banned' ? 'selected' : ''}>Banned</option>
			        </select>
			    </div>
			</form>
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
</html>