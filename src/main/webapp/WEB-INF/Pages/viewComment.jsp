<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Comments</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewComment.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

    <i class="fa-solid fa-circle-arrow-left back-button" onclick="history.back()"></i>

    <!-- Post Author Profile -->

    <div class="profile">
        <div class="avatar">
            <img src="https://static.vecteezy.com/system/resources/previews/046/409/821/non_2x/avatar-profile-icon-in-flat-style-male-user-profile-illustration-on-isolated-background-man-profile-sign-business-concept-vector.jpg"
                alt="avatar">
        </div>
        <div class="content">
            <h1>Username</h1>
            <span>2026/01/01 · 1y ago</span>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                Laboriosam rerum explicabo consequatur eligendi excepturi.</p>
        </div>
    </div>

    <!-- Post Image -->
    <div class="main_content">
        <img src="https://external-preview.redd.it/jannik-sinner-madrid-open-win-against-alexander-zverev-sets-v0-bxlfQEu-8mU8OQ_u55qG3Eqlw73nE0IwHMknGU5e3dw.jpeg?auto=webp&s=26f25e89ace734d55002528e4a09268941ab5a0a"
            alt="post image">
    </div>

    <!-- Post Actions — keep as plain spans, no wrapper divs -->
    <div class="post-actions">
        <span><i class="fa-regular fa-circle-check"></i> 101</span>
        <span><i class="fa-regular fa-comment"></i> 101</span>
        <span><i class="fa-regular fa-bookmark"></i> 101</span>
        <span class="report"><i class="fa-solid fa-triangle-exclamation"></i></span>
    </div>

    <!-- Comment Input -->
    <div class="comment-box">
        <form class="post-form" action="<%=request.getContextPath()%>/comment" method="post">
            <input type="hidden" name="postId" value="1" />
            <input type="text" name="content" placeholder="Hop into the conversation...">
            <button type="submit">Post</button>
        </form>
    </div>

    <!-- Comments List -->
    <section class="comment-section">
    	<%@ include file="comment.jsp" %>
    	<%@ include file="nestedComment.jsp" %>
    </section>
    <script>
        function toggleReply(id) {
            const el = document.getElementById(id);
            el.style.display = el.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</script>
</body>
</html>