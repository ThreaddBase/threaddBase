<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userHome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostImage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostMessage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%@ include file="sidebar.jsp" %>
	<%@ include file="topSearchbar.jsp" %>
	
	<div class="tag">
        <button class="tag-arrow hidden" id="arrowLeft">
            <i class="fas fa-chevron-left"></i>
        </button>
			<div class="tag-list">
			    <a href="<%=request.getContextPath()%>/user/home?id=0" class="${param.id == '0' || empty param.id ? 'active' : ''}">All</a>
			    <c:forEach var="tag" items="${tagList}">
			        <a href="<%=request.getContextPath()%>/user/home?id=${tag.tagID}" class="${param.id == tag.tagID ? 'active' : ''}">#${tag.name}</a>
			    </c:forEach>
			</div>
        <button class="tag-arrow" id="arrowRight">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
    
    <section id="main-section">
        <section class="section1">
			    <!-- post section -->
                <div class="new-thread-container">
                <p>What's on your mind? Start a Thread...</p>
                <div class="thread-option">
					<a href="<%=request.getContextPath()%>/user/home?id=${param.id}&amp;showModal=image">
					    <i class="fas fa-image"></i>
					    <span>Photo</span>
					</a>
					<a href="<%=request.getContextPath()%>/user/home?id=${param.id}&amp;showModal=thread">
					    <i class="fa-brands fa-shoelace fa-rotate-270"></i>
					    <span>Thread</span>
					</a>
                </div>
            </div>
            
            <!-- main section to shoe post -->
        	<c:forEach var="post" items="${ postList }">
        		<%@ include file="post.jsp" %>
        	</c:forEach>
        </section>
			<div class="section2wrapper">
			    <section class="section2">
			        <p>Discover Communities</p>
			
			        <c:forEach var="community" items="${communityList}">
			            <a href="<%=request.getContextPath()%>/community/view?id=${community.id}" class="discover-communities">
			                <c:choose>
						        <c:when test="${not empty community.communityProfileBase64}">
						            <img class="community-profile"
						                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
						                 alt="avatar"/>
						        </c:when>
						        <c:otherwise>
						            <img class="community-profile"
						                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
						                 alt="avatar"/>
						        </c:otherwise>
						    </c:choose>
			                <p>${community.name}</p>
			            </a>
			        </c:forEach>
			    </section>
			    <%@ include file="miniFooterUser.jsp" %>
			</div>
       
    </section>
    
    
    <%@ include file="notificationModel.jsp" %>
    <%@ include file="newPostImage.jsp" %>
   	<%@ include file="newPostMessage.jsp" %>
   	<%@ include file="reportPost.jsp" %>
 
<script>
	const tagList = document.querySelector('.tag-list');
	const arrowLeft = document.getElementById('arrowLeft');
	const arrowRight = document.getElementById('arrowRight');
	const tags = document.querySelectorAll('.tag-list a');
	const SCROLL_AMOUNT = 200;

	// arrow clicks
	arrowLeft.addEventListener('click', () => { tagList.scrollLeft -= SCROLL_AMOUNT; });
	arrowRight.addEventListener('click', () => { tagList.scrollLeft += SCROLL_AMOUNT; });

	// show/hide arrows based on scroll position
	function updateArrows() {
	    const atStart = tagList.scrollLeft <= 0;
	    const atEnd   = tagList.scrollLeft + tagList.clientWidth >= tagList.scrollWidth - 1;
	    arrowLeft.classList.toggle('hidden', atStart);
	    arrowRight.classList.toggle('hidden', atEnd);
	}
	tagList.addEventListener('scroll', updateArrows);
	window.addEventListener('resize', updateArrows);
	updateArrows();

	// drag-to-scroll on desktop
	let isDown = false, startX, scrollStart;
	tagList.addEventListener('mousedown', (e) => {
	    isDown = true;
	    tagList.classList.add('dragging');
	    startX = e.pageX - tagList.offsetLeft;
	    scrollStart = tagList.scrollLeft;
	});
	document.addEventListener('mouseup', () => { isDown = false; tagList.classList.remove('dragging'); });
	document.addEventListener('mousemove', (e) => {
	    if (!isDown) return;
	    e.preventDefault();
	    tagList.scrollLeft = scrollStart - (e.pageX - tagList.offsetLeft - startX);
	});
	
</script>
</body>
</html>