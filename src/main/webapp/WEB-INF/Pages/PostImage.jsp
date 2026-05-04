<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Image</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostImage.css">
</head>
<body>
<div class="post">
    <div class="post-right">
        <div class="upload">
        <span class="material-symbols-light--upload-rounded"> </span>
            <button class="up">Upload an Image</button>
        </div>
        <div class="text">

            <input type="text" class="title" placeholder= "Title for the post">

            <textarea placeholder="Description for the
            post..."></textarea>
        <div class="selcect_comm">
            <select>
                <option value="" disabled selected hidden> Select community</option>

            </select>
        </div>
        </div>

        </div>

        <div class="end_section">
        <div class="has">
            # For the post
        </div>
        <div class="confirm_post">
            Sure you wanna post it?
            <button class="confirm">Post Thread</button>
        </div>
        </div>
    </div>
    </div>
</body>
</html>