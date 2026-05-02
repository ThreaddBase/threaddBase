<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/post.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/topSearchbar.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userHome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<%@ include file="sidebar.jsp" %>
	<%@ include file="topSearchbar.jsp" %>
	
<div class="tag">
        <button class="tag-arrow hidden" id="arrowLeft">
            <i class="fas fa-chevron-left"></i>
        </button>
        <div class="tag-list">
            <span class="active">All</span>
            <span>#Tag1</span>
            <span>#Tag2</span>
            <span>#Tag3</span>
            <span>#Tag4</span>
            <span>#Tag5</span>
            <span>#Tag6</span>
            <span>#Tag1</span>
            <span>#Tag2</span>
            <span>#Tag3</span>
            <span>#Tag4</span>
            <span>#Tag5</span>
            <span>#Tag6</span>
        </div>
        <button class="tag-arrow" id="arrowRight">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
    
<script>
	const tagList = document.querySelector('.tag-list');
	const arrowLeft = document.getElementById('arrowLeft');
	const arrowRight = document.getElementById('arrowRight');
	const tags = document.querySelectorAll('.tag-list span');
	const SCROLL_AMOUNT = 200;
	
	// arrow clicks
	arrowLeft.addEventListener('click', () => { tagList.scrollLeft -= SCROLL_AMOUNT; });
	arrowRight.addEventListener('click', () => { tagList.scrollLeft += SCROLL_AMOUNT; });
	
	// show/hide arrows based on scroll position
	function updateArrows() {
	    const atStart = tagList.scrollLeft <= 0;
	    const atEnd   = tagList.scrollLeft + tagList.clientWidth >= tagList.scrollWidth - 1;
	    arrowLeft.classList.toggle('hidden', atStart);
	    arrowRight.classList.toggle('hidden', atEnd);
	}
	tagList.addEventListener('scroll', updateArrows);
	window.addEventListener('resize', updateArrows);
	updateArrows();
	
	// drag-to-scroll on desktop
	let isDown = false, startX, scrollStart;
	tagList.addEventListener('mousedown', (e) => {
	    isDown = true;
	    tagList.classList.add('dragging');
	    startX = e.pageX - tagList.offsetLeft;
	    scrollStart = tagList.scrollLeft;
	});
	document.addEventListener('mouseup', () => { isDown = false; tagList.classList.remove('dragging'); });
	document.addEventListener('mousemove', (e) => {
	    if (!isDown) return;
	    e.preventDefault();
	    tagList.scrollLeft = scrollStart - (e.pageX - tagList.offsetLeft - startX);
	});
	
	// active tag highlight
	tags.forEach(tag => {
	    tag.addEventListener('click', () => {
	        tags.forEach(t => t.classList.remove('active'));
	        tag.classList.add('active');
	    });
	});
</script> 
</body>
</html>