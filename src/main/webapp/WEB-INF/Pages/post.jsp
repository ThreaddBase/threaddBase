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
                <a href="<%=request.getContextPath()%>/user?id=${post.userId}" class="username-link"><p class="username">${post.userFirstName} ${post.userLastName}</p></a>
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
            <form action="<%=request.getContextPath()%>/vote"
                  method="POST" style="display:inline;">
                <input type="hidden" name="postId" value="${post.postId}"/>
                <button type="submit" class="action-btn">
                    <i class="fa-regular fa-circle-check"></i>
                    ${post.voteCount}
                </button>
            </form>

            <%-- Comment Count --%>
            <a href="<%=request.getContextPath()%>/comment?postId=${post.postId}" class="action-btn">
	                <i class="fa-regular fa-comment"></i>
	                ${post.commentCount}
            </a>

            <%-- Bookmark Button --%>
            <form action="<%=request.getContextPath()%>/bookmark"
                  method="POST" style="display:inline;">
                <input type="hidden" name="postId" value="${post.postId}"/>
                <button type="submit" class="action-btn">
                    <i class="fa-regular fa-bookmark"></i>
                    ${post.bookmarkCount}
                </button>
            </form>

            <%-- Report — Admin only --%>
            <c:if test="${sessionScope.loggedUser.id != post.userId}">
              <span class="action-btn report">
                  <i class="fa-solid fa-triangle-exclamation"></i>
                  <c:if test="${role eq 'Admin'}">
                  	${post.reportCount}
          		</c:if>
              </span>
			</c:if>
        </div>
    </div>

    <%-- Post Image --%>
    <c:choose>
        <c:when test="${not empty post.postImageBase64}">
			<div class="post-image">
            	<img src="data:image/jpeg;base64,${post.postImageBase64}"
                 alt="post image"/>
		 	</div>
        </c:when>
        <c:otherwise>
            <%-- no image — show nothing --%>

        </c:otherwise>
    </c:choose>

</div>