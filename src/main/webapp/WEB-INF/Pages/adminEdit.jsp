<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/adminEdit.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/utill.css">
<body>
   <div class="card-title">Edit Profile</div>
	<div class="card-wrap">

  <div class="profile_img">
    <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg" alt="Profile Picture">
  </div>

    <form action="<%=request.getContextPath()%>/adminEdit" enctype="multipart/form-data" method="post" class="change">
     
     	<!-- Hide the real input, style the label as a button -->
		<label for="file-upload" style="cursor: pointer; padding: 8px 16px; border: 1px solid #ccc; border-radius: 6px; display: inline-block;">
		  Upload Profile pic
		</label>
		<input id="file-upload" type="file" name="image" accept="image/*" style="display: none;" />
    </form>

    <div class="profile-section">
      <div>
        <label>Username</label>
        <input type="text" value="Harry_Newgate3290">
      </div>
      <div>
        <label>Full Name</label>
        <input type="text" value="Harry Newgate">
      </div>
    </div>

    <div class="bio">
      <label>Bio</label>
      <textarea>Lorem ipsum dolor, sit amet consectetur  adipisicing elit. Laboriosam rerum explicabo consequatur eligendi  excepturi sit praesentium ex. </textarea>
    </div>

    <div class="DOB">
      <label>Date of Birth</label>
      <input type="text" value="21-09-1999">
    </div>

    <div class="password">
      <label>Current Password</label>
      <input type="password" value="">
      <label>New Password</label>
      <input type="password" value="">
      <label>Retype Password</label>
      <input type="password" value="">
    </div>

    <div class="buttons">
      <button class="btn"> Discard Change</button>
      <button class="btn">Save Changes</button>
  </div>
  
</div>
	
</body>
</html>