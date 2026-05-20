<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/reportPost.css">

<div class="report-post-modal">
    <input type="checkbox" id="reportPostToggle" style="display:none;">
    <div class="cn-overlay">
        <div class="cn-box">
            <div class="cn-header">
                <h2>Report Post</h2>
                <label for="reportPostToggle" class="cn-close">&#x2715;</label>
            </div>
            <form action="<%=request.getContextPath()%>/post/report" method="post">
                <input type="hidden" name="reportedPostId" value="${post.id}"/>
                <p>postid: ${ post.id }</p>
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