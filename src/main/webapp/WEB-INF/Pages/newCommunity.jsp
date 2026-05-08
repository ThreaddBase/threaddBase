<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Community</title>
</head>
<body>
 <form class="card">

    <div class="left">
      <div class="image-frame">
        <img src="" alt="Community Image">
      </div>
      <button class="btn-change">Change Image</button>
    </div>

    <div class="right">
      <input type="text" value="Name - TheChessUnion">
      <textarea placeholder="Description of the community"></textarea>
    </div>

    <div class="actions">
      <button class="btn-new">Save Changes</button>
    </div>

</form>

</body>
</html> --%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form class="card">
    <div class="left">
        <div class="image-frame">
            <img src="" alt="Community Image" id="ncPreviewImg">
        </div>
        <button type="button" class="btn-change"
                onclick="document.getElementById('ncImageInput').click()">
            Change Image
        </button>
        <input type="file" id="ncImageInput" accept="image/*"
               style="display:none" onchange="previewNcImage(this)">
    </div>

    <div class="right">
        <input type="text" placeholder="Name - TheChessUnion">
        <textarea placeholder="Description of the community"></textarea>
    </div>

    <div class="actions">
        <button type="button" class="btn-new">Save Changes</button>
    </div>
</form> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2 class="nc-heading"><span>Create</span> New Post</h2>

<div class="nc-body">
    <!-- Left: image upload -->
    <div class="nc-left">
        <div class="nc-upload-area" onclick="document.getElementById('ncFileInput').click()">
            <i class="fas fa-arrow-up-from-bracket nc-upload-icon"></i>
            <button type="button" class="nc-upload-btn">Upload an Image</button>
            <p class="nc-upload-hint">PNG, JPG or GIF · Max 10MB</p>
            <input type="file" id="ncFileInput" accept="image/*"
                   style="display:none" onchange="previewNcImage(this)">
        </div>
    </div>

    <!-- Right: fields -->
    <div class="nc-right">
        <div>
            <p class="nc-field-label">Title</p>
            <input type="text" placeholder="Title for the post">
        </div>
        <div>
            <p class="nc-field-label">Description</p>
            <textarea placeholder="Description for the post..."></textarea>
        </div>
        <div>
            <p class="nc-field-label">Community</p>
            <select>
                <option value="" disabled selected>Select community</option>
            </select>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="nc-footer">
    <input type="text" class="nc-tags-input" placeholder="# For the post">
    <div class="nc-confirm">
        <span>Sure you wanna post it?</span>
        <button type="button" class="nc-post-btn">Post Thread</button>
    </div>
</div>