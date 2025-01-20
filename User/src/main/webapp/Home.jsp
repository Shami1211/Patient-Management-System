<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ABC Hospital</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Full-screen slideshow background */
        .slideshow-container {
            position: relative;
            width: 100%;
            height: 400px;
            z-index: -1; /* Keeps slideshow behind content */
        }

        .slide {
            display: none;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Fade animation */
        .fade {
            animation: fadeEffect 5s infinite;
        }

        @keyframes fadeEffect {
            0% { opacity: 0; }
            20% { opacity: 1; }
            60% { opacity: 1; }
            80% { opacity: 0; }
            100% { opacity: 0; }
        }

        header {
            background-color: #6A80B9; /* Transparent green header */
            color: white;
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
        }

        header h1 {
            margin: 0;
            font-size: 1.8rem;
        }

        header p {
            margin: 0;
            font-size: 1.2rem;
        }

        /* Navigation buttons */
        .nav-buttons {
            display: flex;
            gap: 15px;
        }

        .nav-buttons a {
            text-decoration: none;
            color: white;
            background-color: #C4D9FF;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .nav-buttons a:hover {
            background-color: #45a049;
        }

        footer {
            background-color: #6A80B9; /* Transparent green footer */
            color: white;
            text-align: center;
            padding: 10px;
            
            width: 100%;
            bottom: 0;
        }

        /* About Us section */
        .about-us {
            padding: 50px;
            text-align: center;
            background-color: #f4f4f4;
        }

        .about-us h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .about-us p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
        }

        /* Services section */
        .services {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 50px;
        }

        .service-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 250px;
            margin: 10px;
            text-align: center;
        }

        .service-card h3 {
            margin-bottom: 15px;
        }

        .service-card p {
            font-size: 1rem;
            color: #777;
        }

        /* Button */
        .service-card button {
            background-color: #C4D9FF;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        .service-card button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div>
            <h1>Welcome to Our ABC Private Hospital</h1>
            <p>Your health and well-being are our top priority.</p>
        </div>

        <!-- Navigation Buttons -->
        <div class="nav-buttons">
            <a href="http://localhost:8090/User/Register.jsp">Create Account</a>
            <a href="http://localhost:8090/User/Login.jsp">Login</a>
        </div>
    </header>

    <!-- Slideshow Section -->
    <div class="slideshow-container">
        <img src="CSS/images/image1.jpg" class="slide fade" alt="Hospital Image 1">
        <img src="CSS/images/image2.jpg" class="slide fade" alt="Hospital Image 2">
        <img src="CSS/images/image3.avif" class="slide fade" alt="Hospital Image 3">
    </div>

    <!-- About Us Section -->
    <div class="about-us">
        <h2>About Us</h2>
        <p>We are a leading private hospital dedicated to providing high-quality medical care and personalized attention. Our team of experienced healthcare professionals is here to ensure your well-being every step of the way.</p>
    </div>

    <!-- Services Section -->
    <div class="services">
        <div class="service-card">
            <h3>General Consultation</h3>
            <p>Our general consultation services provide you with expert advice and diagnosis for your health concerns.</p>
            <button onclick="window.location.href='ServicesDetail.jsp'">Learn More</button>
        </div>
        <div class="service-card">
            <h3>Emergency Care</h3>
            <p>We provide immediate care for critical health situations, ensuring your safety and well-being.</p>
            <button onclick="window.location.href='ServicesDetail.jsp'">Learn More</button>
        </div>
        <div class="service-card">
            <h3>Specialized Treatments</h3>
            <p>Our hospital offers a wide range of specialized treatments tailored to your needs.</p>
            <button onclick="window.location.href='ServicesDetail.jsp'">Learn More</button>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 ABC Private Hospital. All rights reserved.</p>
    </footer>

    <script>
        // JavaScript for slideshow
        let slideIndex = 0;
        function showSlides() {
            let slides = document.getElementsByClassName("slide");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}    
            slides[slideIndex-1].style.display = "block";  
            setTimeout(showSlides, 5000); // Change image every 5 seconds
        }

        showSlides();
    </script>

</body>
</html>
