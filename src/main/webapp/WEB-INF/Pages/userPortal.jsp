<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="top">
    <a href="<%=request.getContextPath()%>/user/home">&#8592;</a>
</div>

<div class="p-banner"></div>

<section class="p-header">
    <div class="p-inner">

        <div class="p-avatar">
            <c:choose>
                <c:when test="${not empty user.profilePictureBase64}">
                    <img src="data:image/jpeg;base64,${user.profilePictureBase64}" alt="avatar"/>
                </c:when>
                <c:otherwise>
                    <img src="<%=request.getContextPath()%>/Assets/default-avatar.jpg" alt="avatar"/>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="p-user-info">
            <div class="p-user-info-text">
                <h2>${user.firstName} ${user.lastName}</h2>
                <span class="p-username-handle">@${user.username}</span>
                <p>${not empty user.bio ? user.bio : 'No bio yet.'}</p>
            </div>

            <c:if test="${user.id == sessionScope.loggedUser.id}">
                <button class="p-edit-btn">
                    <a href="<%=request.getContextPath()%>/member/edit">Edit Profile</a>
                </button>
            </c:if>
        </div>

    </div>
</section>