<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
    <div class ="login_page"> 

        <form action="">
            <h1> Login Page</h1>
            
        <div class="input-box">
            <label>Email</label>
            <input type ="text" placeholder="name@email.com" required>
        </div>
        <div class="input-box">
            <label>Password</label>
            <div class="wrapper">
            <input type ="password" id="password" placeholder="Password" required> 
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