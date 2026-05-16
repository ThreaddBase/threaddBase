<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Terms and Conditions</title>
</head>
<style>
    *, *::before, *::after {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    :root {
	 /* Base Theme */
	  --color-primary: #222831;
	  --color-secondary: #393E46;
	  --color-highlight: #00ADB5;
	  --color-font: #EEEEEE;
	
	  /* Accent Colors */
	  --color-rose: #FF6B8A;
	  --color-amber-gold: #F0A500;
	  --color-mint: #00C9A7;
	  --color-lavender: #A78BFA;
	  --color-peach: #FF8C69;
	  --color-slate: #AAB4BE;
	
	  /* Semantic Aliases */
	  --color-success: #00C9A7;
	  --color-warning: #F0A500;
	  --color-error: #FF6B8A;
	  --color-info: #00ADB5;
	
	  /* Gradient Presets */
	  --gradient-aqua: linear-gradient(90deg, #00ADB5, #00C9A7);
	  --gradient-dreamy: linear-gradient(90deg, #00ADB5, #A78BFA);
	  --gradient-energetic: linear-gradient(90deg, #00ADB5, #F0A500);
	  --gradient-warm-cool: linear-gradient(90deg, #FF6B8A, #A78BFA);
	
	  --img-bg: #333;
	  --radius-lg: 16px;
    }

    html, body {
      min-height: 100vh;
      background: #333;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: 'Outfit', sans-serif;
      padding: 0px auto;
    }

    /* ── Outer card ── */
    .page-wrapper {
      width: min(760px, 94vw);
      background: #000;
      border-radius: 14px;
      overflow: hidden;
      box-shadow: 0 10px 48px rgba(0,0,0,0.28);
    }

    /* ── Top dark nav bar ── */
    .top-bar {
      background: var(--color-primary);
      padding: 16px 24px 22px;
    }

    /* Logo image pill */
    .logo-pill {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      background: transparent;
      border-radius: 999px;
      padding: 6px 18px 6px 10px;
      gap: 9px;
    }
    
    .logo-pill img {
      width: 132px;
      height: 50px;
      object-fit: cover;
      display: block;
      background-size: contain;
      background-position: center;
    }

    .page-title {
      text-align: center;
      padding: 12px 0 18px;
      font-size: 1.5rem;
      font-weight: 700;
      letter-spacing: 0.01em;
      background: var(--gradient-aqua);
	  -webkit-background-clip: text;
	  -webkit-text-fill-color: transparent;
	  background-clip: text;
	}

    /* ── Grey card body ── */
    .card {
      background: var(--color-secondary);
      padding: 26px 30px 26px; /* equal sides */
    }
    
    .card p {
	   color: #eee;    
    }

    /* ── Inner rounded box ── */
    .inner-box {
      background: var(--color-secondary);
      border-radius: 10px;
      overflow: hidden;
      display: flex;
      flex-direction: column;
    }

    /* ── Scrollable text only ── */
    .terms-and-conditions {
      height: 400px;
      overflow-y: auto;
      padding: 22px 10px 10px 10px;
      font-size: 0.86rem;
      line-height: 1.75;
      font-weight: 400;
      scrollbar-width: thick;
      scrollbar-color: #bbb transparent;
    }

    .terms-and-conditions::-webkit-scrollbar {
    	 width: 8px; 
    }
    .terms-and-conditions::-webkit-scrollbar-track { 
    	background: transparent; 
    }
    .terms-and-conditions::-webkit-scrollbar-thumb { 
    	background: #00ADB5;
    	 border-radius: 999px; 
    }
    .terms-and-conditions::-webkit-scrollbar-thumb:hover { 
    	background: #00C9A7; 
    }

    /* T&C typography inside scroll */
    .terms-and-conditions h2 {
      font-size: 0.78rem;
      font-weight: 750;
      text-transform: uppercase;
      letter-spacing: 0.09em;
      margin: 20px 0 6px;
      color: #00ADB5;
    }

    .terms-and-conditions h2:first-child { 
    	margin-top: 0; 
    }

    .terms-and-conditions p, li {
    	margin-bottom: 10px; 
    	color: #eee;
    }
    
    .terms-and-conditions ul { 
    	padding-left: 18px; margin-bottom: 10px;
   	}
    

    /* ── Sticky divider + button ── */
    .divider {
      height: 1px;
      background: rgba(238, 238, 238, 0.3);
      margin: 0 18px;
      flex-shrink: 0;
    }

    .btn-area {
      padding: 18px 22px 22px;
      display: flex;
      justify-content: center;
      flex-shrink: 0;
    }
    
    .btn-area a {
    	text-decoration: none;
    	color: #eee;
    }

    .cta-btn {
      background: var(--color-highlight);
      color: var(--color-secondary);
      border: none;
      border-radius: 8px;
      padding: 15px 0;
      width: 100%;
      max-width: 420px;
      font-family: 'Outfit', sans-serif;
      font-size: 1rem;
      font-weight: 600;
      letter-spacing: 0.015em;
      cursor: pointer;
      transition: background 0.18s ease, transform 0.12s ease;
    }

    .cta-btn:hover  { 
    	background: var(--gradient-aqua); 
    	color: #eee;
    	transform: translateY(-1px); 
    }
    .cta-btn:active { 
    	transform: translateY(0); 
    }
  </style>
<body>

<body>

  <div class="page-wrapper">

    <!-- Top dark nav bar -->
    <div class="top-bar">
      <div class="logo-pill">
        <img
          src="<%=request.getContextPath()%>/Assets/logo_white.png"
          alt="Threadbase logo"
        />
      </div>
      <h1 class="page-title">Terms and Conditions</h1>
    </div>

    <!-- Grey card body -->
    <div class="card">
      <div class="inner-box">

        <!-- ↓ Only this div scrolls ↓ -->
        <div class="terms-and-conditions">

          <p style="color: #00ADB5; font-weight: 700; font-size: .90rem"><strong>Effective Date: May 15, 2026 &nbsp;·&nbsp; Last Updated: May 15, 2026</strong></p>
          <p>Welcome to <strong style = "color: #00ADB5;">Threadbase</strong> ("we," "us," or "our"). By accessing or using our platform; including browsing communities, posting, commenting, liking, bookmarking, or any other feature; you agree to be bound by these Terms and Conditions ("Terms"). If you do not agree, you may not use Threadbase.</p>

          <h2>1. Age Requirement</h2>
          <p>You must be at least <strong style = "color: #00ADB5;">13 years of age</strong> to register for an account or use Threadbase in any capacity; including browsing public communities, viewing posts, or any other interaction with the platform. By creating an account, you represent and warrant that you are 13 or older.</p>
          <p>If we discover that a user is under 13 years of age, we will immediately suspend their account, delete all associated content, and remove any personal data in our possession. If you believe a child under 13 has created an account, please contact us at <strong style = "color: #00ADB5;">support@Threadbase.app</strong> so we can act promptly.</p>

          <h2>2. Account Registration</h2>
          <p>To access most features, you must register for a Threadbase account. By registering, you agree to:</p>
          <ul>
            <li>Provide truthful, current, and complete information during sign-up.</li>
            <li>Keep your login credentials secure and not share your password with anyone.</li>
            <li>Notify us immediately at <strong style = "color: #00ADB5;">support@Threadbase.app</strong> if you suspect unauthorized access to your account.</li>
            <li>Accept full responsibility for all activities carried out under your account.</li>
          </ul>
          <p>Threadbase reserves the right to refuse registration, suspend, or permanently terminate any account at our sole discretion, with or without cause.</p>

          <h2>3. Communities</h2>
          <p>Threadbase is organized around communities; dedicated spaces where users share content around a common interest or topic. With respect to communities:</p>
          <ul>
            <li>Any registered user may request the creation of a new community. Requests are subject to review and approval by Threadbase administrators.</li>
            <li>Approved community creators become moderators and are responsible for setting and enforcing community-specific rules, provided those rules do not conflict with these Terms.</li>
            <li>Joining a community means agreeing to both these Terms and the community's own rules.</li>
            <li>Threadbase may remove, merge, archive, or shut down any community at any time for any reason, including but not limited to inactivity, policy violations, or platform restructuring.</li>
          </ul>

          <h2>4. Posting & User Content</h2>
          <p>Registered members of a community may create posts ("User Content"). By submitting User Content, you:</p>
          <ul>
            <li>Grant Threadbase a non-exclusive, royalty-free, perpetual, worldwide license to host, display, distribute, and promote your content in connection with operating the platform.</li>
            <li>Confirm that you own the content or have all rights necessary to share it.</li>
            <li>Accept sole responsibility for the accuracy, legality, and appropriateness of everything you post.</li>
          </ul>
          <p>You must not post content that is illegal, defamatory, harassing, threatening, hateful, sexually explicit, spam, misleading, or that infringes on the intellectual property or privacy of any third party.</p>

          <h2>5. Comments</h2>
          <p>Users may reply to posts via comments. All comments are subject to the same content standards as posts (see Section 4). You may not use comments to harass, threaten, impersonate, or demean other users. Threadbase and community moderators may remove comments at any time and without notice if they violate these Terms or community rules.</p>

          <h2>6. Likes & Bookmarks</h2>
          <p>You may like posts to express appreciation, and bookmark posts to save them for later reference. Likes are visible to other users and do not constitute endorsement by Threadbase. Bookmarks are private to your account. We reserve the right to modify or remove these features at any time.</p>

          <h2>7. Prohibited Conduct</h2>
          <p>In addition to the content restrictions above, you agree not to:</p>
          <ul>
            <li>Harass, bully, stalk, threaten, or intimidate any person.</li>
            <li>Impersonate any individual, organization, or Threadbase staff member.</li>
            <li>Create multiple accounts to evade bans, suspensions, or content removals.</li>
            <li>Use bots, scrapers, automated scripts, or other non-human means to interact with the platform without prior written permission from Threadbase.</li>
            <li>Attempt to hack, disrupt, overload, or otherwise compromise the security or integrity of the platform.</li>
            <li>Engage in coordinated manipulation, vote fraud, or spam campaigns.</li>
            <li>Share another person's private or personally identifying information without their explicit consent ("doxxing").</li>
          </ul>
          <p>Violations may result in content removal, account suspension, permanent termination, and/or referral to law enforcement where applicable.</p>

          <h2>8. Moderation & Enforcement</h2>
          <p>Threadbase employs a combination of automated tools and human moderators. We reserve the right; but not the obligation; to monitor, review, remove, or restrict any content or account at our discretion. Community moderators have authority within their own spaces but may not act in ways that violate these Terms. Moderator decisions may be appealed through our official platform appeals process.</p>

          <h2>9. Intellectual Property</h2>
          <p>All platform branding, design, logos, software, and original content created by Threadbase are protected under applicable intellectual property laws. You may not copy, reproduce, modify, distribute, or create derivative works from any part of the platform without express written consent. User Content remains the intellectual property of its creator, subject to the license in Section 4.</p>

          <h2>10. Privacy</h2>
          <p>Your use of Threadbase is governed by our <strong style = "color: #00ADB5;">Privacy Policy</strong>, incorporated into these Terms by reference. By using the platform, you consent to the collection, storage, and use of your data as described therein. We do not sell your personal information to third parties.</p>

          <h2>11. Disclaimers</h2>
          <p>Threadbase is provided on an "as is" and "as available" basis without warranties of any kind, express or implied. We do not guarantee continuous, uninterrupted, or error-free operation of the platform. We are not responsible for User Content posted by other users and make no representations about its accuracy or legality.</p>

          <h2>12. Limitation of Liability</h2>
          <p>To the fullest extent permitted by applicable law, Threadbase and its operators, employees, and affiliates shall not be liable for any indirect, incidental, special, consequential, or punitive damages; including loss of data, reputation, or profits; arising out of your use of or inability to use the platform, even if we have been advised of the possibility of such damages.</p>

          <h2>13. Changes to These Terms</h2>
          <p>We may revise these Terms periodically. When we make material changes, we will notify you via an in-platform notice, an email to your registered address, or both. Your continued use of Threadbase after the effective date of any revision constitutes your acceptance of the updated Terms.</p>

          <h2>14. Termination</h2>
          <p>You may close your account at any time through your account settings. Threadbase reserves the right to suspend or permanently ban any account found to be in violation of these Terms, with or without notice. Upon termination, your license to use the platform ends immediately. Certain User Content may be retained in accordance with our data retention policy and applicable law.</p>

          <h2>15. Governing Law</h2>
          <p>These Terms shall be governed by and construed in accordance with applicable law. Any disputes arising from these Terms or your use of Threadbase shall be resolved through binding arbitration or in the competent courts of the applicable jurisdiction, as determined by Threadbase.</p>

          <h2>16. Contact Us</h2>
          <p>For questions, concerns, or reports related to these Terms, please contact us at <strong style = "color: #00ADB5;">legal@Threadbase.app</strong> or through the Help Center accessible within the platform.</p>

        </div>

        <!-- Fixed divider -->
        <div class="divider"></div>

        <!-- Fixed button -->
        <div class="btn-area">
          <button class="cta-btn"><a href="<%=request.getContextPath()%>/home">I understand it, take me to home!</a></button>
        </div>

      </div>
    </div>

  </div>

</body>
</html>

</body>
</html>