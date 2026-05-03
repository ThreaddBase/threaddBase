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
            <div class="topimagelogo"> <h3 style="justify-self: center; font-size: 25px; margin: 1.2rem auto;">LOGO</h3></div>
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
            <img src="<%=request.getContextPath()%>/Assets/photo.jpg" class="team-img"></img>
            <h3>Gaurab Tandukar</h3>
            <p style="color: #00ADB5;">Fullstack Developer</p>
            <article>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam, est ab? Laudantium, voluptatem exercitationem quaerat ab sequi iure quod, nesciunt et illum molestiae voluptatum dignissimos! Libero inventore ducimus minus explicabo.</article>
        </div>
        <div class="team-card">
            <div class="team-img"></div>
            <h3>Suvashish Shrestha</h3>
            <p style="color: #00ADB5;">Backend Developer</p>
            <article>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam, est ab? Laudantium, voluptatem exercitationem quaerat ab sequi iure quod, nesciunt et illum molestiae voluptatum dignissimos! Libero inventore ducimus minus explicabo.</article>
        </div>
        <div class="team-card">
            <div class="team-img"></div>
            <h3>Samundra Adhikari</h3>
            <p style="color: #00ADB5;">UI/UX Designer</p>
            <article>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam, est ab? Laudantium, voluptatem exercitationem quaerat ab sequi iure quod, nesciunt et illum molestiae voluptatum dignissimos! Libero inventore ducimus minus explicabo.</article>
        </div>
        <div class="team-card">
            <div class="team-img"></div>
            <h3>Sudhaanshu Shamsher Thapa</h3>
            <p style="color: #00ADB5;">Frontend Developer</p>
            <article>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam, est ab? Laudantium, voluptatem exercitationem quaerat ab sequi iure quod, nesciunt et illum molestiae voluptatum dignissimos! Libero inventore ducimus minus explicabo.</article>

        </div>
        <div class="team-card">
            <div class="team-img"></div>
            <h3>Sujal Pokhrel</h3>
            <p style="color: #00ADB5;">Database Architecture</p>
            <article>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam, est ab? Laudantium, voluptatem exercitationem quaerat ab sequi iure quod, nesciunt et illum molestiae voluptatum dignissimos! Libero inventore ducimus minus explicabo.</article>

        </div>
    </div>
    <input type="range" class="team-scrollbar" value="0">
</div>


<!--Final Section-->
<div class="final">
    <div class="final-left">
        <h2>Bored? Don't wanna stay here anymore?</h2>
        <button class="final-btn">Home</button>
    </div>
    <div class="final-divider"></div>
    <div class="final-right">
        <h2>Feeling like an extrovert? Wanna grab a digital coffee with us?</h2>
        <button class="final-btn">Contact Us</button>
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