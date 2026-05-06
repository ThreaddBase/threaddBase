<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userHome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    
    <section id="main-section">
        <section class="section1">
                <div class="new-thread-container">
                <p>What's on your mind? Start a Thread...</p>
                <div class="thread-option">
                    <a href="#">
                        <i class="fas fa-image"></i>
                        <span>Photo</span>
                    </a>
                    <a href="#">
                        <i class="fa-brands fa-shoelace fa-rotate-270"></i>
                        <span>Thread</span>
                    </a>
                </div>
            </div>

            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
        </section>
                <section class="section2">
                	<p>Discover Communities</p>
		            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
		                <img src="" alt="Logo" class="community-profile">
		                <p>Community Name</p>
		            </a>
		            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
		                <img src="" alt="Logo" class="community-profile">
		                <p>Community Name</p>
		            </a>
		            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
		                <img src="" alt="Logo" class="community-profile">
		                <p>Community Name</p>
		            </a>
        </section>
    </section>
    
    
    <%@ include file="notificationModel.jsp" %>
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
</html> --%>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userHome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostImage.css">     ← NEW
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostMessage.css">   ← NEW
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/threadModal.css">   ← NEW
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
    integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
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

    <section id="main-section">
        <section class="section1">
            <div class="new-thread-container">
                <p>What's on your mind? Start a Thread...</p>
                <div class="thread-option">
                    ← CHANGE: was <a href="#">, now has id for modal trigger
                    <a href="#" id="openPhotoModal">
                        <i class="fas fa-image"></i>
                        <span>Photo</span>
                    </a>
                    <a href="#" id="openThreadModal">
                        <i class="fa-brands fa-shoelace fa-rotate-270"></i>
                        <span>Thread</span>
                    </a>
                </div>
            </div>

            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
        </section>

        <section class="section2">
            <p>Discover Communities</p>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
        </section>
    </section>

    <%@ include file="notificationModel.jsp" %>

    ← NEW: Photo Modal
    <div class="modal-overlay" id="photoModal">
        <div class="modal-box">
            <div class="modal-header">
                <h2>Create a Photo Thread</h2>
                <button class="modal-close" id="closePhotoModal">&#x2715;</button>
            </div>
            <%@ include file="PostImage.jsp" %>
        </div>
    </div>

    ← NEW: Thread Modal
    <div class="modal-overlay" id="threadModal">
        <div class="modal-box">
            <div class="modal-header">
                <h2>Create a Thread</h2>
                <button class="modal-close" id="closeThreadModal">&#x2715;</button>
            </div>
            <%@ include file="PostMessage.jsp" %>
        </div>
    </div>

    <script>
        // ── Tag scroll logic (unchanged) ──
        const tagList    = document.querySelector('.tag-list');
        const arrowLeft  = document.getElementById('arrowLeft');
        const arrowRight = document.getElementById('arrowRight');
        const tags       = document.querySelectorAll('.tag-list span');
        const SCROLL_AMOUNT = 200;

        arrowLeft.addEventListener('click',  () => { tagList.scrollLeft -= SCROLL_AMOUNT; });
        arrowRight.addEventListener('click', () => { tagList.scrollLeft += SCROLL_AMOUNT; });

        function updateArrows() {
            const atStart = tagList.scrollLeft <= 0;
            const atEnd   = tagList.scrollLeft + tagList.clientWidth >= tagList.scrollWidth - 1;
            arrowLeft.classList.toggle('hidden', atStart);
            arrowRight.classList.toggle('hidden', atEnd);
        }
        tagList.addEventListener('scroll', updateArrows);
        window.addEventListener('resize', updateArrows);
        updateArrows();

        let isDown = false, startX, scrollStart;
        tagList.addEventListener('mousedown', (e) => {
            isDown = true;
            tagList.classList.add('dragging');
            startX = e.pageX - tagList.offsetLeft;
            scrollStart = tagList.scrollLeft;
        });
        document.addEventListener('mouseup',   () => { isDown = false; tagList.classList.remove('dragging'); });
        document.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            tagList.scrollLeft = scrollStart - (e.pageX - tagList.offsetLeft - startX);
        });

        tags.forEach(tag => {
            tag.addEventListener('click', () => {
                tags.forEach(t => t.classList.remove('active'));
                tag.classList.add('active');
            });
        });

        // ── NEW: Modal logic ──
        function openModal(overlay)  { overlay.classList.add('active'); }
        function closeModal(overlay) { overlay.classList.remove('active'); }

        const photoModal  = document.getElementById('photoModal');
        const threadModal = document.getElementById('threadModal');

        document.getElementById('openPhotoModal').addEventListener('click',  (e) => { e.preventDefault(); openModal(photoModal);  });
        document.getElementById('closePhotoModal').addEventListener('click', ()  => { closeModal(photoModal);  });

        document.getElementById('openThreadModal').addEventListener('click',  (e) => { e.preventDefault(); openModal(threadModal);  });
        document.getElementById('closeThreadModal').addEventListener('click', ()  => { closeModal(threadModal); });

        // Close on outside click
        [photoModal, threadModal].forEach(modal => {
            modal.addEventListener('click', (e) => {
                if (e.target === modal) closeModal(modal);
            });
        });

        // Close on Escape
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                closeModal(photoModal);
                closeModal(threadModal);
            }
        });
    </script>
</body>
</html> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userHome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostImage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostMessage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/homeModal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
    integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="topSearchbar.jsp" %>

    <!-- Tag scroll bar -->
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

    <section id="main-section">
        <section class="section1">
            <div class="new-thread-container">
                <p>What's on your mind? Start a Thread...</p>
                <div class="thread-option">
                    <a href="#" onclick="openPhotoPopup(); return false;">
                        <i class="fas fa-image"></i>
                        <span>Photo</span>
                    </a>
                    <a href="#" onclick="openThreadPopup(); return false;">
                        <i class="fa-brands fa-shoelace fa-rotate-270"></i>
                        <span>Thread</span>
                    </a>
                </div>
            </div>

            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
        </section>

        <section class="section2">
            <p>Discover Communities</p>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
        </section>
    </section>

    <%@ include file="notificationModel.jsp" %>

    <!-- Photo Popup -->
    <div class="hm-overlay" id="hmPhotoModal">
        <div class="hm-box">
            <div class="hm-header">
                <h2>Create a Photo Thread</h2>
                <button class="hm-close" onclick="closePhotoPopup()">&#x2715;</button>
            </div>
            <%@ include file="PostImage.jsp" %>
        </div>
    </div>

    <!-- Thread Popup -->
    <div class="hm-overlay" id="hmThreadModal">
        <div class="hm-box">
            <div class="hm-header">
                <h2>Create a Thread</h2>
                <button class="hm-close" onclick="closeThreadPopup()">&#x2715;</button>
            </div>
            <%@ include file="PostMessage.jsp" %>
        </div>
    </div>

    <script>
        /* ── Tag scroll ── */
        const tagList    = document.querySelector('.tag-list');
        const arrowLeft  = document.getElementById('arrowLeft');
        const arrowRight = document.getElementById('arrowRight');
        const tags       = document.querySelectorAll('.tag-list span');
        const SCROLL_AMOUNT = 200;

        arrowLeft.addEventListener('click',  () => { tagList.scrollLeft -= SCROLL_AMOUNT; });
        arrowRight.addEventListener('click', () => { tagList.scrollLeft += SCROLL_AMOUNT; });

        function updateArrows() {
            const atStart = tagList.scrollLeft <= 0;
            const atEnd   = tagList.scrollLeft + tagList.clientWidth >= tagList.scrollWidth - 1;
            arrowLeft.classList.toggle('hidden', atStart);
            arrowRight.classList.toggle('hidden', atEnd);
        }
        tagList.addEventListener('scroll', updateArrows);
        window.addEventListener('resize', updateArrows);
        updateArrows();

        let isDown = false, startX, scrollStart;
        tagList.addEventListener('mousedown', (e) => {
            isDown = true; tagList.classList.add('dragging');
            startX = e.pageX - tagList.offsetLeft;
            scrollStart = tagList.scrollLeft;
        });
        document.addEventListener('mouseup',   () => { isDown = false; tagList.classList.remove('dragging'); });
        document.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            tagList.scrollLeft = scrollStart - (e.pageX - tagList.offsetLeft - startX);
        });

        tags.forEach(tag => {
            tag.addEventListener('click', () => {
                tags.forEach(t => t.classList.remove('active'));
                tag.classList.add('active');
            });
        });

        /* ── Photo popup ── */
        function openPhotoPopup()  { document.getElementById('hmPhotoModal').classList.add('active'); }
        function closePhotoPopup() { document.getElementById('hmPhotoModal').classList.remove('active'); }

        /* ── Thread popup ── */
        function openThreadPopup()  { document.getElementById('hmThreadModal').classList.add('active'); }
        function closeThreadPopup() { document.getElementById('hmThreadModal').classList.remove('active'); }

        /* ── Close on outside click ── */
        document.getElementById('hmPhotoModal').addEventListener('click', function(e) {
            if (e.target === this) closePhotoPopup();
        });
        document.getElementById('hmThreadModal').addEventListener('click', function(e) {
            if (e.target === this) closeThreadPopup();
        });

        /* ── Close on Escape ── */
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') { closePhotoPopup(); closeThreadPopup(); }
        });
    </script>
</body>
</html> --%>



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
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/notificationModel.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/userHome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostImage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/PostMessage.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/homeModal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
    integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="topSearchbar.jsp" %>

    <div class="uh-tag">
        <button class="uh-tag-arrow uh-hidden" id="arrowLeft">
            <i class="fas fa-chevron-left"></i>
        </button>
        <div class="uh-tag-list">
            <span class="uh-active">All</span>
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
        <button class="uh-tag-arrow" id="arrowRight">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>

    <section id="main-section">
        <section class="section1">
            <div class="new-thread-container">
                <p>What's on your mind? Start a Thread...</p>
                <div class="thread-option">
                    <a href="#" onclick="openPhotoPopup(); return false;">
                        <i class="fas fa-image"></i>
                        <span>Photo</span>
                    </a>
                    <a href="#" onclick="openThreadPopup(); return false;">
                        <i class="fa-brands fa-shoelace fa-rotate-270"></i>
                        <span>Thread</span>
                    </a>
                </div>
            </div>

            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
            <%@ include file="post.jsp" %>
        </section>

        <section class="section2">
            <p>Discover Communities</p>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
            <a href="<%=request.getContextPath()%>/community/view" class="discover-communities">
                <img src="" alt="Logo" class="community-profile">
                <p>Community Name</p>
            </a>
        </section>
    </section>

    <%@ include file="notificationModel.jsp" %>

    <!-- Photo Popup -->
    <div class="hm-overlay" id="hmPhotoModal">
        <div class="hm-box">
            <div class="hm-header">
                <h2>Create a Photo Thread</h2>
                <button class="hm-close" onclick="closePhotoPopup()">&#x2715;</button>
            </div>
            <%@ include file="PostImage.jsp" %>
        </div>
    </div>

    <!-- Thread Popup -->
    <div class="hm-overlay" id="hmThreadModal">
        <div class="hm-box">
            <div class="hm-header">
                <h2>Create a Thread</h2>
                <button class="hm-close" onclick="closeThreadPopup()">&#x2715;</button>
            </div>
            <%@ include file="PostMessage.jsp" %>
        </div>
    </div>

    <script>
        /* ── Tag scroll ── */
        const tagList    = document.querySelector('.uh-tag-list');
        const arrowLeft  = document.getElementById('arrowLeft');
        const arrowRight = document.getElementById('arrowRight');
        const tags       = document.querySelectorAll('.uh-tag-list span');
        const SCROLL_AMOUNT = 200;

        arrowLeft.addEventListener('click',  () => { tagList.scrollLeft -= SCROLL_AMOUNT; });
        arrowRight.addEventListener('click', () => { tagList.scrollLeft += SCROLL_AMOUNT; });

        function updateArrows() {
            const atStart = tagList.scrollLeft <= 0;
            const atEnd   = tagList.scrollLeft + tagList.clientWidth >= tagList.scrollWidth - 1;
            arrowLeft.classList.toggle('uh-hidden', atStart);
            arrowRight.classList.toggle('uh-hidden', atEnd);
        }
        tagList.addEventListener('scroll', updateArrows);
        window.addEventListener('resize', updateArrows);
        updateArrows();

        let isDown = false, startX, scrollStart;
        tagList.addEventListener('mousedown', (e) => {
            isDown = true; tagList.classList.add('dragging');
            startX = e.pageX - tagList.offsetLeft;
            scrollStart = tagList.scrollLeft;
        });
        document.addEventListener('mouseup', () => { isDown = false; tagList.classList.remove('dragging'); });
        document.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();
            tagList.scrollLeft = scrollStart - (e.pageX - tagList.offsetLeft - startX);
        });

        tags.forEach(tag => {
            tag.addEventListener('click', () => {
                tags.forEach(t => t.classList.remove('uh-active'));
                tag.classList.add('uh-active');
            });
        });

        /* ── Photo popup ── */
        function openPhotoPopup()  { document.getElementById('hmPhotoModal').classList.add('active'); }
        function closePhotoPopup() { document.getElementById('hmPhotoModal').classList.remove('active'); }

        /* ── Thread popup ── */
        function openThreadPopup()  { document.getElementById('hmThreadModal').classList.add('active'); }
        function closeThreadPopup() { document.getElementById('hmThreadModal').classList.remove('active'); }

        /* ── Close on outside click ── */
        document.getElementById('hmPhotoModal').addEventListener('click', function(e) {
            if (e.target === this) closePhotoPopup();
        });
        document.getElementById('hmThreadModal').addEventListener('click', function(e) {
            if (e.target === this) closeThreadPopup();
        });

        /* ── Close on Escape ── */
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') { closePhotoPopup(); closeThreadPopup(); }
        });
    </script>
</body>
</html>

