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
                <p class="username">${post.userFirstName} ${post.userLastName}</p>
                <p class="post-date">${post.postDate}</p>
            </div>
        </div>

        <%-- Community + Caption --%>
        <p class="community-name">${community.name}</p>
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

            <%-- Comment Count — no action yet --%>
            <span class="action-btn">
                <i class="fa-regular fa-comment"></i>
                ${post.commentCount}
            </span>

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
            <c:if test="${role eq 'Admin'}">
                <span class="action-btn report">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    ${post.reportCount}
                </span>
            </c:if>

        </div>
    </div>

    <%-- Post Image --%>
    <div class="post-image">
        <c:choose>
            <c:when test="${not empty post.postImageBase64}">
                <img src="data:image/jpeg;base64,${post.postImageBase64}"
                     alt="post image"/>
            </c:when>
            <c:otherwise>
                <%-- no image — show nothing --%>
            </c:otherwise>
        </c:choose>
    </div>

</div>