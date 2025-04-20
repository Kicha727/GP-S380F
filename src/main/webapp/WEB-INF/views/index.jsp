<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <!-- Embedded CSS (from navbar-fixed.css) -->
    <style>
        body {
            min-height: 75rem;
            padding-top: 4.5rem;
        }
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            user-select: none;
        }
        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, 0.1);
            border: solid rgba(0, 0, 0, 0.15);
            border-width: 1px 0;
            box-shadow: inset 0 0.5em 1.5em rgba(0, 0, 0, 0.1),
            inset 0 0.125em 0.5em rgba(0, 0, 0, 0.15);
        }
        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }
        .bi {
            vertical-align: -0.125em;
            fill: currentColor;
        }
        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }
        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;
            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }
        .bd-mode-toggle {
            z-index: 1500;
        }
        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }
        #authButton {
            position: relative;
            z-index: 1050;
            margin-left: 10px;
            padding: 6px 12px;
            font-size: 16px;
            color: white !important;
            background-color: #198754 !important;
            border-color: #198754 !important;
        }
        #authButton:hover {
            background-color: #157347 !important;
            border-color: #146c43 !important;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MUHK</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarCollapse">
            <ul class="navbar-nav" id="navMenu"></ul>
            <div class="d-flex align-items-center">
                <div class="dropdown me-2">
                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-globe"></i> Language
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                        <li><a class="dropdown-item active" href="/">English</a></li>
                        <li><a class="dropdown-item" href="/index_zh">中文</a></li>
                    </ul>
                </div>
                <button id="authButton" class="btn btn-outline-success"></button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="container">
    <div class="bg-body-tertiary p-5 rounded">
        <h1>Welecome to HKMU</h1>
        <p class="lead">The Metropolitan University of Hong Kong was established by the government in 1989 to provide distance education and full-time courses in 2001. After years of hard work, Metropolitan University's open and flexible education courses have taken a leading position in the Asia-Pacific region. At the same time, the full-time courses we provide to qualified secondary school graduates are comparable to other large universities in Hong Kong. Today, Metropolitan University is a young, vibrant and well-rounded university of high quality.</p>
        <a class="btn btn-lg btn-primary" href="https://www.hkmu.edu.hk/tc/" role="button">More About MUHK &raquo;</a>
    </div>
</main>
<main class="container "style="padding-top: 10px">
    <c:choose>
        <c:when test="${user != null}">
            <!-- Content for logged-in users -->
            <div class="row">
                <div class="col-md-12">
                    <div class="bg-body-tertiary p-4 rounded mb-4">
                        <h1>Welcome Back, ${user.name}!</h1>
                        <p class="lead">
                            <strong>Your Course:</strong> ${user.course} | 
                            <strong>Academic Year:</strong> ${user.academicYear}
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- Course Materials Section -->
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h2 class="h4 mb-0">Your Course Materials</h2>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${lectures != null && !lectures.isEmpty()}">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Lecture Title</th>
                                                    <th>Date Added</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${lectures}" var="lecture">
                                                    <tr>
                                                        <td>${lecture.title}</td>
                                                        <td>${sessionScope['lecture_'.concat(lecture.id).concat('_date')]}</td>
                                                        <td>
                                                            <a href="/download/${lecture.id}" class="btn btn-sm btn-primary">Download</a>
                                                            <a href="/lectures/${lecture.id}" class="btn btn-sm btn-secondary">View Details</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="/lectures" class="btn btn-outline-primary mt-3">View All Lectures</a>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-info">
                                        No lecture materials available for your course yet.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Content for non-logged in users -->
            <div class="bg-body-tertiary p-5 rounded">
                <h1>Welcome to HKMU Learning Portal</h1>
                <p class="lead">Please log in to view your course materials and participate in polls.</p>
                <a class="btn btn-lg btn-primary" href="/login" role="button">Login</a>
                <a class="btn btn-lg btn-secondary" href="/register" role="button">Register</a>
            </div>
        </c:otherwise>
    </c:choose>
    
    <!-- Recent Polls Section -->
    <div class="my-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Recent Polls</h2>
            <a href="/polls" class="btn btn-outline-primary">View All</a>
        </div>
        
        <c:if test="${recentPolls.isEmpty()}">
            <div class="alert alert-info">
                No polls available at the moment.
            </div>
        </c:if>
        
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach items="${recentPolls}" var="poll" begin="0" end="3">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">${poll.question}</h5>
                            <p class="card-text text-muted">
                                ${poll.options.size()} options • 
                                ${poll.options.stream().map(o -> o.getVoteCount()).sum()} votes
                            </p>
                        </div>
                        <div class="card-footer bg-transparent border-top-0">
                            <a href="/polls/${poll.id}" class="btn btn-outline-primary stretched-link">
                                View Poll
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</main>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Embedded JavaScript (from navbar.js) -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const userId = '<%= session.getAttribute("userId") %>';
        const user = localStorage.getItem("user") || (userId && userId !== 'null');
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");

        if (user) {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/lectures">Course Material</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls">Polls</a></li>
                <li class="nav-item"><a class="nav-link" href="/personal-info">Personal Info</a></li>
                <li class="nav-item"><a class="nav-link" href="/comments">Comments</a></li>
            `;
            authButton.textContent = "Logout";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout";
            });
        } else {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
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

