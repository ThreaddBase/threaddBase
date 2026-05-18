<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="position:fixed; top:20px; right:20px; z-index:9999; 
            background:#222831; padding:20px; border-radius:10px; 
            border:2px solid #00adb5;">
    <form action="<%=request.getContextPath()%>/admin/notification" method="post">
        <p style="color:#fff; margin-bottom:10px; font-weight:bold;">Send Notification</p>
        <textarea name="message" 
                  style="width:300px; height:100px; border-radius:8px; 
                         padding:10px; font-size:14px; display:block; 
                         margin-bottom:10px;"
                  placeholder="Type notification message here..."></textarea>
        <button type="submit" 
                style="background:#00adb5; color:#fff; border:none; 
                       border-radius:8px; padding:10px 20px; 
                       font-size:14px; cursor:pointer; width:100%;">
            Send
        </button>
    </form>
</div> --%>

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