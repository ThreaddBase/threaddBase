<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About US</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/aboutUS.css">
</head>
<body>
    
    <%@ include file="nav.jsp" %>

    <!--TOP Section-->
    <div class="TOP">
        <div class="toplogo">
            <img src="<%=request.getContextPath()%>/Assets/logo_white.png" class="topimagelogo"></img>
        </div>
        <div class="toptext">
            <h1>Discover a new <span style="color: #00ADB5;">base</span> for your  <span style="color: #00ADB5;">threads.</span></h1>
            <p class="p1">We provide you a base, you provide us with a thread.</p>
            <p class="p2">Join, Post & Engage, all within a community.</p>
        </div>
    </div>

    <!--data box Section-->

    <div class="stats">
        <div class="stats-card">
            <h2 style="color: #00ADB5;">5</h2>
            <p >Present Members</p>
        </div>
        <div class="stats-card">
            <h2 style="color: #00ADB5;">2026</h2>
            <p >Founded</p>
        </div>
        <div class="stats-card">
            <h2 style="color: #00ADB5;">80%</h2>
            <p >Remote</p>
        </div>
    </div>
    
    <!--Image and text Section-->
    <div class="story">
    <div class="story-image">
        <img src="<%=request.getContextPath()%>/Assets/group_photo.jpg" class="image-placeholder"></img>
    </div>
    <div class="story-text">
        <h2 style="color: #00ADB5;">Our Story</h2>
        <p><strong style="color: #00ADB5; font-size: 25px;">Threadbase</strong> was our idea over a plate of mo:mo. Initially a topic of a joke, it took a special spot in our mind. A bunch of friends grouped together to bring the idea into reality.</p>
        <p><strong style="color: #00ADB5; font-size: 25px;">Originally thought and designed in early 2026,</strong> we prepared mentally for the completion of this project.</p>
        <p><strong style="color: #00ADB5; font-size: 25px;">Finally, in mid 2026,</strong> the idea shaped into reality. The effort given by our diligent team-members was finally concluded into a remarkable website.</p>
    </div>
</div>


<!--Meet the team Section-->
<div class="team">
    <h2>Meet the Team</h2>
    <div class="team-slider">
        <div class="team-card">
            <img src="<%=request.getContextPath()%>/Assets/gaurab.jpg" class="team-img"></img>
            <h3>Gaurab Tandukar</h3>
            <p style="color: #00ADB5;">CEO</p>
            <article>Gaurab leads Threadbase with a vision to build a community where ideas flow freely. As the driving force behind the platform, he oversees the big picture from strategy to culture, making sure Threadbase stays true to its roots.</article>
        </div>
        <div class="team-card">
            <img src="<%=request.getContextPath()%>/Assets/suva.jpg" class="team-img"></img>
            <h3>Suvashish Shrestha</h3>
            <p style="color: #00ADB5;">Product Manager</p>
            <article>Suvashish bridges ideas and execution. He shapes the Threadbase experience by turning user needs into features, managing the product roadmap, and making sure every update feels just right for the community.</article>
        </div>
        <div class="team-card">
            <img src="<%=request.getContextPath()%>/Assets/samundra.jpg" class="team-img"></img>
            <h3>Samundra Adhikari</h3>
            <p style="color: #00ADB5;">Managing Director</p>
            <article>Samundra keeps the wheels turning behind the scenes. As Managing Director, he oversees day-to-day operations, coordinates across the team, and ensures Threadbase runs smoothly from the ground up.</article>
        </div>
        <div class="team-card">
            <img src="<%=request.getContextPath()%>/Assets/SudhaanshuProfile.png" class="team-img"></img>
            <h3>Sudhaanshu Shamsher Thapa</h3>
            <p style="color: #00ADB5;">Executive Assistant</p>
            <article>Sudhaanshu is the backbone of Threadbase's coordination. He supports leadership, manages schedules, and makes sure nothing slips through the cracks; quietly keeping everything on track.</article>

        </div>
        <div class="team-card">
            <img src="<%=request.getContextPath()%>/Assets/sujal.jpg" class="team-img"></img>
            <h3>Sujal Pokhrel</h3>
            <p style="color: #00ADB5;">HR</p>
            <article>Sujal handles the people side of Threadbase. He manages recruitment, team coordination, and makes sure everything runs smoothly between members.</article>

        </div>
    </div>
    <input type="range" class="team-scrollbar" value="0">
</div>


<!--Final Section-->
<div class="final">
    <div class="final-left">
        <h2>Bored? Don't wanna stay here anymore?</h2>
        <button class="final-btn"><a href="<%=request.getContextPath()%>/home">Home</a></button>
    </div>
    <div class="final-divider"></div>
    <div class="final-right">
        <h2>Feeling like an extrovert? Wanna grab a digital coffee with us?</h2>
        <button class="final-btn"><a href="<%=request.getContextPath()%>/contact">Contact Us</a></button>
    </div>
</div>

<script>
    const slider = document.querySelector('.team-slider');
    const scrollbar = document.querySelector('.team-scrollbar');

    // scrollbar → move slider
    scrollbar.addEventListener('input', () => {
        const max = slider.scrollWidth - slider.clientWidth;
        slider.scrollLeft = (scrollbar.value / 100) * max;
    });

    // slider scroll → move scrollbar
    slider.addEventListener('scroll', () => {
        const max = slider.scrollWidth - slider.clientWidth;
        scrollbar.value = (slider.scrollLeft / max) * 100;
    });

    // block ALL other scrolling
    // slider.addEventListener('wheel', (e) => e.preventDefault(), { passive: false });
    slider.addEventListener('touchstart', (e) => e.preventDefault(), { passive: false });
    slider.addEventListener('touchmove', (e) => e.preventDefault(), { passive: false });
    // slider.addEventListener('mousedown', (e) => e.preventDefault());
</script>

</body>
</html>