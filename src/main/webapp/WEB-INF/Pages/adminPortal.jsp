<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/adminNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/admin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>


 <header class="top">
    <a a href="<%=request.getContextPath()%>/admin/dashboard"><i class="fa-solid fa-circle-arrow-left"></i></a>
  </header>

  <section class="profile-header">
    <div class="avatar">
     <c:choose>
        <c:when test="${not empty user.profilePictureBase64}">
             <img src="data:image/jpeg;base64,${user.profilePictureBase64}"
                 alt="Profile Picture">
        </c:when>
        <c:otherwise>
            <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg" 
                 alt="Profile Picture">
        </c:otherwise>
    </c:choose>
    </div>
    
    <div class="user-info">
      <h2>${user.firstName} ${user.lastName}</h2>
      <p>${user.bio}</p>
    </div>
    <button class="edit-btn"><a href="<%=request.getContextPath()%>/admin/edit">Edit Profile</a></button>
  </section>


    <div class="profile_desc">
        <div class="personal_info">
        <h2> Personal Information </h2>
        <ul> 
          <li>Full Name : ${user.firstName} ${user.lastName}</li>
			<li>Username : ${user.username}</li>
			<li>Email ID : ${user.email}</li>
			<li>Date of Birth : ${user.dob}</li>
			<li>Bio : ${user.bio}</li>
        </ul>
        </div>
    
    <div class="recent_act">
       <h2>Recent Activity</h2>
       <ul>
        <li>Banned User Vik_Star for racism stuff</li>
        <li>Community Updates and Changes</li>
        <li>New User Added to the System</li>
        <li>Removed Posts relating to Violence </li>
        <li>Created New Community “Marvel_Fanbase”</li>
       </ul>
    </div>
    </div>

    <div class="dashboard">
        <div class="badge">
        <button class="badge-btn">${user.status}</button>
        <button class="badge-btn">Created At: ${user.created_At}</button>
        </div>
        <div class="action">
        <div class="action-box">
          <p>Community Created</p>
          <h2>${totalCommunities}</h2>
        </div>
        

        <div class="action-box">
          <p>Notification</p>
          <h2>1,000</h2>
        </div>

         <div class="action-box">
          <p>Total User Banned</p>
          <h2>${totalBannedUsers}</h2>
        </div>

        </div>

        
    </div>
</body>

</html>