<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="comment-nested">
    <div class="comment-avatar">
        <c:choose>
            <c:when test="${not empty comment.userProfilePictureBase64}">
                <img src="data:image/jpeg;base64,${comment.userProfilePictureBase64}" alt="avatar">
            </c:when>
            <c:otherwise>
                <img src="<%=request.getContextPath()%>/Assets/default-avatar.png" alt="avatar">
            </c:otherwise>
        </c:choose>
    </div>

    <div class="comment-content">
        <div class="top-row">
            <div class="user-info">
                <h3>${comment.username}</h3>
                <span class="time">${comment.commentDate}</span>
            </div>
        </div>

        <p class="text">${comment.commentMessage}</p>

        <!-- Vote + Reply -->
        <div class="comment-actions">
            <div class="vote-group">
                <button class="vote-btn upvote">
                    <i class="fa-regular fa-circle-check"></i>
                </button>
                <span class="vote-count">${comment.voteCount}</span>
            </div>

            <%-- <c:choose>
                <c:when test="${replyTo == comment.commentId}">
                    <a class="reply-btn"  href="<%=request.getContextPath()%>/comment?postId=${post.postId}" style="text-decoration:none;">Cancel</a>
                </c:when>
                <c:otherwise>
                    <a class="reply-btn"
                       href="<%=request.getContextPath()%>/comment?postId=${post.postId}&replyTo=${comment.commentId}"
                       style="text-decoration:none;">Reply</a>
                </c:otherwise>
            </c:choose> --%>
        </div>

        <!-- Reply Form — only visible when replyTo matches -->
        <c:if test="${replyTo == comment.commentId}">
            <div class="reply-form">
                <form action="<%=request.getContextPath()%>/comment" method="post">
                    <input type="hidden" name="postId"          value="${post.postId}" />
                    <input type="hidden" name="parentCommentId" value="${comment.commentId}" />
                    <input type="text"   name="content"
                           class="reply-input"
                           placeholder="Write a reply..." />
                    <button type="submit" class="reply-submit-btn">Send</button>
                </form>
            </div>
        </c:if>
    </div>
</div>