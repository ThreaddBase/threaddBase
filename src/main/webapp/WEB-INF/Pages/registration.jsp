<div class="register-container">
    <div class="register-text">
        Keep up with the <span>Discussions.</span>
        <p>Register, Join a community and create your own thread</p>
    </div>
    <form action="<%=request.getContextPath()%>/register" method="post" class="register-tab" enctype="multipart/form-data">
        <h2>Create Your <span>Account</span></h2>

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
            <label>Profile Picture</label>
            <label for="profile_pic" class="profile-upload-btn">
                <i class="fa-regular fa-image"></i>
                <span id="upload-label">Upload a profile picture</span>
                <input type="file" id="profile_pic" name="profile_pic" accept="image/*" required hidden />
            </label>
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
            <label for="dob">Date of Birth</label>
            <input type="date" id="email" name="dob" placeholder="2006/06/08" />
        </div>

        <div class="input-section">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="*********" />
        </div>

        <div class="input-section">
            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="*********" />
        </div>

        <div class="terms">
            <input type="checkbox" id="terms" name="terms" checked/>
            <label for="terms">
                Accept <a href="#">Terms and Conditions</a>
            </label>
        </div>

        <button type="submit" class="btn-submit">Register my Account</button>

        <div class="login-link">
            Already have an account? <a href="<%=request.getContextPath()%>/login">Sign in</a>
        </div>
    </form>
</div>