<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostImage.css">

<div class="npi-overlay ${param.showModal == 'image' ? 'active' : ''}">
    <div class="npi-box">

        <c:choose>
		    <c:when test="${not empty param.communityId}">
		        <%-- close goes back to community page --%>
		        <a href="<%=request.getContextPath()%>/community/view?id=${param.communityId}" class="npi-close">&times;</a>
		    </c:when>
		    <c:otherwise>
		        <%-- close goes back to home --%>
		        <a href="<%=request.getContextPath()%>/user/home?id=${param.id}" class="npi-close">&times;</a>
		    </c:otherwise>
		</c:choose>

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
					<c:choose>
					    <c:when test="${not empty param.communityId}">
					        <%-- Already inside a community, no need for dropdown --%>
					        <input type="hidden" name="communityId" value="${param.communityId}">
					        <p>Posting in: <strong>${community.name}</strong></p>
					    </c:when>
					    <c:otherwise>
					        <%-- Home page: let user pick --%>
					        <select name="communityId">
					            <option value="" disabled selected>Select community</option>
					            <c:forEach var="c" items="${communityList}">
					                <option value="${c.id}">${c.name}</option>
					            </c:forEach>
					        </select>
					    </c:otherwise>
					</c:choose>
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