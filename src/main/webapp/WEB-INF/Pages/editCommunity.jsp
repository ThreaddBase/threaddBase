<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/editCommunity.css">

<div class="ec-overlay ${param.showModal == 'editCommunity' ? 'active' : ''}">
    <div class="ec-box">

        <a href="<%=request.getContextPath()%>/community/view?id=${community.id}" class="ec-close">&times;</a>

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

                <c:if test="${not empty param.error}">
                    <div class="ec-error">${param.error}</div>
                </c:if>

                <div class="ec-actions">
                    <button type="submit" class="ec-btn-save">Save Changes</button>
                    <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
                        <button type="button" class="ec-btn-discard">Discard Changes</button>
                    </a>
                </div>
            </div>

        </form>
    </div>
</div>