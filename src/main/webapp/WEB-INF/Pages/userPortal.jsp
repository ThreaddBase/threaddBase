<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/reportUser.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />

<c:if test="${not empty sessionScope.reportError}">
    <div class="toast toast-error">
        <i class="fa-solid fa-circle-xmark"></i>
        ${sessionScope.reportError}
    </div>
    <% session.removeAttribute("reportError"); %>
</c:if>

<c:if test="${not empty sessionScope.reportSuccess}">
    <div class="toast toast-success">
        <i class="fa-solid fa-circle-check"></i>
        ${sessionScope.reportSuccess}
    </div>
    <% session.removeAttribute("reportSuccess"); %>
</c:if>
<%@ include file="reportUser.jsp" %>
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
            
            <c:if test="${user.id != sessionScope.loggedUser.id}">
                <label for="reportUserToggle" class="report-user">
			    	<i class="fa-solid fa-triangle-exclamation"></i>
				</label>
            </c:if>                
        </div>

    </div>
</section>
<%@ include file="reportPost.jsp" %>