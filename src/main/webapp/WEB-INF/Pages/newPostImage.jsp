<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newPostImage.css">

<div id="npiOverlay" class="npi-overlay">
    <div class="npi-box">
        <button type="button" class="npi-close" onclick="closeNewPostImage()">&times;</button>

        <h2 class="npi-heading"><span>Create</span> New Post</h2>

        <div class="npi-body">
            <!-- Left: image upload -->
            <div class="npi-left">
                <div class="npi-upload-area" onclick="document.getElementById('npiFileInput').click()">
                    <i class="fas fa-arrow-up-from-bracket npi-upload-icon"></i>
                    <button type="button" class="npi-upload-btn">Upload an Image</button>
                    <p class="npi-upload-hint">PNG, JPG or GIF · Max 10MB</p>
                    <input type="file" id="npiFileInput" accept="image/*"
                           style="display:none" onchange="previewNpiImage(this)">
                </div>
            </div>

            <!-- Right: fields -->
            <div class="npi-right">
                <div>
                    <p class="npi-field-label">Title</p>
                    <input type="text" placeholder="Title for the post">
                </div>
                <div>
                    <p class="npi-field-label">Description</p>
                    <textarea placeholder="Description for the post..."></textarea>
                </div>
                <div>
                    <p class="npi-field-label">Community</p>
                    <select>
                        <option value="" disabled selected>Select community</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="npi-footer">
            <input type="text" class="npi-tags-input" placeholder="# For the post">
            <div class="npi-confirm">
                <span>Sure you want to post it?</span>
                <button type="button" class="npi-post-btn">Post Thread</button>
            </div>
        </div>

    </div>
</div>