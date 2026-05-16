<!-- Nested Comment -->
<div class="comment-nested">
    <div class="comment-avatar">
        <img src="<%=request.getContextPath()%>/Assets/default-avatar.png" alt="avatar">
    </div>

    <div class="comment-content">
        <div class="top-row">
            <div class="user-info">
                <h3>Username</h3>
                <span class="time">3h ago</span>
            </div>
        </div>

        <p class="text">
            Nested reply content goes here.
        </p>

        <!-- Vote + Reply -->
        <div class="comment-actions">
            <div class="vote-group">
                <button class="vote-btn upvote" onclick="vote(this)">
                    <i class="fa-regular fa-circle-check"></i>
                </button>
                <span class="vote-count">204</span>
            </div>

            <button class="reply-btn" onclick="toggleReply('reply-nested-1')">Reply</button>
        </div>

        <div id="reply-nested-1" class="reply-form" style="display:none; margin-top: 12px;">
            <form action="<%=request.getContextPath()%>/comment" method="post">
                <input type="hidden" name="postId" value="1" />
                <input type="hidden" name="parentId" value="NESTED_COMMENT_ID_HERE" />
                <input type="text" name="content" placeholder="Write a reply..." class="reply-input" />
                <button type="submit" class="reply-submit-btn">Send</button>
            </form>
        </div>
    </div>
</div>