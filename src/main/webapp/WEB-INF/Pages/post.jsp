<!--  <div class="post-card">
    <div class="post-left">
        <div class="post-header">
            <div class="avatar"></div>
            <div>
                <p class="username">Harry Newgate</p>
                <p class="post-date">2023-10-28</p>
            </div>
        </div>
        <p class="community-name">Community Name</p>
        <p class="post-body">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
            explicabo consequatur ex...</p>
        <p class="post-tags">#Tag #anothertag</p>
        <div class="post-actions">
            <span><i class="fa-regular fa-circle-check"></i> 101</span>
            <span><i class="fa-regular fa-comment"></i> 101</span>
            <span><i class="fa-regular fa-bookmark"></i> 101</span>
            <span class="report"><i class="fa-solid fa-triangle-exclamation"></i></span>
        </div>
    </div>
    <div class="post-image">
        <img src="../Badminton.jpeg" alt="post image">
    </div>
</div> -->
<%-- <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<div class="post-card">
    <div class="post-left">
        <div class="post-header">
            <div class="avatar"></div>
            <div>
                <p class="username">Harry Newgate</p>
                <p class="post-date">2023-10-28</p>
            </div>
        </div>
        <p class="community-name">Community Name</p>
        <p class="post-body">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
            explicabo consequatur ex...</p>
        <p class="post-tags">#Tag #anothertag</p>
        <div class="post-actions">
            <span><i class="fa-regular fa-circle-check"></i> 101</span>
            <span><i class="fa-regular fa-comment"></i> 101</span>
            <span><i class="fa-regular fa-bookmark"></i> 101</span>
            <!-- onclick opens the report popup -->
            <span class="report" onclick="openReportPopup()">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </span>
        </div>
    </div>
    <div class="post-image">
        <img src="../Badminton.jpeg" alt="post image">
    </div>
</div>


Guard: render the popup + script only once even if post.jsp is included many times
<% if (request.getAttribute("reportPopupRendered") == null) {
       request.setAttribute("reportPopupRendered", true); %>

<!-- Dark backdrop -->
<div class="report-popup-overlay" id="reportPopupOverlay" onclick="closeOnOutsideClick(event)">

    <!-- Report popup box -->
    <div class="report-popup-box">

        <!-- Header: black background, report icon + title -->
        <div class="report-popup-header">
            <div class="report-header-icon">
                <i class="fa-solid fa-circle-exclamation"></i>
            </div>
            <h2 class="report-popup-title">Report - User/Post</h2>
        </div>

        <!-- Form body: white/light background -->
        <div class="report-popup-body">

            <!-- Reason dropdown -->
            <div class="report-select-wrapper">
                <select class="report-select">
                    <option value="" disabled selected hidden>Choose a reason for reporting</option>
                    <option value="spam">Spam</option>
                    <option value="hate">Hate speech</option>
                    <option value="harassment">Harassment</option>
                    <option value="misinformation">Misinformation</option>
                    <option value="violence">Violence</option>
                    <option value="other">Other</option>
                </select>
                <i class="fa-solid fa-chevron-down report-select-arrow"></i>
            </div>

            <!-- Description textarea -->
            <textarea class="report-textarea" placeholder="Please provide a description regarding the situation"></textarea>

        </div>

        <!-- Submit button -->
        <button class="report-submit-btn" onclick="closeReportPopup()">Submit Report</button>

    </div>

</div>

<script>
    function openReportPopup() {
        document.getElementById('reportPopupOverlay').classList.add('open');
    }

    function closeReportPopup() {
        document.getElementById('reportPopupOverlay').classList.remove('open');
    }

    function closeOnOutsideClick(event) {
        if (event.target === document.getElementById('reportPopupOverlay')) {
            closeReportPopup();
        }
    }

    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') closeReportPopup();
    });
</script>

<% } %>
 --%>
 
 <div class="post-card">
    <div class="post-left">
        <div class="post-header">
            <div class="avatar"></div>
            <div>
                <p class="username">Harry __Newgate__</p>
                <p class="post-date">2023-10-28</p>
            </div>
        </div>
        <p class="community-name">Community Name</p>
        <p class="post-body">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laboriosam rerum
            explicabo consequatur ex...<</p>
        <p class="post-tags">#Tag #__anothertag__</p>
        <div class="post-actions">
            <span><i class="fa-regular fa-circle-check"></i> 101</span>
            <span><i class="fa-regular fa-comment"></i> 101</span>
            <span><i class="fa-regular fa-bookmark"></i> 101</span>
            <span class="report" onclick="openReportPopup()">
                <i class="fa-solid fa-triangle-exclamation"></i>
            </span>
        </div>
    </div>
    <div class="post-image">
        <img src="../Badminton.jpeg" alt="post image">
    </div>
</div>

<!-- Guard: render the popup + script only once even if post.jsp is included many times -->
<script>
    if (!window.__reportPopupRendered__) {
        window.__reportPopupRendered__ = true;
        document.write(`
            <!-- Dark backdrop -->
            <div class="report-popup-overlay" id="reportPopupOverlay" onclick="closeOnOutsideClick(event)">

                <!-- Report popup box -->
                <div class="report-popup-box">

                    <!-- Header -->
                    <div class="report-popup-header">
                        <div class="report-header-icon">
                            <i class="fa-solid fa-circle-exclamation"></i>
                        </div>
                        <h2 class="report-popup-title">Report - User/Post</h2>
                        <button class="report-close-btn" onclick="closeReportPopup()" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>

                    <!-- Form body -->
                    <div class="report-popup-body">

                        <!-- Reason dropdown -->
                        <div class="report-select-wrapper">
                            <select class="report-select">
                                <option value="" disabled selected hidden>Choose a reason for reporting</option>
                                <option value="spam">Spam</option>
                                <option value="hate">Hate speech</option>
                                <option value="harassment">Harassment</option>
                                <option value="misinformation">Misinformation</option>
                                <option value="violence">Violence</option>
                                <option value="other">Other</option>
                            </select>
                            <i class="fa-solid fa-chevron-down report-select-arrow"></i>
                        </div>

                        <!-- Description textarea -->
                        <textarea class="report-textarea" placeholder="Please provide a description regarding the situation"></textarea>

                    </div>

                    <!-- Submit button -->
                    <button class="report-submit-btn" onclick="closeReportPopup()">Submit Report</button>

                </div>
            </div>
        `);
    }
</script>

<script>
    if (!window.__reportPopupScriptLoaded__) {
        window.__reportPopupScriptLoaded__ = true;

        function openReportPopup() {
            document.getElementById('reportPopupOverlay').classList.add('open');
        }

        function closeReportPopup() {
            document.getElementById('reportPopupOverlay').classList.remove('open');
        }

        function closeOnOutsideClick(event) {
            if (event.target === document.getElementById('reportPopupOverlay')) {
                closeReportPopup();
            }
        }

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') closeReportPopup();
        });
    }
</script> 