<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Checkbox controls popup - no JS needed --%>
<input type="checkbox" id="notifToggle" style="display:none;">

<%-- Overlay - sibling to checkbox --%>
<div class="cn-overlay">
    <div class="cn-box">
        <div class="cn-header">
            <h2>Send Notification</h2>
            <label for="notifToggle" class="cn-close">&#x2715;</label>
        </div>
        <form action="<%=request.getContextPath()%>/admin/notification" method="post">
            <div class="cn-body">
                <textarea name="message" class="cn-textarea"
                          placeholder="Type notification message here..."
                          maxlength="500" required></textarea>
            </div>
            <div class="cn-footer">
                <button type="submit" class="cn-send-btn">Send</button>
            </div>
        </form>
    </div>
</div>