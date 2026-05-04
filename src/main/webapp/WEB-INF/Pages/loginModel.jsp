<div class="login_page">
    <button class="fa-xmark" onclick="closeLoginPopup()">&times;</button>
    <form action="<%=request.getContextPath()%>/login" method="post">
        <h1>Login to keep up with <span>Threads</span></h1>

        <div class="input-box">
            <label>Username</label>
            <input type="text" placeholder="username" name="Username" required>
        </div>
        <div class="input-box">
            <label>Password</label>
            <div class="wrapper">
                <input type="password" id="password" name="Password" placeholder="Password" required>
                <span class="material-symbols-outlined">visibility</span>
            </div>
        </div>
        <div class="forget">
            <a href="#"> Forgot your Password ?</a>
        </div>
        <button type="submit" class="btn"> Log in</button>
    </form>
</div>
<script>
    const body = document.querySelector('body');
    const passwordInput = document.querySelector('#password');
    const eyeIcon = document.querySelector('.material-symbols-outlined');

    // Toggle password visibility
    eyeIcon.addEventListener('click', () => {
        // Check current type
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            eyeIcon.textContent = 'visibility_off'; // Change icon to "hide"
        } else {
            passwordInput.type = 'password';
            eyeIcon.textContent = 'visibility';     // Change icon back to "show"
        }
    });

    const loginModel = document.querySelector('.login_page');
    const overlay = document.getElementById('overlay');

    function loginPopup() {
        document.getElementById('overlay').classList.add('dimmed');
        loginModel.style.display = 'block';
        document.body.style.overflow = 'hidden';
    }

    function closeLoginPopup() {
        document.getElementById('overlay').classList.remove('dimmed');
        loginModel.style.display = 'none';
        document.body.style.overflow = '';
    }
</script>