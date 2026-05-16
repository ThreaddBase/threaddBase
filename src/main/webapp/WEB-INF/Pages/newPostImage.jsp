<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostImage.css">

<div class="npi-overlay ${param.showModal == 'image' ? 'active' : ''}">
    <div class="npi-box">

        <a href="<%=request.getContextPath()%>/user/home?id=${param.id}" class="npi-close">&times;</a>

        <form class="npi-card"
              action="<%=request.getContextPath()%>/post/create"
              method="post"
              enctype="multipart/form-data">
			<input type="hidden" name="showModal" value="image">
            <h2 class="npi-heading"><span>Create</span> New Post</h2>
			
            <div class="npi-body">
                <div class="npi-left">
                    <div class="npi-image-frame">
                        <img src="" alt="Post Image" id="npiPreviewImg">
                    </div>
                    <label class="npi-btn-change" for="npiFileInput">Choose Image</label>
                    <input type="file" id="npiFileInput" accept="image/*" name="postImage">
                </div>

                <div class="npi-right">
                    <textarea placeholder="Description for the post..." name="postCaption"></textarea>
                    <select name="communityId">
                        <option value="" disabled selected>Select community</option>
                        <c:forEach var="community" items="${communityList}">
                            <option value="${community.id}">${community.name}</option>
                        </c:forEach>
                    </select>
                    <input type="text" placeholder="# Add tags" name="postTags">
                    <button type="submit" class="npi-post-btn">Post Thread</button>
                </div>
            </div>

			<c:if test="${not empty param.error}">
			    <div class="npi-error">${param.error}</div>
			</c:if>
        </form>
    </div>
</div>

<script>
    const npiInput = document.getElementById('npiFileInput');
    if (npiInput) {
        npiInput.addEventListener('change', function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.getElementById('npiPreviewImg');
                    img.src = e.target.result;
                    img.style.display = 'block';
                };
                reader.readAsDataURL(this.files[0]);
            }
        });
    }
</script>