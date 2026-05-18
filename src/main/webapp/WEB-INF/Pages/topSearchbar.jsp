<div class="top-bar">
    <div class="search-container">
        <input type="text" placeholder="Search...">
        <button><i class="fas fa-search"></i></button>
    </div>
	<a href="<%=request.getContextPath()%>/user?id=${sessionScope.loggedUser.id}" class="user-profile">
	    <div class="avatar"></div>
	    <span class="username">${sessionScope.loggedUser.username}</span>
	</a>
</div>