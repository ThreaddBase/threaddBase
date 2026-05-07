<div class="post-card">
    <div class="post-left">
        <div class="post-header">
            <img class="avatar"
		                 src="data:image/jpeg;base64,${post.userProfilePicBase64}"
		                 alt="avatar"/>
            <div>
                <p class="username">${post.userFirstName } ${post.userLastName} </p>
                <p class="post-date">${post.postDate }</p>
            </div>
        </div>
        <p class="community-name">${ community.name }</p>
        <p class="post-body"> ${ post.caption }</p>
        <p class="post-tags">
		    <c:forEach var="tag" items="${post.tags}">
		        <span>#${tag}</span>
		    </c:forEach>
		    <c:if test="${empty post.tags}">
		        <span>No tags</span>
		    </c:if>
		</p>
        <div class="post-actions">
            <span><i class="fa-regular fa-circle-check"></i> ${post.voteCount}</span>
            <span><i class="fa-regular fa-comment"></i> ${post.commentCount}</span>
            <span><i class="fa-regular fa-bookmark"></i> ${post.bookmarkCount}</span>
            <span class="report"><i class="fa-solid fa-triangle-exclamation"></i>
            	<c:if test="${role.equals('Admin')}">
            		${post.voteCount}
				 </c:if>  	
            </span>
        </div>
    </div>
    <div class="post-image">
    	<img src="data:image/jpeg;base64,${post.postImageBase64}" alt="avatar"/>
    </div>
</div>