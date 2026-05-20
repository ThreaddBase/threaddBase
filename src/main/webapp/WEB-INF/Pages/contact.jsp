<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/util.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/contact.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%@ include file="nav.jsp" %>
	<div class="partition">
        <div class="section1">
            <p class="section-text">We’d love to heard it from you. Our Staffs are always available for assistance.</p>
            <div class="contact">
                <div class="contact-section">
                    <div class="title">
                        <i class="fa-solid fa-envelope"></i>
                        <span>Chat to us</span>
                    </div>
                    <div class="desc">A friendly team is here to assist</div>
                    <div class="text">
                        <div class="text"> 
                            <u>
                                contactus@gmail.com
                            </u>
                        </div>
                    </div>
                </div>
                <div class="contact-section">
                    <div class="title">
                        <i class="fa-solid fa-location-dot"></i>
                        <span>Office</span>
                    </div>
                    <div class="desc">Give us a Visit</div>
                    <div class="text"> 
                        <u>
                            Kamalpokhari, Kathmandu, Nepal
                        </u>
                    </div>
                </div>
                <div class="contact-section">
                    <div class="title">
                        <i class="fa-solid fa-phone-volume"></i>
                        <span>Phone</span>
                    </div>
                    <div class="desc">Sun-Fri from 8am to 7pm</div>
                    <div class="text">+977 9861411701</div>
                </div>
            </div>
            <div class="network">
                <p>Networks</p>
                <div class="line"></div>
                <!-- <div class="socials">
                    <a href="#">
                        <i class="fa-brands fa-facebook"></i>
                    </a>
                    <a href="#">
                        <i class="fa-brands fa-instagram"></i>
                    </a>
                    <a href="#">                     
                        <i class="fa-brands fa-whatsapp"></i>
                    </a>
                    <a href="#">                    
                        <i class="fa-brands fa-linkedin"></i>
                    </a>
                    <a href="#">
                        <i class="fa-brands fa-x-twitter"></i>
                    </a>
                </div> -->

                <ul class="socials">
                    <li>
                        <a href="#">
                            <i class="fa-brands fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa-brands fa-instagram"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa-brands fa-whatsapp"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa-brands fa-linkedin"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa-brands fa-x-twitter"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="section2">
            <div class="contact-container">
                <div class="contact-heading">
                    <p>
                        <i class="fa-solid fa-message"></i>
                        <span>Get in Touch</span>
                    </p>
                    <p>
                        Reach us anytime with anything that’s bothering you!
                    </p>
                </div>
                <form action="<%=request.getContextPath()%>/contact" method="post" class="contact-form">
                    <div class="name">
                        <input 
                            type="text" 
                            name="First_name" 
                            id="fname" 
                            placeholder="First Name"
                        >

                        <input 
                            type="text" 
                            name="Last_name" 
                            id="lname" 
                            placeholder="Last Name"
                        >
                    </div>
                    <div class="email-wrapper">
                        <i class="fa-regular fa-envelope"></i>
                        <input 
                            type="email" 
                            name="email" 
                            id="email"
                            placeholder="Email address"
                        >
                    </div>
                    <div class="phone-wrapper">
                        <span>+977</span>
                        <input 
                            type="text" 
                            name="Phone_number" 
                            id="phone"
                            placeholder=" Phone Number"
                        >
                    </div>

                    <textarea
                        rows="7"
                        cols="50"
                        placeholder="How can we help you?"
                        name="descreption"
                    ></textarea>
                    <button>Submit</button>
                </form>
                <div class="policy">
                    By contacting us, you agree to our 
                    <span>Terms of service</span> and 
                    <span>Privacy Policy</span>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${not empty message}">
	    <div class="toast error-toast">
	        ${message}
	    </div>
	</c:if>
	
	<c:if test="${not empty success}">
	    <div class="toast success-toast">
	        ${success}
	    </div>
	</c:if>
</body>
</html>