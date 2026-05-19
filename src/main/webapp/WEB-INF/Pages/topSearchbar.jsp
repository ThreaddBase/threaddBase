<div class="top-bar">
    <div class="search-container">
        <input type="text" placeholder="Search...">
        <button><i class="fas fa-search"></i></button>
    </div>

    <a href="<%=request.getContextPath()%>/user?id=${sessionScope.loggedUser.id}" class="user-profile">
        <c:choose>
            <c:when test="${not empty sessionScope.loggedUser.userProfilePicBase64}">
                <img class="avatar"
                     src="data:image/jpeg;base64,${sessionScope.loggedUser.userProfilePicBase64}"
                     alt="avatar"/>
            </c:when>
            <c:otherwise>
                <div class="avatar"></div>
            </c:otherwise>
        </c:choose>
        <span class="username">${sessionScope.loggedUser.username}</span>
    </a>
</div>