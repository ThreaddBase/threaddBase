<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/reportUser.css">

<div class="report-user-modal">
    <input type="checkbox" id="reportUserToggle" style="display:none;">
    <div class="cn-overlay">
        <div class="cn-box">
            <div class="cn-header">
                <h2>Report User</h2>
                <label for="reportUserToggle" class="cn-close">&#x2715;</label>
            </div>
            <form action="<%=request.getContextPath()%>/user/report" method="post">
                <input type="hidden" name="reportedUserId" value="${user.id}"/>
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