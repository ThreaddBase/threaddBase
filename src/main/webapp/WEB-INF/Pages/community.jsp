<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/community.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="topSearchbar.jsp" %>
    <section>
    
    <p>Discover More <span>Communities</span></p>
    
    <div class="community-list">
    	<div class="community-card">
            <img class="community-thumb"
                src="https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop"
                alt="Community image" />
            <div class="card-details">
                <div class="card-title">Community Name</div>
                <div class="card-created">Created at - 2023-10-28</div>
                <div class="card-desc">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
                    explicabo consequatur ex...</div>
                <div class="card-action-btns">
                    <button class="view-btn">
                    	<a href="<%=request.getContextPath()%>/community/view">
                    		View Community
                    	</a>
                   	</button>
                    <button class="join-btn">Join Community</button>
                </div>
            </div>
        </div>
        
        <div class="community-card">
            <img class="community-thumb"
                src="https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop"
                alt="Community image" />
            <div class="card-details">
                <div class="card-title">Community Name</div>
                <div class="card-created">Created at - 2023-10-28</div>
                <div class="card-desc">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
                    explicabo consequatur ex...</div>
                <div class="card-action-btns">
                    <div class="card-action-btns">
                    <button class="view-btn">
                    	<a href="<%=request.getContextPath()%>/community/view">
                    		View Community
                    	</a>
                   	</button>
                    <button class="join-btn">Join Community</button>
                </div>
                </div>
            </div>
        </div>
        
        <div class="community-card">
            <img class="community-thumb"
                src="https://images.pexels.com/photos/1595385/pexels-photo-1595385.jpeg?auto=compress&cs=tinysrgb&w=400&h=300&fit=crop"
                alt="Community image" />
            <div class="card-details">
                <div class="card-title">Community Name</div>
                <div class="card-created">Created at - 2023-10-28</div>
                <div class="card-desc">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
                    explicabo consequatur ex...</div> 	
                <div class="card-action-btns">
                    <div class="card-action-btns">
                    <button class="view-btn">
                    	<a href="<%=request.getContextPath()%>/community/view">
                    		View Community
                    	</a>
                   	</button>
                    <button class="join-btn">Join Community</button>
                </div>
                </div>
            </div>
        </div>
    </div>
    </section>
    <%@ include file="notificationModel.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/js/all.min.js" 
integrity="sha512-6BTOlkauINO65nLhXhthZMtepgJSghyimIalb+crKRPhvhmsCdnIuGcVbR5/aQY2A+260iC1OPy1oCdB6pSSwQ==" 
crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
</body>
</html>