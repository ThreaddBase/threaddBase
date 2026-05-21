<div class="top-bar">
    <div class="search-container">
        <form action="<%=request.getContextPath()%>/user/home" method="get" 
              style="display:flex; align-items:center; width:100%;">
            
            <input type="text" 
                   name="searchQuery" 
                   placeholder="Search posts..." 
                   value="${not empty searchKeyword ? searchKeyword : ''}"
            />
            <button type="submit">
                <i class="fas fa-search"></i>
            </button>

        </form>
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

<!-- Show error or no results message -->
<c:if test="${not empty error}">
    <div class="search-error">
        <p>${error}</p>
    </div>
</c:if>

