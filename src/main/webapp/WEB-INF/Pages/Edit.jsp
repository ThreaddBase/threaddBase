<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/Edit.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/utill.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>

<body>
<form action="${formAction}"
      method="post"
      enctype="multipart/form-data">
<div class="card-title"><i class="fa-solid fa-circle-arrow-left"></i><a a href=${backURL}>Edit Profile</a>

   </div>
 <div class="card-wrap">

  <div class="profile_img">
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


<label for="file-upload" style="cursor: pointer; padding: 8px 16px; border: 1px solid #ccc; border-radius: 6px; display: inline-block;">
    Upload Profile Picture
</label>
<input id="file-upload" type="file" name="profilePicture" accept="image/*" style="display: none;" />
    <!-- PROFILE -->
    <div class="profile-section">

        <label>Username</label>
        <input type="text"
               name="username"
               value="${user.username}">

        <label>First Name</label>
        <input type="text"
               name="firstName"
               value="${user.firstName}">

        <label>Last Name</label>
        <input type="text"
               name="lastName"
               value="${user.lastName}">
    </div>

    <!-- BIO -->
    <div class="bio">
        <label>Bio</label>

        <textarea name="bio">${user.bio}</textarea>
    </div>

    <!-- DOB -->
    <div class="DOB">
        <label>Date of Birth</label>

        <input type="text"
               name="dob"
               value="${user.dob}">
    </div>

    <!-- PASSWORD -->
    <div class="password">

        <label>Current Password</label>
        <input type="password" name="currentPass">

        <label>New Password</label>
        <input type="password" name="newPass">

        <label>Retype Password</label>
        <input type="password" name="retypePass">
    </div>

    <!-- BUTTON -->
    <div class="buttons">
        <button class="btn" type="submit">
            Save Changes
        </button>
        <button class="btn"type="button"
                    onclick="location.href='${backURL}'"> Discard Change</button>
    </div>

</form>
 
</div>

</body>
</html>