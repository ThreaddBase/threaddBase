<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userEdit.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/utill.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<body>
<form action="<%=request.getContextPath()%>/user/edit" method="post"  enctype="multipart/form-data">
   <div class="card-title"><i class="fa-solid fa-backward"> </i><a a href="<%=request.getContextPath()%>/user">Edit Profile</a>

   </div>
	<div class="card-wrap">

  <div class="profile_img">
    <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg" alt="Profile Picture">
  </div>

    <form action="<%=request.getContextPath()%>/userEdit" enctype="multipart/form-data" method="post" class="change">
     
     	<!-- Hide the real input, style the label as a button -->
		<label for="file-upload" style="cursor: pointer; padding: 8px 16px; border: 1px solid #ccc; border-radius: 6px; display: inline-block;">
		  Upload Profile pic
		</label>
		<input id="file-upload" type="file" name="image" accept="image/*" style="display: none;" />
    </form>

    <div class="profile-section">
      <div>
        <label>Username</label>
        <input type="text" name="username" value="Harry_Newgate3290">
      </div>
      <div>
        <label>First Name</label>
        <input type="text" name="f-name" value="Harry">
      </div>
      <div>
        <label>Last Name</label>
        <input type="text" name="l-name" value="Newgate">
      </div>
    </div>

    <div name ="bio" class="bio">
      <label>Bio</label>
      <textarea>Lorem ipsum dolor, sit amet consectetur  adipisicing elit. Laboriosam rerum explicabo consequatur eligendi  excepturi sit praesentium ex. </textarea>
    </div>

    <div class="DOB">
      <label>Date of Birth</label>
      <input name = "dob" type="text" value="21-09-1999">
    </div>

    <div class="password">
      <label>Current Password</label>
      <input name="c-pass"type="password" value="">
      <label>New Password</label>
      <input name="n-pass"type="password" value="">
      <label>Retype Password</label>
      <input name = "r-pass" type="password" value="">
    </div>

    <div class="buttons">
      <button class="btn"> Discard Change</button>
      <button class="btn" type="submit">Save Changes</button>
  </div>
  
</div>
	
</body>
</html>