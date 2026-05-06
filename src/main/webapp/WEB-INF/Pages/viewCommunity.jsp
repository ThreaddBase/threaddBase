<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewCommunity.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

	<c:choose>
		<c:when test="${role.equals('Admin')}">
	         	<%@ include file="adminSidebar.jsp" %>
		</c:when>
		<c:otherwise>
				<%@ include file="sidebar.jsp" %>
		</c:otherwise>
	</c:choose>

	<%@ include file="topSearchbar.jsp" %>

    <div class="community-profile">
        <div class="community-left">
        	<c:choose>
		        <c:when test="${not empty community.communityProfileBase64}">
		            <img class="community-pic"
		                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
		                 alt="avatar"/>
		        </c:when>
		        <c:otherwise>
		            <img class="community-pic"
		                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
		                 alt="avatar"/>
		        </c:otherwise>
		    </c:choose>
            <div class="community-desc">
                <span>${community.name}</span>
                <span>${community.description }</span>
            </div>
        </div>
        <div class="community-right">
        	<c:choose>
				<c:when test="${role.equals('Admin')}">
            		<button class="add-btn">Edit Community</button>		
				</c:when>
				<c:otherwise>
					<button class="add-btn">Create Thread</button>
				</c:otherwise>
        	</c:choose>
        		
        </div>
    </div>

    <div class="community-tag">
        <p>Popular Tags</p>
        <div class="tag-list">
            <span>All</span>
            <span>#Tag1</span>
            <span>#Tag3</span>
            <span>#Tag4</span>
            <span>#Tag5</span>
        </div>
    </div>

    <section>
    
        <div class="community-list">
        	
        	<c:forEach var="post" items="${ postList }">
        		<%@ include file="post.jsp" %>
        	</c:forEach>
        	<%@ include file="post.jsp" %>
        </div>
        <div class="about-community">
            <p>About Community</p>
            <p>${community.description }</p>
            <p>Created At: ${community.createdAt }</p>
            <div class="member-status">
                <span><i class="fa-solid fa-users"></i> ${community.userCount} Members</span>
                <span><i class="fa-solid fa-user-check"></i> 10 Online</span>
            </div>
         <c:if test="${role.equals('Member')}">
            <button class="join-community">Join Community</button>	
		 </c:if>

        </div>
    </section>
    <%@ include file="notificationModel.jsp" %>
</body>
</html>