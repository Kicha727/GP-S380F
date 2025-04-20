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
        <a class="navbar-brand" href="#">香港都會大學</a>
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
        <%
            String uri = request.getRequestURI();
            boolean isZh = uri.equals("/zh");
        %>
        <div class="dropdown">
            <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                語言: 繁體中文
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="<%= request.getContextPath() + "/" %>">English</a></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() + "/zh" %>">繁體中文</a></li>
            </ul>
        </div>

    </div>
</nav>

<!-- Main Content -->
<main class="container py-5">
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1 class="hero-title">歡迎來到香港都會大學</h1>
            <p class="hero-subtitle">香港現代大學－創新與教育的交會</p>

            <c:choose>
                <c:when test="${empty sessionScope.userId}">
                    <a href="/login" class="btn btn-light hero-button">
                        <i class="fas fa-lock me-2"></i> 登入以探索課程
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="/lectures" class="btn btn-light hero-button">
                        Explore Courses <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <!-- Lecture Section -->
    <section class="my-5">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="section-title">你的課程</h2>
                <c:choose>
                    <c:when test="${not empty sessionScope.userId}">
                    <span class="badge bg-primary p-2">
                        <i class="fas fa-graduation-cap me-1"></i> Course:
                        <c:choose>
                            <c:when test="${not empty sessionScope.course}">
                                ${sessionScope.course}
                            </c:when>
                            <c:otherwise>
                                <span id="courseDisplayText">載入中</span>
                            </c:otherwise>
                        </c:choose>
                    </span>
                    </c:when>
                    <c:otherwise>
                    <span class="badge bg-secondary p-2">
                        <i class="fas fa-lock me-1"></i> 登入以探索課程
                    </span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="lectureContainer" class="horizontal-scroll d-flex flex-nowrap overflow-auto gap-4"></div>
        </div>
    </section>

    <!-- Recent Polls Section -->
    <section class="my-5">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="section-title">最近的投票</h2>

                <c:choose>
                    <c:when test="${empty sessionScope.userId}">
                        <button class="btn btn-outline-secondary" disabled>
                            <i class="fas fa-lock me-2"></i> 登入以查看投票
                        </button>
                    </c:when>
                    <c:otherwise>
                        <a href="/polls" class="btn btn-outline-primary">查看所有投票</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:if test="${recentPolls.isEmpty()}">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle me-2"></i>目前沒有可用的投票
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
                                <c:choose>
                                    <c:when test="${empty sessionScope.userId}">
                                        <a href="/login" class="btn btn-outline-secondary">
                                            <i class="fas fa-lock me-2"></i> 請登入
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/polls/${poll.id}" class="btn btn-outline-primary">
                                            View Poll <i class="fas fa-arrow-right ms-2"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</main>

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
            <li class="nav-item"><a class="nav-link active" href="/"><i class="fas fa-home me-1"></i> 主頁</a></li>
            <li class="nav-item"><a class="nav-link" href="/lectures"><i class="fas fa-book me-1"></i> 課程資料</a></li>
            <li class="nav-item"><a class="nav-link" href="/polls"><i class="fas fa-poll me-1"></i> 投票</a></li>
            <li class="nav-item"><a class="nav-link" href="/personal-info"><i class="fas fa-user me-1"></i> 用戶資訊</a></li>
            <li class="nav-item"><a class="nav-link" href="/comments"><i class="fas fa-comments me-1"></i> 評論</a></li>
        `;
            authButton.textContent = "登出";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout";
            });
        } else {
            navMenu.innerHTML = `
            <li class="nav-item"><a class="nav-link active" href="/"><i class="fas fa-home me-1"></i> 主頁</a></li>
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

        // Fetch lecture list from server and display as cards
        console.log("📦 userId from session:", userId);

        if (!userId || userId === "null") {
            console.warn("⚠️ userId is not defined or null");
        } else {
            const endpoint = `/getLectures?userID=${userId}`;
            console.log("🌐 Fetching lectures from:", endpoint);

            fetch(endpoint)
                .then(response => {
                    console.log("✅ Raw response:", response);
                    if (!response.ok) {
                        throw new Error(`❌ HTTP error! Status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log("🧾 Parsed lecture data:", data);
                    const container = document.getElementById('lectureContainer');

                    if (!Array.isArray(data)) {
                        console.error("❗ Response is not an array. Got:", data);
                        return;
                    }

                    data.forEach((lecture, index) => {
                        console.log(`📘 Lecture #${index + 1}`, lecture);

                        const card = document.createElement('div');
                        card.className = 'feature-card p-3 flex-shrink-0';
                        card.style.width = '300px';

                        const icon = document.createElement('i');
                        icon.className = 'fas fa-book feature-icon';
                        card.appendChild(icon);

                        const title = document.createElement('h3');
                        title.className = 'feature-title';
                        title.textContent = lecture.code;
                        card.appendChild(title);

                        const text = document.createElement('p');
                        text.className = 'feature-text';
                        text.textContent = lecture.name;
                        card.appendChild(text);

                        container.appendChild(card);

                        if (!lecture.code || !lecture.name) {
                            console.warn(`⚠️ Missing data in lecture #${index + 1}:`, lecture);
                        }
                    });

                    if (data.length === 0) {
                        console.info("ℹ️ No lectures found for this user.");
                    }

                    updateCourseDisplay(data);
                })
                .catch(err => console.error("💥 Failed to load lectures:", err));
        }

        // unified all couse
        function updateCourseDisplay(lectureData) {
            const courseDisplayText = document.getElementById("courseDisplayText");
            if (!courseDisplayText) return;

            // API check user info
            fetch('/users/current')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to fetch user data');
                    }
                    return response.json();
                })
                .then(userData => {
                    // use user info to show the course name
                    if (userData && userData.course) {
                        courseDisplayText.textContent = userData.course;
                        console.log("✅ Course name set from API:", userData.course);
                    } else {
                        fallbackToCourseCode(lectureData);
                    }
                })
                .catch(error => {
                    console.error("❌ Error fetching user data:", error);
                    // if false
                    fallbackToCourseCode(lectureData);
                });
        }

        // Use course id to the course name
        function fallbackToCourseCode(lectureData) {
            const courseDisplayText = document.getElementById("courseDisplayText");
            if (!courseDisplayText) return;

            if (Array.isArray(lectureData) && lectureData.length > 0 && lectureData[0].code) {
                courseDisplayText.textContent = lectureData[0].code;
                console.log("ℹ️ Using lecture code as course name:", lectureData[0].code);
            } else {
                const lectureContainer = document.getElementById('lectureContainer');
                if (lectureContainer && lectureContainer.children.length > 0) {
                    const firstLectureTitle = lectureContainer.querySelector('.feature-title');
                    if (firstLectureTitle) {
                        courseDisplayText.textContent = firstLectureTitle.textContent;
                        console.log("ℹ️ Using DOM lecture title as course name:", firstLectureTitle.textContent);
                    } else {
                        courseDisplayText.textContent = 'Not Available';
                        console.warn("⚠️ No lecture title found in DOM");
                    }
                } else {
                    courseDisplayText.textContent = 'Not Enrolled';
                    console.warn("⚠️ No lectures available");
                }
            }
        }

        // Double check is that null
        setTimeout(function() {
            const courseDisplayText = document.getElementById("courseDisplayText");
            if (courseDisplayText && courseDisplayText.textContent === 'Loading...') {
                console.log("🕒 Timeout reached, using fallback...");
                fallbackToCourseCode([]);
            }
        }, 3000); // loading at least 3s
    });
</script>
</body>
</html>