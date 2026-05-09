<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostMessage.css">

<div id="npmOverlay" class="npm-overlay">
    <div class="post_text">
        <div class="closePopup" onclick="closeNewPostMessage()">✕</div>
        <div class="post_profile">
            <div class="post_avatar"></div>
            <div class="post_heading">
                <h1>Harry Newgate</h1>
                <h3>2026-05-02</h3>
            </div>
        </div>
        <div class="post_main_section">
            <textarea placeholder="What's the new thread going to be about?"></textarea>
        </div>
        <div class="postTags">
            <input type="text" class="postTag" placeholder="Tags: #Animal#">
            <div class="select-wrap">
                <select>
                    <option value="" disabled selected hidden>Select community</option>
                </select>
            </div>
        </div>
        <button type = "submit">Thread your thoughts into the community</button>
    </div>
</div>