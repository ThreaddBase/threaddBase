<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/login.css">
</head>
<body>
    <div class ="login_page"> 

        <form action="<%=request.getContextPath()%>/login" method="post">
            <h1> Login Page</h1>
            
        <div class="input-box">
            <label>Username</label>
            <input type ="text" placeholder="username" name="Username" required>
        </div>
        <div class="input-box">
            <label>Password</label>
            <div class="wrapper">
            <input type ="password" id="password" name="Password" placeholder="Password" required> 
            <span class="material-symbols-outlined" > eye_tracking </span>
            </div>
            </div>
        <div class="forget">
            <a href="#"> Forgot your Password ?</a>
        </div>
        <button type="submit" class ="btn"> Log in</button>
        </form>
    </div>
</body>
</html>