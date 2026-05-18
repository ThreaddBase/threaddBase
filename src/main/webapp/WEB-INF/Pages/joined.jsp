<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userNav.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/joined.css">
</head>
<body>
<%@ include file="userPortal.jsp" %>

  <nav class="tabs">
    <div class="tabs-inner">
      <a href="/Threaddbase/user">Profile</a>
      <a href="/Threaddbase/user/joined" class="active">Joined Communities</a>
      <a href="/Threaddbase/user/bookmark" >Bookmark</a>
      <a href="/Threaddbase/user/notification">Notification</a>
    </div>
  </nav>

  <div class="page-title">
    <h1>Joined Communities</h1>
  </div>
	<section class="posts">
	  <c:forEach var="community" items="${communityList}">
	    <article class="post">
	      <div class="post-left">
	        <c:choose>
                <c:when test="${not empty community.communityProfileBase64}">
                    <img class="mini-avatar"
                         src="data:image/jpeg;base64,${community.communityProfileBase64}"
                         alt="avatar"/>
                </c:when>
                <c:otherwise>
                    <img class="mini-avatar"
                         src="<%=request.getContextPath()%>/Assets/default-community.jpg"
                         alt="avatar"/>
                </c:otherwise>
            </c:choose>
	        <div>
	          <h4>${community.name}</h4>
	          <p>${community.description}</p>
	        </div>
	      </div>
	      <div class="post-buttons">
	        <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
                <button class="view-btn">Check Updates</button>
            </a>
	      </div>
	    </article>
	  </c:forEach>
  </section>
  <c:if test="${ empty communityList }">
	 	<p class="no-data">No community joined</p>
	 </c:if>

  <div class="recommended-section">
    <h2>Recommended Communities</h2>

	<c:forEach var="community" items="${reCommendedList}">
	    <article class="post">
	      <div class="post-left">
	        <c:choose>
                <c:when test="${not empty community.communityProfileBase64}">
                    <img class="mini-avatar"
                         src="data:image/jpeg;base64,${community.communityProfileBase64}"
                         alt="avatar"/>
                </c:when>
                <c:otherwise>
                    <img class="mini-avatar"
                         src="<%=request.getContextPath()%>/Assets/default-community.jpg"
                         alt="avatar"/>
                </c:otherwise>
            </c:choose>
	        <div>
	          <h4>${community.name}</h4>
	          <p>${community.description}</p>
	        </div>
	      </div>
	      <div class="post-buttons">
            <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
                <button class="view-btn">View Community</button>
            </a>	
	      </div>
	    </article>
	  </c:forEach>
	 <c:if test="${ empty reCommendedList }">
	 	<p class="no-data">No community to recommend</p>
	 </c:if>
<!-- 	<div class="more-section">
      <h2>More communities</h2>
      <button class="load-more-btn">Load More</button>
    </div> -->
  </div>
 </body>
 </html>