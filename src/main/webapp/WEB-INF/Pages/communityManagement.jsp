<%-- <%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/communityManagement.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Community Management</title>
</head>
<body>
 <!-- SIDEBAR -->
    <%@ include file="adminSidebar.jsp" %>
    

    <!-- MAIN CONTENT -->
    <div class="main-content">
    
    <!-- Search centered + Profile pinned right -->
        <div class="top-bar">
            <div class="search-box">
                <input type="text" placeholder="Search" />
                <i class="fas fa-magnifying-glass"></i>
            </div>
            <button class="profile-btn">
                <i class="fas fa-circle-user"></i>
                <span>Profile</span>
            </button>
        </div>
    
        <!-- Title on left, Create + Filter buttons on right -->
        <div class="heading-row">
            <h1 class="page-heading">Manage, Monitor &amp;<br>Moderate the<br>Communities</h1>
            <div class="heading-buttons">
                <button class="create-community-btn">Create a new community</button>
                <div class="btn-sep"></div>
                <button class="filter-sort-btn">Filter/Sort</button>
            </div>
        </div>

        <!-- COMMUNITY CARDS -->
        <div class="community-list">
			
			<c:forEach var="community" items="${communityList}">
				<div class="community-card">
                	<c:choose>
				        <c:when test="${not empty community.communityProfileBase64}">
				            <img class="community-thumb"
				                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
				                 alt="avatar"/>
				        </c:when>
				        <c:otherwise>
				            <img class="community-thumb"
				                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
				                 alt="avatar"/>
				        </c:otherwise>
				    </c:choose>
                <div class="card-details">
                    <div class="card-title">${community.name}</div>
                    <div class="card-created">Created at - ${community.createdAt}</div>
                    <div class="card-desc">${community.description}</div>
                    <div class="card-action-btns">
                        <button class="view-btn"><a href="<%=request.getContextPath()%>/community/view?id=${community.id}">View Community</a></button>
                        <button class="delete-btn">Delete Community</button>
                    </div>
                </div>
            </div>
				
			</c:forEach>
			
			<c:if test="${empty communityList}">
                <div class="no-data">No Community found.</div>
            </c:if>
        </div>
    </div>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/communityManagement.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newCommunity.css"> ← NEW
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
    integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Community Management</title>
</head>
<body>
    <%@ include file="adminSidebar.jsp" %>

    <div class="main-content">

        <div class="top-bar">
            <div class="search-box">
                <input type="text" placeholder="Search" />
                <i class="fas fa-magnifying-glass"></i>
            </div>
            <button class="profile-btn">
                <i class="fas fa-circle-user"></i>
                <span>Profile</span>
            </button>
        </div>

        <div class="heading-row">
            <h1 class="page-heading">Manage, Monitor &amp;<br>Moderate the<br>Communities</h1>
            <div class="heading-buttons">
                ← CHANGE: added onclick
                <button class="create-community-btn" onclick="openNewCommunity()">
                    Create a new community
                </button>
                <div class="btn-sep"></div>
                <!-- <button class="sort-cycle-btn" id="sortBtn" onclick="cycleSort()">
    <i class="fas fa-arrow-up-arrow-down"></i>
    <span id="sortLabel">Sort: Default</span>
</button> -->
<div class="sort-dropdown-wrapper">
    <button class="sort-cycle-btn" onclick="toggleSortDropdown()">
        <i class="fas fa-arrow-up-arrow-down"></i>
        <span id="sortLabel">Sort: Default</span>
        <i class="fas fa-chevron-down sort-chevron" id="sortChevron"></i>
    </button>
    <div class="sort-dropdown" id="sortDropdown">
        <a href="<%=request.getContextPath()%>/admin/community?sort=default" class="sort-option">
            <i class="fas fa-border-all"></i> Default
        </a>
        <a href="<%=request.getContextPath()%>/admin/community?sort=users" class="sort-option">
            <i class="fas fa-users"></i> By Users
        </a>
        <a href="<%=request.getContextPath()%>/admin/community?sort=posts" class="sort-option">
            <i class="fas fa-file-lines"></i> By Posts
        </a>
        <a href="<%=request.getContextPath()%>/admin/community?sort=name" class="sort-option">
            <i class="fas fa-arrow-down-a-z"></i> A → Z
        </a>
    </div>
</div>
            </div>
        </div>

        <div class="community-list">
            <c:forEach var="community" items="${communityList}">
                <div class="community-card">
                <div class="community-list" id="communityList">
    <c:forEach var="community" items="${communityList}">
        <div class="community-card"
             data-name="${community.name}"
             data-posts="0"
             data-users="0">
                    <c:choose>
                        <c:when test="${not empty community.communityProfileBase64}">
                            <img class="community-thumb"
                                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
                                 alt="avatar"/>
                        </c:when>
                        <c:otherwise>
                            <img class="community-thumb"
                                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
                                 alt="avatar"/>
                        </c:otherwise>
                    </c:choose>
                    <div class="card-details">
                        <div class="card-title">${community.name}</div>
                        <div class="card-created">Created at - ${community.createdAt}</div>
                        <div class="card-desc">${community.description}</div>
                        <div class="card-action-btns">
                            <button class="view-btn">
                                <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
                                    View Community
                                </a>
                            </button>
                            <button class="delete-btn" onclick="openDeleteModal('${community.id}')">Delete Community</button>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty communityList}">
                <div class="no-data">No Community found.</div>
            </c:if>
        </div>
    </div>

    ← NEW: Modal
    <div class="nc-overlay" id="newCommunityModal">
        <div class="nc-box">
            <button class="nc-close" onclick="closeNewCommunity()">&#x2715;</button>
            <%@ include file="newCommunity.jsp" %>
        </div>
    </div>
<!-- Delete Confirmation Modal -->
    <div class="del-overlay" id="deleteModal">
        <div class="del-box">
            <div class="del-header">
                <span class="del-title">
                    <i class="fas fa-triangle-exclamation del-warn-icon"></i>
                    Delete Community
                </span>
                <button class="del-close" onclick="closeDeleteModal()">&#x2715;</button>
            </div>
            <div class="del-divider"></div>
            <div class="del-body">
                <p class="del-question">Are you sure you want to delete?</p>
                <div class="del-warning-box">
                    <i class="fas fa-triangle-exclamation"></i>
                    <p>Warning: This is a permanent delete. All data associated with this community will be immediately and irreversibly purged from the system. This action cannot be undone.</p>
                </div>
            </div>
            <div class="del-divider"></div>
            <div class="del-footer">
                <button class="del-keep-btn" onclick="closeDeleteModal()">No, Keep it</button>
                <a id="delConfirmLink" href="#">
                    <button class="del-confirm-btn">
                        <i class="fas fa-trash-can"></i> Yes, Delete
                    </button>
                </a>
            </div>
        </div>
    </div>

    ← NEW: Script
<script>
        function openNewCommunity() {
            document.getElementById('newCommunityModal').classList.add('active');
        }
        function closeNewCommunity() {
            document.getElementById('newCommunityModal').classList.remove('active');
        }
        document.getElementById('newCommunityModal').addEventListener('click', function(e) {
            if (e.target === this) closeNewCommunity();
        });

        function openDeleteModal(communityId) {
            const link = document.getElementById('delConfirmLink');
            link.href = '<%=request.getContextPath()%>/community/delete?id=' + communityId;
            document.getElementById('deleteModal').classList.add('active');
        }
        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('active');
        }
        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) closeDeleteModal();
        });
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeNewCommunity();
                closeDeleteModal();
            }
        });

        function previewNcImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.getElementById('ncPreviewImg');
                    img.src = e.target.result;
                    img.style.display = 'block';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    
    <script>
    // ── Sort cycle ──
    const sortModes = ['Default', 'Users', 'Posts', 'A → Z'];
    let sortIndex = 0;

    function cycleSort() {
        sortIndex = (sortIndex + 1) % sortModes.length;
        document.getElementById('sortLabel').textContent = 'Sort: ' + sortModes[sortIndex];
        sortCards(sortModes[sortIndex]);
    }

    function sortCards(mode) {
        const list = document.getElementById('communityList');
        const cards = Array.from(list.querySelectorAll('.community-card'));

        cards.sort((a, b) => {
            if (mode === 'Users') {
                return parseInt(b.dataset.users) - parseInt(a.dataset.users);
            } else if (mode === 'Posts') {
                return parseInt(b.dataset.posts) - parseInt(a.dataset.posts);
            } else if (mode === 'A → Z') {
                return a.dataset.name.localeCompare(b.dataset.name);
            }
            return 0;
        });

        cards.forEach(card => list.appendChild(card));
    }

    // ── New community modal ──
    function openNewCommunity() {
        document.getElementById('newCommunityModal').classList.add('active');
    }
    function closeNewCommunity() {
        document.getElementById('newCommunityModal').classList.remove('active');
    }
    document.getElementById('newCommunityModal').addEventListener('click', function(e) {
        if (e.target === this) closeNewCommunity();
    });

    // ── Delete modal ──
    function openDeleteModal(communityId) {
        const link = document.getElementById('delConfirmLink');
        link.href = '<%=request.getContextPath()%>/community/delete?id=' + communityId;
        document.getElementById('deleteModal').classList.add('active');
    }
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.remove('active');
    }
    document.getElementById('deleteModal').addEventListener('click', function(e) {
        if (e.target === this) closeDeleteModal();
    });

    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeNewCommunity();
            closeDeleteModal();
        }
    });

    function previewNcImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.getElementById('ncPreviewImg');
                img.src = e.target.result;
                img.style.display = 'block';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script>
    // ── Sort cycle ──
    const sortModes = ['Default', 'Users', 'Posts', 'A → Z'];
    let sortIndex = 0;

    // Save original order on page load before any sorting
    const communityListEl = document.getElementById('communityList');
    const originalOrder = Array.from(communityListEl.querySelectorAll('.community-card'));

    function cycleSort() {
        sortIndex = (sortIndex + 1) % sortModes.length;
        document.getElementById('sortLabel').textContent = 'Sort: ' + sortModes[sortIndex];
        sortCards(sortModes[sortIndex]);
    }

    function sortCards(mode) {
        const list = document.getElementById('communityList');

        if (mode === 'Default') {
            originalOrder.forEach(card => list.appendChild(card));
            return;
        }

        const cards = Array.from(list.querySelectorAll('.community-card'));

        cards.sort((a, b) => {
            if (mode === 'Users') {
                return parseInt(b.dataset.users) - parseInt(a.dataset.users);
            } else if (mode === 'Posts') {
                return parseInt(b.dataset.posts) - parseInt(a.dataset.posts);
            } else if (mode === 'A → Z') {
                return a.dataset.name.localeCompare(b.dataset.name);
            }
            return 0;
        });

        cards.forEach(card => list.appendChild(card));
    }
// onclick of a particular button text should only change



    // ── New community modal ──
    function openNewCommunity() {
        document.getElementById('newCommunityModal').classList.add('active');
    }
    function closeNewCommunity() {
        document.getElementById('newCommunityModal').classList.remove('active');
    }
    document.getElementById('newCommunityModal').addEventListener('click', function(e) {
        if (e.target === this) closeNewCommunity();
    });

    // ── Delete modal ──
    function openDeleteModal(communityId) {
        const link = document.getElementById('delConfirmLink');
        link.href = '<%=request.getContextPath()%>/community/delete?id=' + communityId;
        document.getElementById('deleteModal').classList.add('active');
    }
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.remove('active');
    }
    document.getElementById('deleteModal').addEventListener('click', function(e) {
        if (e.target === this) closeDeleteModal();
    });

    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeNewCommunity();
            closeDeleteModal();
        }
    });

    function previewNcImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.getElementById('ncPreviewImg');
                img.src = e.target.result;
                img.style.display = 'block';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<script>
    // ── Sort dropdown ──
    function toggleSortDropdown() {
        const dropdown = document.getElementById('sortDropdown');
        const chevron  = document.getElementById('sortChevron');
        dropdown.classList.toggle('open');
        chevron.classList.toggle('flipped');
    }

    // Close dropdown when clicking outside
    document.addEventListener('click', function(e) {
        const wrapper = document.querySelector('.sort-dropdown-wrapper');
        if (wrapper && !wrapper.contains(e.target)) {
            document.getElementById('sortDropdown').classList.remove('open');
            document.getElementById('sortChevron').classList.remove('flipped');
        }
    });

    // Highlight active sort based on URL param
    const urlParams = new URLSearchParams(window.location.search);
    const currentSort = urlParams.get('sort') || 'default';
    const sortLabels = {
        'default': 'Sort: Default',
        'users':   'Sort: Users',
        'posts':   'Sort: Posts',
        'name':    'Sort: A → Z'
    };
    document.getElementById('sortLabel').textContent = sortLabels[currentSort] || 'Sort: Default';

    // Mark active option
    document.querySelectorAll('.sort-option').forEach(option => {
        const href = option.getAttribute('href');
        if (href.includes('sort=' + currentSort)) {
            option.classList.add('active');
        }
    });

    // ── New community modal ──
    function openNewCommunity() {
        document.getElementById('newCommunityModal').classList.add('active');
    }
    function closeNewCommunity() {
        document.getElementById('newCommunityModal').classList.remove('active');
    }
    document.getElementById('newCommunityModal').addEventListener('click', function(e) {
        if (e.target === this) closeNewCommunity();
    });

    // ── Delete modal ──
    function openDeleteModal(communityId) {
        const link = document.getElementById('delConfirmLink');
        link.href = '<%=request.getContextPath()%>/community/delete?id=' + communityId;
        document.getElementById('deleteModal').classList.add('active');
    }
    function closeDeleteModal() {
        document.getElementById('deleteModal').classList.remove('active');
    }
    document.getElementById('deleteModal').addEventListener('click', function(e) {
        if (e.target === this) closeDeleteModal();
    });

    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeNewCommunity();
            closeDeleteModal();
        }
    });

    function previewNcImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.getElementById('ncPreviewImg');
                img.src = e.target.result;
                img.style.display = 'block';
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

</body>
</html> --%> 


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/communityManagement.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/newCommunity.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/sidebar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
    integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Community Management</title>
</head>
<body>
    <%@ include file="adminSidebar.jsp" %>

    <div class="main-content">

        <div class="top-bar">
            <div class="search-box">
                <input type="text" placeholder="Search" />
                <i class="fas fa-magnifying-glass"></i>
            </div>
            <button class="profile-btn">
                <i class="fas fa-circle-user"></i>
                <span>Profile</span>
            </button>
        </div>

        <div class="heading-row">
            <h1 class="page-heading">Manage, Monitor &amp;<br>Moderate the<br>Communities</h1>
            <div class="heading-buttons">

                <!-- Create button -->
                <button class="create-community-btn" onclick="openNewCommunity()">
                    Create a new community
                </button>

                <div class="btn-sep"></div>

                <!-- Pure CSS dropdown -->
                <details class="css-dropdown">
                    <summary class="css-dropdown-summary">
                        <i class="fas fa-arrow-up-arrow-down"></i>
                        <span id="sortLabel">Sort: Default</span>
                        <i class="fas fa-chevron-down css-dropdown-chevron"></i>
                    </summary>
                    <ul class="css-dropdown-menu">
                        <li>
                            <a href="<%=request.getContextPath()%>/admin/community?sort=default" class="css-drop-option">
                                <i class="fas fa-border-all"></i> Default
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/admin/community?sort=users" class="css-drop-option">
                                <i class="fas fa-users"></i> By Users
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/admin/community?sort=posts" class="css-drop-option">
                                <i class="fas fa-file-lines"></i> By Posts
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/admin/community?sort=name" class="css-drop-option">
                                <i class="fas fa-arrow-down-a-z"></i> A → Z
                            </a>
                        </li>
                    </ul>
                </details>

            </div>
        </div>

        <div class="community-list" id="communityList">
            <c:forEach var="community" items="${communityList}">
                <div class="community-card"
                     data-name="${community.name}"
                     data-posts="0"
                     data-users="0">
                    <c:choose>
                        <c:when test="${not empty community.communityProfileBase64}">
                            <img class="community-thumb"
                                 src="data:image/jpeg;base64,${community.communityProfileBase64}"
                                 alt="avatar"/>
                        </c:when>
                        <c:otherwise>
                            <img class="community-thumb"
                                 src="<%=request.getContextPath()%>/Assets/default-community.jpg"
                                 alt="avatar"/>
                        </c:otherwise>
                    </c:choose>
                    <div class="card-details">
                        <div class="card-title">${community.name}</div>
                        <div class="card-created">Created at - ${community.createdAt}</div>
                        <div class="card-desc">${community.description}</div>
                        <div class="card-action-btns">
                            <button class="view-btn">
                                <a href="<%=request.getContextPath()%>/community/view?id=${community.id}">
                                    View Community
                                </a>
                            </button>
                            <button class="delete-btn" onclick="openDeleteModal('${community.id}')">
                                Delete Community
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty communityList}">
                <div class="no-data">No Community found.</div>
            </c:if>
        </div>
    </div>

    <!-- New Community Modal -->
    <div class="nc-overlay" id="newCommunityModal">
        <div class="nc-box">
            <button class="nc-close" onclick="closeNewCommunity()">&#x2715;</button>
            <%@ include file="newCommunity.jsp" %>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="del-overlay" id="deleteModal">
        <div class="del-box">
            <div class="del-header">
                <span class="del-title">
                    <i class="fas fa-triangle-exclamation del-warn-icon"></i>
                    Delete Community
                </span>
                <button class="del-close" onclick="closeDeleteModal()">&#x2715;</button>
            </div>
            <div class="del-divider"></div>
            <div class="del-body">
                <p class="del-question">Are you sure you want to delete?</p>
                <div class="del-warning-box">
                    <i class="fas fa-triangle-exclamation"></i>
                    <p>Warning: This is a permanent delete. All data associated with this community will be immediately and irreversibly purged from the system. This action cannot be undone.</p>
                </div>
            </div>
            <div class="del-divider"></div>
            <div class="del-footer">
                <button class="del-keep-btn" onclick="closeDeleteModal()">No, Keep it</button>
                <a id="delConfirmLink" href="#">
                    <button class="del-confirm-btn">
                        <i class="fas fa-trash-can"></i> Yes, Delete
                    </button>
                </a>
            </div>
        </div>
    </div>

    <script>
        // Highlight active sort label from URL
        var urlParams = new URLSearchParams(window.location.search);
        var currentSort = urlParams.get('sort') || 'default';
        var sortLabels = {
            'default': 'Sort: Default',
            'users':   'Sort: Users',
            'posts':   'Sort: Posts',
            'name':    'Sort: A → Z'
        };
        document.getElementById('sortLabel').textContent = sortLabels[currentSort] || 'Sort: Default';

        // New community modal
        function openNewCommunity() {
            document.getElementById('newCommunityModal').classList.add('active');
        }
        function closeNewCommunity() {
            document.getElementById('newCommunityModal').classList.remove('active');
        }
        document.getElementById('newCommunityModal').addEventListener('click', function(e) {
            if (e.target === this) closeNewCommunity();
        });

        // Delete modal
        function openDeleteModal(communityId) {
            document.getElementById('delConfirmLink').href = '<%=request.getContextPath()%>/community/delete?id=' + communityId;
            document.getElementById('deleteModal').classList.add('active');
        }
        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('active');
        }
        document.getElementById('deleteModal').addEventListener('click', function(e) {
            if (e.target === this) closeDeleteModal();
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeNewCommunity();
                closeDeleteModal();
            }
        });

        function previewNcImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img = document.getElementById('ncPreviewImg');
                    img.src = e.target.result;
                    img.style.display = 'block';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</body>
</html>