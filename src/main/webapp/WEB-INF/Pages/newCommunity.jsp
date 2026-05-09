<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newCommunity.css">
<!-- New Community Modal -->
<div id="ncOverlay" class="nc-overlay">
    <div class="nc-box">
        <button type="button" class="nc-close" onclick="closeNewCommunity()">&times;</button>

        <form class="nc-card" onsubmit="return false;">
            <div class="nc-left">
                <div class="nc-image-frame">
                    <img src="" alt="Community Image" id="ncPreviewImg">
                </div>
                <button type="button" class="nc-btn-create"
                    onclick="document.getElementById('ncImageInput').click()">
                    Change Image
                </button>
                <input type="file" id="ncImageInput" accept="image/*"
                    style="display:none" onchange="previewNcImage(this)">
            </div>

            <div class="nc-right">
                <input type="text" placeholder="Community Name">
                <textarea placeholder="Description of the community"></textarea>
            </div>

            <div class="nc-actions">
                <button type="submit" class="nc-btn-create">Create Community</button>
            </div>
        </form>

    </div>
</div>