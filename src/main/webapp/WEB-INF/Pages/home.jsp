<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ThreaddBase</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/home.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/login.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/registration.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap"/>
<style>
	.fa-xmark {
		display: block;
	}
</style>
</head>
<body>
	<div id="overlay">
  <!-- navigation starts -->
  <%@ include file="nav.jsp" %>

  <!-- top hero section starts -->
  <section class="hero">

    <div class="hero-left">
      <h1>The best community for
        <span>your discussions.</span>
      </h1>

      <div class="buttons-container">
        <button class="btn-login" onclick="loginPopup()">Log In</button>
        <button class="btn-signup" onclick="scrollToRegister()">Sign Up</button>
      </div>
    </div>

    <div class="hero-right">
      <div class="community-box">
        <div class="search-community"><i class="fa-solid fa-magnifying-glass"></i>Search community</div>
        <div class="community-container">
          <div class="community-1">
            <i class="fa-brands fa-steam"></i>
            <span>/videoGames</span>
          </div>
          <div class="community-1">
            <i class="fa-solid fa-music"></i>
            <span>/songs</span>
          </div>
          <div class="community-1">
            <i class="fa-solid fa-play"></i>
            <span>/anime</span>
          </div>
          <div class="community-1">
            <i class="fa-solid fa-code"></i>
            <span>/cooding</span>
          </div>
        </div>
      </div>
      <div class="about-box">
        <div class="context">
          <span>Context</span>
          <i class="fa-solid fa-angle-down"></i>
        </div>
        <ul>
          <li>User-generated content</li>
          <li>Voting system</li>
          <li>Threaded comments</li>
          <li>Community-based feeds</li>
          <li>Post & share</li>
        </ul>
      </div>
    </div>
  </section>
  <!-- Top hero section ends -->

  <!-- work section start -->
   <section class="works-section">

    <p class="section-label">Process</p>
    <h2 class="works-title">How Threadbase works</h2>

    <div class="cards-row">

      <!-- First Card -->
      <div class="col">
        <div class="card">
          <div class="card-body">
            <div class="card-top-row">
              <span class="card-number">01</span>
              <iconify-icon icon="lucide:users" width="28" height="28" class="card-icon"></iconify-icon>
            </div>
            <h5 class="card-title">Join a community</h5>
            <p class="card-text">Browse hundreds of communities built around topics you care about — tech, science, culture, and more. Find your people and join the ones that speak to you.</p>
          </div>
        </div>
      </div>

      <!-- Second Card -->
      <div class="col">
        <div class="card">
          <div class="card-body">
            <div class="card-top-row">
              <span class="card-number">02</span>
              <iconify-icon icon="lucide:pencil-line" width="28" height="28" class="card-icon"></iconify-icon>
            </div>
            <h5 class="card-title">Start a thread</h5>
            <p class="card-text">Got something to say? Post a question, share an opinion, or spark a debate. Every great discussion starts with a single post — yours could be next.</p>
          </div>
        </div>
      </div>

      <!-- Third Card -->
      <div class="col">
        <div class="card">
          <div class="card-body">
            <div class="card-top-row">
              <span class="card-number">03</span>
              <iconify-icon icon="lucide:message-square-more" width="28" height="28" class="card-icon"></iconify-icon>
            </div>
            <h5 class="card-title">Dive into discussion</h5>
            <p class="card-text">Reply to posts, reply to replies, and keep the conversation going as deep as it needs to go. Fully nested threads mean no thought ever gets lost in the noise.</p>
          </div>
        </div>
      </div>

      <!-- Fourth Card -->
      <div class="col">
        <div class="card">
          <div class="card-body">
            <div class="card-top-row">
              <span class="card-number">04</span>
              <iconify-icon icon="lucide:thumbs-up" width="28" height="28" class="card-icon"></iconify-icon>
            </div>
            <h5 class="card-title">Vote what matters</h5>
            <p class="card-text">Upvote the posts and replies that add value. Downvote what doesn't. The community decides what rises to the top — no algorithm, no ads, no agenda.</p>
          </div>
        </div>
      </div>

      <!-- Fifth Card -->
      <div class="col">
        <div class="card">
          <div class="card-body">
            <div class="card-top-row">
              <span class="card-number">05</span>
              <iconify-icon icon="lucide:bookmark" width="28" height="28" class="card-icon"></iconify-icon>
            </div>
            <h5 class="card-title">Save for later</h5>
            <p class="card-text">Bookmark any thread you want to come back to. Your saved posts live in your profile, always one click away — no more losing that great discussion.</p>
          </div>
        </div>
      </div>

      <!-- Sixth Card -->
      <div class="col">
        <div class="card">
          <div class="card-body">
            <div class="card-top-row">
              <span class="card-number">06</span>
              <iconify-icon icon="lucide:shield-check" width="28" height="28" class="card-icon"></iconify-icon>
            </div>
            <h5 class="card-title">Stay in control</h5>
            <p class="card-text">Edit your posts, manage your profile, and report content that breaks the rules. Threadbase is actively moderated to keep discussions healthy and on-topic.</p>
          </div>
        </div>
      </div>

    </div>

  </section>
<!-- work section ends -->

 <!-- featured section -->
  <section class="featured-section">
 
    <p class="section-label">From the community</p>
    <h2 class="works-title">Threads that sparked a conversation</h2>
 
    <div class="featured-row">
 
      <!-- Post card 1 -->
      <div class="post-col">
        <div class="post-card">
          <div class="post-img-wrap">
            <img src="https://images.unsplash.com/photo-1607706189992-eae578626c86?w=600&q=80" alt="AI tech" class="post-img"/>
            <div class="post-community-badge">
              <iconify-icon icon="lucide:cpu" width="12" height="12"></iconify-icon>
              Technology
            </div>
          </div>
          <div class="post-meta">
            <div class="post-avatar-wrap">
              <img src="https://api.dicebear.com/7.x/thumbs/svg?seed=gaurab" alt="gaurab_dev" class="post-avatar"/>
            </div>
            <h4 class="post-author">gaurab_</h4>
            <p class="post-desc">Started a thread on whether AI will replace junior developers — 142 replies and counting. The debate is very much alive.</p>
          </div>
        </div>
      </div>
 
      <!-- Post card 2 -->
      <div class="post-col">
        <div class="post-card">
          <div class="post-img-wrap">
            <img src="https://images.unsplash.com/photo-1556075798-4825dfaaf498?w=600&q=80" alt="Open source" class="post-img"/>
            <div class="post-community-badge">
              <iconify-icon icon="lucide:code-2" width="12" height="12"></iconify-icon>
              Open Source
            </div>
          </div>
          <div class="post-meta">
            <div class="post-avatar-wrap">
              <img src="https://api.dicebear.com/7.x/thumbs/svg?seed=samundra" alt="samundra_s" class="post-avatar"/>
            </div>
            <h4 class="post-author">samundra_</h4>
            <p class="post-desc">Asked the community which open source projects are worth contributing to as a beginner — got 80+ genuine recommendations.</p>
          </div>
        </div>
      </div>
 
      <!-- Post card 3 -->
      <div class="post-col">
        <div class="post-card">
          <div class="post-img-wrap">
            <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=600&q=80" alt="Student life" class="post-img"/>
            <div class="post-community-badge">
              <iconify-icon icon="lucide:graduation-cap" width="12" height="12"></iconify-icon>
              Student Life
            </div>
          </div>
          <div class="post-meta">
            <div class="post-avatar-wrap">
              <img src="https://api.dicebear.com/7.x/thumbs/svg?seed=suvashish" alt="suvashish_x" class="post-avatar"/>
            </div>
            <h4 class="post-author">suvashish_</h4>
            <p class="post-desc">Posted about balancing coursework deadlines and side projects — the thread turned into a full productivity guide from the community.</p>
          </div>
        </div>
      </div>
 
      <!-- Post card 4 -->
      <div class="post-col">
        <div class="post-card">
          <div class="post-img-wrap">
            <img src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=600&q=80" alt="General debate" class="post-img"/>
            <div class="post-community-badge">
              <iconify-icon icon="lucide:flame" width="12" height="12"></iconify-icon>
              General
            </div>
          </div>
          <div class="post-meta">
            <div class="post-avatar-wrap">
              <img src="https://api.dicebear.com/7.x/thumbs/svg?seed=sujal" alt="sujal_p" class="post-avatar"/>
            </div>
            <h4 class="post-author">Sudhanshu_</h4>
            <p class="post-desc">Dropped a hot take on remote work vs office culture — 200+ upvotes and the most civil back-and-forth seen on the platform.</p>
          </div>
        </div>
      </div>
 
    </div>
 
  </section>
<!-- featured section end -->
  <!-- Registration section starts -->
  <%@ include file="registration.jsp" %>

  <!-- CTA section -->
  <div class="CTA-section">
    <div class="CTA-image"></div>
    <div class="CTA-text">
      <p>Where every voice finds its thread.
        Join the discussion,<span>
          Start a Thread.
        </span>

      </p>
      <button>Share Your Thoughts -></button>
    </div>
  </div>
  <!-- CTA section ends -->

	</div>
  <!-- Login popup -->

   <%@ include file="loginModel.jsp" %>
   
   <!-- Toast popup -->
    <div class="toast">
    <span class="toast-dot"></span>
    Community
  </div>   
   
	<script type="text/javascript">
		function scrollToRegister() {
		    document.querySelector('.register-container').scrollIntoView({ behavior: 'smooth' });
		}
		
	    const toast = document.querySelector('.toast');
	    const communityBox = document.querySelector('.community-box');
	    const aboutBox = document.querySelector('.about-box');

	    document.addEventListener('mousemove', (e) => {
	      setTimeout(() => {
	        toast.style.left = e.clientX + 16 + 'px';
	        toast.style.top = e.clientY + 16 + 'px';
	      }, 200);

	    });

	    communityBox.addEventListener('mousemove', () => {
	      toast.textContent = 'Search Community';
	      toast.classList.add('visible');
	      aboutBox.style.opacity = '0.5';
	    });

	    communityBox.addEventListener('mouseout', () => {
	      toast.classList.remove('visible');
	      aboutBox.style.opacity = '1';
	    });

	    aboutBox.addEventListener('mousemove', () => {
	      toast.textContent = 'Know Threadbase';
	      toast.classList.add('visible');
	      communityBox.style.opacity = '0.5';
	    });

	    aboutBox.addEventListener('mouseout', () => {
	      toast.classList.remove('visible');
	      communityBox.style.opacity = '1';
	    });

	</script>
  <script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
</body>
</html>