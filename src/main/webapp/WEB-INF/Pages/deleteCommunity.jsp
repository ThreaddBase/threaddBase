<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/deleteCommunity.css">

<c:if test="${showModal == 'delete' || param.showModal == 'delete'}">
<div class="del-overlay del-overlay--active">
    <div class="del-box">
        <div class="del-header">
            <div class="del-title">
                <i class="fas fa-triangle-exclamation del-warn-icon"></i>
                Delete Community
            </div>
            <!-- Close = navigate back without modal params -->
            <a href="<%=request.getContextPath()%>/admin/community" class="del-close">&times;</a>
        </div>

        <div class="del-divider"></div>

        <div class="del-body">
            <div class="del-question">Are you sure you want to delete this community?</div>
            <div class="del-warning-box">
                <i class="fas fa-circle-exclamation"></i>
                This action is permanent and cannot be undone. All posts, members,
                and data associated with this community will be lost.
            </div>
        </div>

        <div class="del-footer">
            <form action="<%=request.getContextPath()%>/admin/community" method="post">
			    <input type="hidden" name="action" value="delete">
			    <input type="hidden" name="communityId" value="${communityId}">
			    <div style="display: flex; gap: 16px;">
			        <a href="<%=request.getContextPath()%>/admin/community"
			           class="del-keep-btn">Keep Community</a>
			        <button type="submit" class="del-confirm-btn">
			            <i class="fas fa-trash"></i>
			            Yes, Delete
			        </button>
			    </div>
			</form>
        </div>

    </div>
</div>
</c:if>

<%-- Toast Notification --%>
<c:if test="${result != null}">
    <div class="toast ${result ? 'toast--success' : 'toast--error'}">
        <c:choose>
            <c:when test="${result}">
                <i class="fas fa-circle-check"></i> Community deleted successfully.
            </c:when>
            <c:otherwise>
                <i class="fas fa-circle-xmark"></i> Deletion failed. Please try again.
            </c:otherwise>
        </c:choose>
    </div>
</c:if>
