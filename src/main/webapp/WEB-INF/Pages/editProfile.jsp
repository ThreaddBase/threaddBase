<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Profile</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/editProfile.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/utill.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

  <%-- Toast: success --%>
  <c:if test="${param.msg == 'updated'}">
    <div class="toast success">
      <i class="fa-solid fa-circle-check"></i>
      Profile updated successfully!
    </div>
  </c:if>

  <%-- Toast: profile error --%>
  <c:if test="${not empty profileError}">
    <div class="toast error">
      <i class="fa-solid fa-circle-exclamation"></i>
      ${profileError}
    </div>
  </c:if>

  <%-- Toast: password error --%>
  <c:if test="${not empty passError}">
    <div class="toast error">
      <i class="fa-solid fa-circle-exclamation"></i>
      ${passError}
    </div>
  </c:if>

  <nav class="navbar"></nav>
  <div class="card-title">
    <a href="${backURL}" title="Go back">
      <i class="fa-solid fa-circle-arrow-left"></i>
    </a>
  </div>

  <div class="page">
    <div class="card-wrap">

      <%-- Avatar --%>
      <div class="profile_img">
        <c:choose>
          <c:when test="${not empty user.profilePictureBase64}">
            <img src="data:image/jpeg;base64,${user.profilePictureBase64}" alt="Profile Picture">
          </c:when>
          <c:otherwise>
            <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg"
                 alt="Profile Picture">
          </c:otherwise>
        </c:choose>
      </div>

      <form action="${formAction}" method="post" enctype="multipart/form-data"
            style="width:100%; display:flex; flex-direction:column; align-items:center;">

        <%-- Upload --%>
        <label for="file-upload" class="upload-label">
          <i class="fa-solid fa-camera" style="margin-right:5px;"></i>Upload Photo
        </label>
        <input id="file-upload" type="file" name="profilePicture" accept="image/*" style="display:none;">

        <hr class="divider">

        <%-- Profile info --%>
        <div class="section">
          <div class="field">
            <label for="username">Username</label>
            <input id="username" type="text" name="username" value="${user.username}" placeholder="Username">
          </div>
          <div class="field">
            <label for="firstName">First Name</label>
            <input id="firstName" type="text" name="firstName" value="${user.firstName}" placeholder="First name">
          </div>
          <div class="field">
            <label for="lastName">Last Name</label>
            <input id="lastName" type="text" name="lastName" value="${user.lastName}" placeholder="Last name">
          </div>
        </div>

        <hr class="divider">

        <%-- Bio --%>
        <div class="section">
          <div class="field">
            <label for="bio">Bio</label>
            <textarea id="bio" name="bio" placeholder="Tell us about yourself…">${user.bio}</textarea>
          </div>
        </div>

        <hr class="divider">

        <%-- DOB --%>
        <div class="section">
          <div class="field">
            <label for="dob">Date of Birth</label>
            <input id="dob" type="date" name="dob" value="${user.dob}" placeholder="YYYY-MM-DD">
          </div>
        </div>

        <hr class="divider">

        <%-- Password --%>
        <div class="section">
          <div class="field">
            <label for="currentPass">Current Password</label>
            <input id="currentPass" type="password" name="currentPass" placeholder="••••••••">
          </div>
          <div class="field">
            <label for="newPass">New Password</label>
            <input id="newPass" type="password" name="newPass" placeholder="••••••••">
          </div>
          <div class="field">
            <label for="retypePass">Retype Password</label>
            <input id="retypePass" type="password" name="retypePass" placeholder="••••••••">
          </div>
        </div>

        <hr class="divider">

        <%-- Buttons --%>
        <div class="buttons">
          <button class="btn-save" type="submit">Save Changes</button>
          <button class="btn-discard" type="button" onclick="location.href='${backURL}'">Discard</button>
        </div>

      </form>
    </div>
  </div>

</body>
</html>