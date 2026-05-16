<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/editCommunity.css">

<c:if test="${showModal == 'editCommunity'}">
<div id="ecOverlay" class="ec-overlay active">
    <div class="ec-box">
        <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
            <button type="button" class="ec-close">&times;</button>
        </a>

        <form class="ec-card"
              action="<%=request.getContextPath()%>/community/view"
              method="post"
              enctype="multipart/form-data">

            <input type="hidden" name="communityId" value="${community.id}">
            <div class="ec-left">
                <div class="ec-image-frame">
                    <c:choose>
                        <c:when test="${not empty community.communityProfileBase64}">
                            <img id="ecPreviewImg"
                                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
                                 alt="Community Image"/>
                        </c:when>
                        <c:otherwise>
                            <img id="ecPreviewImg"
                                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
                                 alt="Community Image"/>
                        </c:otherwise>
                    </c:choose>
                </div>
                <label for="ecImageInput" class="ec-btn-change">Change Image</label>
                <input type="file" id="ecImageInput" name="communityImage"
                       accept="image/*" onchange="previewEcImage(this)" style="display:none">
            </div>

            <div class="ec-right">
                <input type="text" name="communityName"
                       value="${community.name}"
                       placeholder="Community Name">
                <textarea name="communityDescription"
                          placeholder="Description of the community">${community.description}</textarea>
            </div>

            <div class="ec-actions">
                <button type="submit" class="ec-btn-save">Save Changes</button>
                <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
                    <button type="button" class="ec-btn-discard">Discard Changes</button>
                </a>
            </div>
        </form>
    </div>
</div>
</c:if>