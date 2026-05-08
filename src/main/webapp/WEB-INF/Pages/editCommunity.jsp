<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Edit Community Modal -->
<div id="ecOverlay" class="ec-overlay">
    <div class="ec-box">
        <button type="button" class="ec-close" onclick="closeEditCommunity()">&times;</button>

        <form class="ec-card" onsubmit="return false;">
            <div class="ec-left">
                <div class="ec-image-frame">
                    <img src="" alt="Community Image" id="ecPreviewImg">
                </div>
                <button type="button" class="ec-btn-change"
                    onclick="document.getElementById('ecImageInput').click()">
                    Change Image
                </button>
                <input type="file" id="ecImageInput" accept="image/*"
                    style="display:none" onchange="previewEcImage(this)">
            </div>

            <div class="ec-right">
                <input type="text" value="${community.name}" placeholder="Community Name">
                <textarea placeholder="Description of the community">${community.description}</textarea>
            </div>

            <div class="ec-actions">
                <button type="submit" class="ec-btn-save">Save Changes</button>
                <button type="button" class="ec-btn-discard"
                    onclick="closeEditCommunity()">Discard Changes</button>
            </div>
        </form>

    </div>
</div> --%>