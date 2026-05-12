<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newCommunity.css">

<c:if test="${showModal == 'newCommunity' || param.showModal == 'newCommunity'}">
<div class="nc-overlay nc-overlay--active">
    <div class="nc-box">
        <!-- Close = navigate back without the param -->
        <a href="<%=request.getContextPath()%>/admin/community" class="nc-close">&times;</a>

        <form class="nc-card"
              action="<%=request.getContextPath()%>/admin/community"
              method="post"
              enctype="multipart/form-data">

            <!-- Left: avatar -->
            <div class="nc-left">
                <div class="nc-image-frame">
                    <img src="" alt="Community Image" id="ncPreviewImg">
                </div>
                
                <label class="nc-btn-change" for="ncImageInput">Change Image</label>
                <input type="file" id="ncImageInput" accept="image/*"
                       name="communityImage">
            </div>

            <!-- Right: name + description + request -->
            <div class="nc-right">
                <input type="text" placeholder="Community Name" name="communityName">
                <textarea placeholder="Description of the community"
                          name="communityDescription"></textarea>
                <select name="communityRequestId" id="ncRequestSelect">
                    <option value="" disabled selected>Select a community request</option>
                    <c:forEach var="req" items="${requestList}">
                        <option value="${req.requestId}">${req.requestName}</option>
                    </c:forEach>
                </select>
            </div>

            <c:if test="${not empty error}">
                <div class="nc-error">${error}</div>
            </c:if>

            <div class="nc-actions">
                <button type="submit" class="nc-btn-create">Create Community</button>
            </div>
        </form>
    </div>
</div>
</c:if>

<script>
	document.getElementById('ncImageInput').addEventListener('change', function() {
	    if (this.files && this.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            var img = document.getElementById('ncPreviewImg');
	            img.src = e.target.result;
	            img.style.display = 'block';
	        };
	        reader.readAsDataURL(this.files[0]);
	    }
	});
</script>