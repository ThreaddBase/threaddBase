<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewCommunity.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<%@ include file="sidebar.jsp" %>
	<%@ include file="topSearchbar.jsp" %>

    <div class="community-profile">
        <div class="community-left">
            <img src="../frog.jpg" class="community-pic">
            <div class="community-desc">
                <span>Community name</span>
                <span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iste recusanda ur adipisicing elit. Iste recusanda ur adipisicing elit. Iste recusanda</span>
            </div>
        </div>
        <div class="community-right">
            <button class="add-btn">Create Thread</button>
        </div>
    </div>

    <div class="community-tag">
        <p>Popular Tags</p>
        <div class="tag-list">
            <span>All</span>
            <span>#Tag1</span>
            <span>#Tag3</span>
            <span>#Tag4</span>
            <span>#Tag5</span>
        </div>
    </div>

    <section>
        <div class="community-list">
        	<%@ include file="post.jsp" %>
        	<%@ include file="post.jsp" %>
        	<%@ include file="post.jsp" %>
        </div>
        <div class="about-community">
            <p>About Community</p>
            <p>This is a brief description of the community and its purpose.</p>
            <p>Created At: 2023-10-28</p>
            <div class="member-status">
                <span><i class="fa-solid fa-users"></i> 101 Members</span>
                <span><i class="fa-solid fa-user-check"></i> 10 Online</span>
            </div>
            <button class="join-community">Join Community</button>
        </div>
    </section>
    <%@ include file="notificationModel.jsp" %>
</body>
</html> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewCommunity.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/threadModal.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostImage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="topSearchbar.jsp" %>

    <div class="community-profile">
        <div class="community-left">
            <img src="../frog.jpg" class="community-pic">
            <div class="community-desc">
                <span>Community name</span>
                <span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iste recusanda ur adipisicing elit. Iste recusanda ur adipisicing elit. Iste recusanda</span>
            </div>
        </div>
        <div class="community-right">
            ← CHANGE: added id="openThreadModal"
            <button class="add-btn" id="openThreadModal">Create Thread</button>
        </div>
    </div>

    <div class="community-tag">
        <p>Popular Tags</p>
        <div class="tag-list">
            <span>All</span>
            <span>#Tag1</span>
            <span>#Tag3</span>
            <span>#Tag4</span>
            <span>#Tag5</span>
        </div>
    </div>

    <section>
        <div class="community-list">
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
        </div>
        <div class="about-community">
            <p>About Community</p>
            <p>This is a brief description of the community and its purpose.</p>
            <p>Created At: 2023-10-28</p>
            <div class="member-status">
                <span><i class="fa-solid fa-users"></i> 101 Members</span>
                <span><i class="fa-solid fa-user-check"></i> 10 Online</span>
            </div>
            <button class="join-community">Join Community</button>
        </div>
    </section>

    <%@ include file="notificationModel.jsp" %>

    ← NEW: Thread Modal
    <div class="modal-overlay" id="threadModal">
        <div class="modal-box">
            <div class="modal-header">
                <h2>Create a New Thread</h2>
                <button class="modal-close" id="closeThreadModal">&#x2715;</button>
            </div>
            <%@ include file="PostImage.jsp" %>
        </div>
    </div>

    ← NEW: Modal Script
    <script>
        const openBtn  = document.getElementById('openThreadModal');
        const closeBtn = document.getElementById('closeThreadModal');
        const overlay  = document.getElementById('threadModal');

        openBtn.addEventListener('click',  () => overlay.classList.add('active'));
        closeBtn.addEventListener('click', () => overlay.classList.remove('active'));
        overlay.addEventListener('click',  (e) => {
            if (e.target === overlay) overlay.classList.remove('active');
        });
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') overlay.classList.remove('active');
        });
    </script>

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/viewCommunity.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostImage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/createThread.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="topSearchbar.jsp" %>

    <div class="community-profile">
        <div class="community-left">
            <img src="../frog.jpg" class="community-pic">
            <div class="community-desc">
                <span>Community name</span>
                <span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iste recusanda ur adipisicing elit. Iste recusanda ur adipisicing elit. Iste recusanda</span>
            </div>
        </div>
        <div class="community-right">
            <button class="add-btn" onclick="openThreadModal()">Create Thread</button>
        </div>
    </div>

    <div class="community-tag">
        <p>Popular Tags</p>
        <div class="tag-list">
            <span>All</span>
            <span>#Tag1</span>
            <span>#Tag3</span>
            <span>#Tag4</span>
            <span>#Tag5</span>
        </div>
    </div>

    <section>
        <div class="community-list">
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
        </div>
        <div class="about-community">
            <p>About Community</p>
            <p>This is a brief description of the community and its purpose.</p>
            <p>Created At: 2023-10-28</p>
            <div class="member-status">
                <span><i class="fa-solid fa-users"></i> 101 Members</span>
                <span><i class="fa-solid fa-user-check"></i> 10 Online</span>
            </div>
            <button class="join-community">Join Community</button>
        </div>
    </section>

    <%@ include file="notificationModel.jsp" %>

    <!-- Create Thread Modal -->
    <div class="ct-overlay" id="createThreadModal">
        <div class="ct-box">
            <div class="ct-header">
                <h2>Create a New Thread</h2>
                <button class="ct-close" onclick="closeThreadModal()">&#x2715;</button>
            </div>
            <%@ include file="PostImage.jsp" %>
        </div>
    </div>

    <script>
        function openThreadModal() {
            document.getElementById('createThreadModal').classList.add('active');
        }

        function closeThreadModal() {
            document.getElementById('createThreadModal').classList.remove('active');
        }

        // Close on outside click
        document.getElementById('createThreadModal').addEventListener('click', function(e) {
            if (e.target === this) closeThreadModal();
        });

        // Close on Escape
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') closeThreadModal();
        });
    </script>

</body>
</html>
