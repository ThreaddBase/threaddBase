<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="register-container">
    <div class="register-text">
        Keep up with the <span>Discussions.</span>
    </div>
    <form action="<%=request.getContextPath()%>/register" method="post" class="register-tab">
        <h2>Create your <span>account</span></h2>

        <div class="input-row">
            <div class="input-section">
                <label for="first_name">First Name</label>
                <input type="text" id="first_name" name="first_name" placeholder="Enter First name" />
            </div>
            <div class="input-section">
                <label for="last_name">Last Name</label>
                <input type="text" id="last_name" name="last_name" placeholder="Enter Last name" />
            </div>
        </div>

        <div class="input-section">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" />
        </div>

        <div class="input-section">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="What would you like to be called as?" />
        </div>

        <div class="input-section">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="abc@gmail.com" />
        </div>

        <div class="input-section">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="*********" />
        </div>

        <div class="terms">
            <input type="checkbox" id="terms" name="terms" />
            <label for="terms">
                I agree to the <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a>
            </label>
        </div>

        <button type="submit" class="btn-submit">Create Account</button>

        <div class="login-link">
            Already have an account? <a href="#">Sign in</a>
        </div>
    </form>
</div>