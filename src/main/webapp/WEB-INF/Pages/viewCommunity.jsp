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
	    <c:when test="${role == 'Admin'}">
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
					<c:when test="${role == 'Admin'}">
					    <a href="<%=request.getContextPath()%>/community/view?id=${community.id}&amp;showModal=editCommunity">
					        <button class="add-btn">Edit Community</button>
					    </a>
					</c:when>
				<c:otherwise>
					<c:if test="${isJoined}">
						<%-- Post Image button --%>
						<a href="<%=request.getContextPath()%>/community/view?id=${community.id}&amp;communityId=${community.id}&amp;showModal=image">
						    <button class="add-btn-p">Post Image</button>
						</a>
						
						<%-- Create Thread button --%>
						<a href="<%=request.getContextPath()%>/community/view?id=${community.id}&amp;communityId=${community.id}&amp;showModal=thread">
						    <button class="add-btn-t">Create Thread</button>
						</a>
					</c:if>
				</c:otherwise>
        	</c:choose>	
        </div>
    </div>

    <div class="community-tag">
        <p>Popular Tags</p>
        <div class="tag-list">
            <c:forEach var="tag" items="${tagList}">
            	<span># ${ tag.name }</span>
            </c:forEach>
        </div>
    </div>

    <section>
    
        <div class="community-list">
        	
        	<c:forEach var="post" items="${ postList }">
        		<%@ include file="post.jsp" %>
        	</c:forEach>
        </div>
        <div class="about-community">
            <p>About Community</p>
            <p>${community.description }</p>
            <p>Created At: ${community.createdAt }</p>
            <div class="member-status">
                <span><i class="fa-solid fa-users"></i> ${community.userCount} Members</span>
                <span><i class="fa-solid fa-user-check"></i> 10 Online</span>
            </div>
         <c:if test="${role == 'Member'}">
		    <c:choose>
		        <c:when test="${isJoined}">
		            <a href="<%=request.getContextPath()%>/community/view?id=${community.id}&amp;communityId=${community.id}&amp;task=leave">
		                <button class="leave-community">Leave Community</button>
		            </a>
		        </c:when>
		        <c:otherwise>
		            <a href="<%=request.getContextPath()%>/community/view?id=${community.id}&amp;communityId=${community.id}&amp;task=join">
		                <button class="join-community">Join Community</button>
		            </a>
		        </c:otherwise>
		    </c:choose>
		</c:if>
		 <%@ include file="miniFooterViewCom.jsp" %>
        </div>
    </section>
    <%@ include file="notificationModel.jsp" %>
    <%@ include file="editCommunity.jsp" %>
    <%@ include file="newPostImage.jsp" %>
   	<%@ include file="newPostMessage.jsp" %>
    
	   <script>
	    function previewEcImage(input) {
	        if (input.files && input.files[0]) {
	            const reader = new FileReader();
	            reader.onload = e => {
	                const img = document.getElementById('ecPreviewImg');
	                img.src = e.target.result;
	                img.style.display = 'block';
	            };
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	</script> 
   
</body>
</html>