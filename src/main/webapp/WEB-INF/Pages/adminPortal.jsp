<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/admin.css">
</head>
<body>


 <header class="navbar">
    <div class="menu">☰</div>
  </header>

  <section class="profile-header">
    <div class="avatar"></div>
    <div class="user-info">
      <h2>Harry Newgate</h2>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
    </div>
    <button class="edit-btn">Edit Profile</button>
  </section>


    <div class="profile_desc">
        <div class="personal_info">
        <h2> Personal Information </h2>
        <ul> 
           <li>Full Name  :  Olatunji Victor San </li> 
           <li>Username  :  VictorDada</li>
           <li>Email ID  :  Olaunji_Olatunje_San@gmail.com</li>
           <li>Date of Birth  :  1999/07/11</li>
           <li>Phone No.  :  9861411701</li>
           <li>Language  :  English (UK)</li>
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
        <button class="badge-btn">Active</button>
        <button class="badge-btn">Since Jan 2022</button>
        </div>
        <div class="action">

        <div class="action-box">
          <p>Actions Taken</p>
          <h2>1,000</h2>
        </div>

        <div class="action-box">
          <p>Actions Taken</p>
          <h2>1,000</h2>
        </div>

         <div class="action-box">
          <p>Actions Taken</p>
          <h2>1,000</h2>
        </div>

        </div>

        
    </div>
</body>

</html>