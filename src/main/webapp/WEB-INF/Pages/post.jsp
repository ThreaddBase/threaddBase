<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/reportPost.css">

<div class="post-card">
    <div class="post-left">

        <%-- User Info --%>
        <div class="post-header">
            <c:choose>
                <c:when test="${not empty post.userProfilePicBase64}">
                    <img class="avatar"
                         src="data:image/jpeg;base64,${post.userProfilePicBase64}"
                         alt="avatar"/>
                </c:when>
                <c:otherwise>
                    <div class="avatar"></div>
                </c:otherwise>
            </c:choose>
            <div>
                <a href="<%=request.getContextPath()%>/user?id=${post.userId}" class="username-link">
                    <p class="username">${post.userFirstName} ${post.userLastName}</p>
                </a>
                <p class="post-date">${post.postDate}</p>
            </div>
        </div>

        <%-- Community + Caption --%>
        <p class="community-name">${post.communityName}</p>
        <p class="post-body">${post.caption}</p>

        <%-- Tags --%>
        <p class="post-tags">
            <c:forEach var="tag" items="${post.tags}">
                <span>#${tag}</span>
            </c:forEach>
            <c:if test="${empty post.tags}">
                <span>No tags</span>
            </c:if>
        </p>

        <%-- Post Actions --%>
        <div class="post-actions">

            <%-- Vote Button --%>
			<form action="<%=request.getContextPath()%>/vote" method="POST" style="display:inline;">
			    <input type="hidden" name="postId" value="${post.postId}"/>
			    <button type="submit" class="action-btn vote-btn" ${post.hasVoted ? 'active' : ''}>
			        <i class="fa-regular fa-circle-check"></i>
			        ${post.voteCount}
			    </button>
			</form>
			
			<%-- Comment Count --%>
			<a href="<%=request.getContextPath()%>/comment?postId=${post.postId}" class="action-btn comment-btn">
			    <i class="fa-regular fa-comment"></i>
			    ${post.commentCount}
			</a>
			
			<%-- Bookmark Button --%>
			<form action="<%=request.getContextPath()%>/bookmark" method="POST" style="display:inline;">
			    <input type="hidden" name="postId" value="${post.postId}"/>
			    <button type="submit" class="action-btn bookmark-btn">
			        <i class="fa-regular fa-bookmark"></i>
			        ${post.bookmarkCount}
			    </button>
			</form>
            <%-- Report Button + Modal --%>
            <c:if test="${sessionScope.loggedUser.id != post.userId}">

                <input type="checkbox" id="reportToggle_${post.postId}" style="display:none;">

                <label for="reportToggle_${post.postId}" class="action-btn report-user">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    <c:if test="${role eq 'Admin'}">
                        ${post.reportCount}
                    </c:if>
                </label>

                <div class="report-post-modal">
                    <div class="cn-overlay">
                        <div class="cn-box">
                            <div class="cn-header">
                                <h2>Report Post</h2>
                                <label for="reportToggle_${post.postId}" class="cn-close">&#x2715;</label>
                            </div>
                            <form action="<%=request.getContextPath()%>/post/report" method="post">
                                <input type="hidden" name="reportedPostId" value="${post.postId}"/>
                                <div class="cn-body">
                                    <input type="text"
                                           name="subject"
                                           class="report-subject"
                                           placeholder="Report Subject"
                                           maxlength="20"/>
                                    <textarea name="description"
                                              class="cn-textarea"
                                              placeholder="Report Reason"
                                              maxlength="200"></textarea>
                                </div>
                                <div class="cn-footer">
                                    <button type="submit" class="cn-send-btn">Send</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </c:if>

        </div>
    </div>

    <%-- Post Image --%>
    <c:choose>
        <c:when test="${not empty post.postImageBase64}">
            <div class="post-image">
                <img src="data:image/jpeg;base64,${post.postImageBase64}" alt="post image"/>
            </div>
        </c:when>
        <c:otherwise>
            <%-- no image --%>
        </c:otherwise>
    </c:choose>

</div>