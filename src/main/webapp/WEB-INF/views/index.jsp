<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUHK Home</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Embedded CSS -->
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #4338ca;
            --accent-color: #8b5cf6;
            --background-color: #f8fafc;
            --card-bg: #ffffff;
            --text-color: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
        }

        html, body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        body {
            padding-top: 5rem;
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1.5rem;
        }

        .navbar-brand {
            font-weight: 700;
            letter-spacing: 1px;
            font-size: 1.5rem;
        }

        .nav-link {
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            position: relative;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: rgba(255, 255, 255, 0.9) !important;
        }

        .nav-link.active::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 30px;
            height: 3px;
            background-color: white;
            border-radius: 3px;
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                         url('https://source.unsplash.com/random/1200x800/?university');
            background-size: cover;
            background-position: center;
            color: white;
            text-align: center;
            padding: 5rem 1rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .hero-subtitle {
            font-size: 1.5rem;
            font-weight: 300;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .hero-button {
            padding: 0.8rem 2rem;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .hero-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .section-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 4px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .card {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-weight: 600;
            color: var(--primary-color);
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-footer {
            padding: 1rem 1.5rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            padding: 0.6rem 1.2rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--accent-color), var(--secondary-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .feature-card {
            background-color: var(--card-bg);
            border-radius: 1rem;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .feature-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .feature-text {
            color: var(--text-muted);
        }

        #authButton {
            position: relative;
            z-index: 1050;
            margin-left: 10px;
            padding: 0.5rem 1.5rem;
            font-size: 0.9rem;
            font-weight: 600;
            color: white !important;
            background: linear-gradient(135deg, #10b981, #059669) !important;
            border: none !important;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        #authButton:hover {
            background: linear-gradient(135deg, #059669, #047857) !important;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
        }

        #authButton.btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626) !important;
        }

        #authButton.btn-danger:hover {
            background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
        }

        footer {
            background-color: #0f172a;
            color: #e2e8f0;
            padding: 3rem 0;
            margin-top: 4rem;
        }

        .footer-title {
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 0.75rem;
        }

        .footer-links a {
            color: #94a3b8;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: white;
        }

        .footer-bottom {
            border-top: 1px solid #334155;
            padding-top: 1.5rem;
            margin-top: 2rem;
            text-align: center;
            color: #94a3b8;
        }

        @media (max-width: 767.98px) {
            .hero-title {
                font-size: 2rem;
            }
            .hero-subtitle {
                font-size: 1.2rem;
            }
            .section-title {
                font-size: 1.75rem;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">MUHK</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0" id="navMenu"></ul>
            <div class="d-flex align-items-center">
                <button id="authButton" class="btn"></button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="container py-5">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1 class="hero-title">Welcome to MUHK</h1>
            <p class="hero-subtitle">Modern University of Hong Kong - Where Innovation Meets Education</p>
            <a href="/lectures" class="btn btn-light hero-button">Explore Courses <i class="fas fa-arrow-right ms-2"></i></a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="my-5">
        <div class="container">
            <h2 class="section-title mb-4">Why Choose MUHK</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-card h-100">
                        <i class="fas fa-graduation-cap feature-icon"></i>
                        <h3 class="feature-title">Quality Education</h3>
                        <p class="feature-text">Our programs are designed to meet international standards with a focus on practical skills and critical thinking.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card h-100">
                        <i class="fas fa-flask feature-icon"></i>
                        <h3 class="feature-title">Innovative Research</h3>
                        <p class="feature-text">Join our cutting-edge research programs and contribute to solutions for global challenges.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card h-100">
                        <i class="fas fa-globe feature-icon"></i>
                        <h3 class="feature-title">Global Perspective</h3>
                        <p class="feature-text">Connect with students and faculty from around the world to broaden your horizons.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Recent Polls Section -->
    <section class="my-5">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="section-title">Recent Polls</h2>
                <a href="/polls" class="btn btn-outline-primary">View All Polls</a>
            </div>
            
            <c:if test="${recentPolls.isEmpty()}">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle me-2"></i>No polls available at the moment.
                </div>
            </c:if>
            
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <c:forEach items="${recentPolls}" var="poll" begin="0" end="3">
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">${poll.question}</h5>
                                <p class="card-text text-muted">
                                    <i class="fas fa-list-ul me-2"></i>${poll.options.size()} options • 
                                    <i class="fas fa-vote-yea me-2"></i>${poll.options.stream().map(o -> o.getVoteCount()).sum()} votes
                                </p>
                            </div>
                            <div class="card-footer bg-transparent border-top-0">
                                <a href="/polls/${poll.id}" class="btn btn-outline-primary">
                                    View Poll <i class="fas fa-arrow-right ms-2"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <h4 class="footer-title">About MUHK</h4>
                <p>Modern University of Hong Kong is dedicated to providing quality education and innovative research opportunities to students from around the world.</p>
            </div>
            <div class="col-lg-2 col-md-4 mb-4">
                <h4 class="footer-title">Links</h4>
                <ul class="footer-links">
                    <li><a href="/">Home</a></li>
                    <li><a href="/course">Courses</a></li>
                    <li><a href="/polls">Polls</a></li>
                    <li><a href="/contact">Contact</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-4 mb-4">
                <h4 class="footer-title">Resources</h4>
                <ul class="footer-links">
                    <li><a href="#">Library</a></li>
                    <li><a href="#">Research</a></li>
                    <li><a href="#">Academic Calendar</a></li>
                    <li><a href="#">Student Portal</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-4 mb-4">
                <h4 class="footer-title">Contact Us</h4>
                <ul class="footer-links">
                    <li><i class="fas fa-map-marker-alt me-2"></i> 123 Education Road, Hong Kong</li>
                    <li><i class="fas fa-phone me-2"></i> (852) 1234-5678</li>
                    <li><i class="fas fa-envelope me-2"></i> info@muhk.edu</li>
                </ul>
                <div class="mt-3">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p class="mb-0">© 2025 Modern University of Hong Kong. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Embedded JavaScript -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const userId = '<%= session.getAttribute("userId") %>';
        const user = localStorage.getItem("user") || (userId && userId !== 'null');
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");

        if (user) {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link active" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/lectures"><i class="fas fa-book me-1"></i> Course Materials</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls"><i class="fas fa-poll me-1"></i> Polls</a></li>
                <li class="nav-item"><a class="nav-link" href="/personal-info"><i class="fas fa-user me-1"></i> Personal Info</a></li>
                <li class="nav-item"><a class="nav-link" href="/comments"><i class="fas fa-comments me-1"></i> Comments</a></li>
            `;
            authButton.textContent = "Logout";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout";
            });
        } else {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link active" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
            `;
            authButton.textContent = "Login";
            authButton.classList.add("btn-success");
            authButton.addEventListener("click", function () {
                window.location.href = "/login";
            });
        }

        if (userId && userId !== 'null' && !localStorage.getItem("user")) {
            localStorage.setItem("user", "true");
        }
    });
</script>
</body>
</html>