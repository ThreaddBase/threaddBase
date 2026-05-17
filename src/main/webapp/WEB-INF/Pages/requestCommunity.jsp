<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/requestCommunity.css">
<div class="rc-overlay ${param.showModal == 'requestCommunity' ? 'active' : ''}">
    <div class="rc-box">
        <a href="<%=request.getContextPath()%>/community" class="rc-close">&times;</a>

        <h2 class="rc-heading"><span>Request</span> <strong>Community</strong></h2>

        <form action="<%=request.getContextPath()%>/community/request" method="post">
            <input type="text" placeholder="Community Name" name="communityName">
            <textarea placeholder="Description of the community" name="communityDescription"></textarea>
            <div class="rc-btns">
                <button type="submit" class="rc-btn">Request Community</button>
                <a href="<%=request.getContextPath()%>/community" class="rc-btn cancel">Cancel Request</a>
            </div>
			<c:if test="${not empty param.error}">
			    <div class="rc-error">${param.error}</div>
			</c:if>
        </form>
    </div>
</div>