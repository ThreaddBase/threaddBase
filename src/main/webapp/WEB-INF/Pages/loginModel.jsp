<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="login_page ${showLogin == true ? 'active' : ''}">
    <a href="<%=request.getContextPath()%>/home">
        <button type="button" class="fa-xmark">&times;</button>
    </a>

    <form action="<%=request.getContextPath()%>/login" method="post">
        <h1>Login to keep up with <span>Threads</span></h1>
        <p class="login-sub">Welcome back! good to see you again.</p>

        <div class="input-box">
            <label>Username</label>
            <input
                type="text"
                placeholder="username"
                name="Username"
                value="${not empty rememberedUsername ? rememberedUsername : ''}"
                required>
        </div>

        <div class="input-box">
            <label>Password</label>
            <div class="wrapper">
                <input type="password" name="Password" placeholder="Password" required>
            </div>
        </div>

        <div class="forget-row">
            <div class="remember-me">
                <label class="checkbox-wrapper">
                    <input
                        type="checkbox"
                        name="rememberMe"
                        id="rememberMe"
                        ${not empty rememberedUsername ? 'checked' : ''}>
                    <span class="custom-checkbox">
                        <svg viewBox="0 0 12 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <polyline points="1,5 4.5,8.5 11,1" stroke="currentColor"
                                stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </span>
                    <span class="checkbox-label">Remember me</span>
                </label>
            </div>
        </div>
        <c:if test="${not empty loginError}">
            <div class="login-error">
                <i class="fa-solid fa-circle-exclamation"></i>
                Invalid username or password.
            </div>
        </c:if>

        <button type="submit" class="btn">Log in</button>
    </form>
</div>

<div class="login-backdrop ${showLogin == true ? 'active' : ''}"></div>