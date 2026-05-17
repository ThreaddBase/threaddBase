<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostMessage.css">

<div class="npm-overlay ${param.showModal == 'thread' ? 'active' : ''}">
    <div class="post_text">

        <c:choose>
		    <c:when test="${not empty param.communityId}">
		        <%-- close goes back to community page --%>
		        <a href="<%=request.getContextPath()%>/community/view?id=${param.communityId}" class="npi-close">&times;</a>
		    </c:when>
		    <c:otherwise>
		        <%-- close goes back to home --%>
		        <a href="<%=request.getContextPath()%>/user/home?id=${param.id}" class="npi-close">&times;</a>
		    </c:otherwise>
		</c:choose>

        <div class="post_profile">
            <div class="post_avatar"></div>
            <div class="post_heading">
                <h1>Harry Newgate</h1>
                <h3>2026-05-02</h3>
            </div>
        </div>

        <form action="<%=request.getContextPath()%>/post/create"
              method="post">
			<input type="hidden" name="showModal" value="thread">
            <div class="post_main_section">
                <textarea placeholder="What's the new thread going to be about?" name="postCaption"></textarea>
            </div>

            <div class="postTags">
                <input type="text" class="postTag" placeholder="Tags: #Animal#" name="postTags">
                <div class="select-wrap">
                    <c:choose>
					    <c:when test="${not empty param.communityId}">
					        <%-- Already inside a community, no need for dropdown --%>
					        <input type="hidden" name="communityId" value="${param.communityId}">
					        <p>Posting in: <strong>${community.name}</strong></p>
					    </c:when>
					    <c:otherwise>
					        <%-- Home page: let user pick --%>
					        <select name="communityId">
					            <option value="" disabled selected>Select community</option>
					            <c:forEach var="c" items="${communityList}">
					                <option value="${c.id}">${c.name}</option>
					            </c:forEach>
					        </select>
					    </c:otherwise>
					</c:choose>
                </div>
            </div>

            <button type="submit">Thread your thoughts into the community</button>
			<c:if test="${not empty param.error}">
			    <div class="npi-error">${param.error}</div>
			</c:if>
        </form>
    </div>
</div>