<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/community.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="topSearchbar.jsp" %>

    <section>
        <p>Discover More <span>Communities</span></p>
  		<form 
  			action="<%=request.getContextPath()%>/community"
            method="post"
  			class="filter-form">
  			
		  <label for="member-filter">Filter</label>
		  <div class="select-wrapper">
			<select id="member-filter" name="filterCommunity" onchange="this.form.submit()">
			    <option value="all" ${selectedFilter == 'all' ? 'selected' : ''}>All</option>
			    <option value="joined" ${selectedFilter == 'joined' ? 'selected' : ''}>Joined</option>
			    <option value="notJoined" ${selectedFilter == 'notJoined' ? 'selected' : ''}>Not Joined</option>
			</select>
		  </div>
		</form>
        <div class="community-list">
			
            <c:forEach var="community" items="${communities}">
                <div class="community-card">
                    <c:choose>
                        <c:when test="${not empty community.communityProfileBase64}">
                            <img class="community-thumb"
                                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
                                 alt="avatar"/>
                        </c:when>
                        <c:otherwise>
                            <img class="community-thumb"
                                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
                                 alt="avatar"/>
                        </c:otherwise>
                    </c:choose>

                    <div class="card-details">
                        <div class="card-title">${community.name}</div>
                        <div class="card-created">Created at - ${community.createdAt}</div>
                        <div class="card-desc">${community.description}</div>
                        <div class="card-action-btns">
                            <button class="view-btn">
                                <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">View Community</a>
                            </button>
                            <c:choose>
	                            <c:when test="${community.isJoined == true}">
	                            	 <a href="<%=request.getContextPath()%>/community?task=leave&amp;communityId=${community.id}">
	                                	<button class="leave-btn">Leave Community</button>
	                            	</a>
	                            </c:when>
	                            <c:otherwise>
		                            <a href="<%=request.getContextPath()%>/community?task=join&amp;communityId=${community.id}">
		                                <button class="join-btn">Join Community</button>
		                            </a>
	                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty communities}">
                <div class="no-data">No Community found.</div>
            </c:if>

        </div>
    </section>

    <c:if test="${not empty result}">
	    <div class="modal-overlay">
	        <div class="modal-box">
	            <c:choose>
	                <c:when test="${result == 'Joined Community' || result == 'Left Community'}">
	                    <div class="modal-icon success"><i class="fa-solid fa-circle-check"></i></div>
	                    <h3>Success!</h3>
	                </c:when>
	                <c:otherwise>
	                    <div class="modal-icon error"><i class="fa-solid fa-circle-xmark"></i></div>
	                    <h3>Failed!</h3>
	                </c:otherwise>
	            </c:choose>
	            <p>${result}</p>
	            <!-- Close by navigating back to clean community page -->
	            <a href="<%=request.getContextPath()%>/community" class="close-modal-btn">OK</a>
	        </div>
	    </div>
	</c:if>

    <%@ include file="notificationModel.jsp" %>

</body>
</html>