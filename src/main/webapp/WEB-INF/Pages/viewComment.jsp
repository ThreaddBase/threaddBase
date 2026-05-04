<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Comments</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewComment.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>			
	
<div class="comment-bar">
	<a href="#" class="logo-container">
        <img src="<%=request.getContextPath()%>/Assets/logo_white.png" class="logo" alt="logo">
    </a>
    <div class="search-container">
        <input type="text" placeholder="Search...">
        <button><i class="fas fa-search"></i></button>
    </div>
    <div class="user-profile">
        <div class="avatar"></div>
        <span class="username">John Doe</span>
    </div>
</div>
  
<div class="profile">
    <div class="back">
 <span class="icon-park-solid--back"></span>
    </div>

 <div class="avatar">
    <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg" alt="blank">
 </div>
 <div class="content">
 <h1>Username </h1>
<span>2026/01/01 - 1y</span>
 <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.<br>
    Laboriosam rerum explicabo consequatur eligendi excepturi sit<br>
    praesentium ex. </p>
 </div>
</div>
<div class="main_content">
    <img src="https://external-preview.redd.it/jannik-sinner-madrid-open-win-against-alexander-zverev-sets-v0-bxlfQEu-8mU8OQ_u55qG3Eqlw73nE0IwHMknGU5e3dw.jpeg?auto=webp&s=26f25e89ace734d55002528e4a09268941ab5a0a" alt="cricket">
</div>
<div class="post-actions">
    <div class="vote">
            <span><i class="fa-regular fa-circle-check"></i> 101</span>
    </div>
    <div class="message">
        <span><i class="fa-regular fa-comment"></i> 101</span>
    </div>
    <div class="bookmark">
        <span><i class="fa-regular fa-bookmark"></i> 101</span>
    </div>
    <div class="report">
        <span class="report"><i class="fa-solid fa-triangle-exclamation"></i></span>
    </div>
</div>
<div class="comment-box">
        <form action="">
            <input type="text" placeholder="Hop into the conversation...">
        </form>
    </div>
</div>
<%@ include file="comment.jsp" %>
<%@ include file="nestedComment.jsp" %>
<%@ include file="nestedComment.jsp" %>
<%@ include file="comment.jsp" %>
<%@ include file="comment.jsp" %>
<%@ include file="comment.jsp" %>
    
</body>
</html>