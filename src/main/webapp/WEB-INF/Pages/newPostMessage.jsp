<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostMessage.css">

<div class="npm-overlay ${param.showModal == 'thread' ? 'active' : ''}">
    <div class="post_text">

        <a href="<%=request.getContextPath()%>/user/home?id=${param.id}" class="closePopup">&times;</a>

        <div class="post_profile">
            <div class="post_avatar"></div>
            <div class="post_heading">
                <h1>Harry Newgate</h1>
                <h3>2026-05-02</h3>
            </div>
        </div>

        <form action="<%=request.getContextPath()%>/post/create"
              method="post">

            <div class="post_main_section">
                <textarea placeholder="What's the new thread going to be about?" name="postCaption"></textarea>
            </div>

            <div class="postTags">
                <input type="text" class="postTag" placeholder="Tags: #Animal#" name="postTags">
                <div class="select-wrap">
                    <select name="communityId">
                        <option value="" disabled selected>Select community</option>
                        <c:forEach var="community" items="${communityList}">
                            <option value="${community.id}">${community.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <button type="submit">Thread your thoughts into the community</button>

        </form>
    </div>
</div>