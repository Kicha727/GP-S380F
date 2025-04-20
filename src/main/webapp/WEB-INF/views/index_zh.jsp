<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首頁</title>

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
        <a class="navbar-brand" href="#">HKMU</a>
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
                        <i class="bi bi-globe"></i>   語言
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                        <li><a class="dropdown-item" href="/">English</a></li>
                        <li><a class="dropdown-item active" href="/index_zh">中文</a></li>
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
        <h1>歡迎來到香港都會大學</h1>
        <p class="lead">香港都會大學於 1989 年由政府成立，提供遙距教育，並於 2001 年開始提供全日制課程。經過多年的努力，都會大學的開放及靈活的教育課程已在亞太地區佔有領導地位。同時，我們為合資格的中學畢業生提供的全日制課程也可媲美香港其他大型大學。時至今日，都會大學已成為一所年輕、充滿活力及全面發展的優質大學。</p>
        <a class="btn btn-lg btn-primary" href="https://www.hkmu.edu.hk/tc/" role="button">了解更多 &raquo;</a>
    </div>
</main>
<main class="container "style="padding-top: 10px">
    <c:choose>
        <c:when test="${user != null}">
            <!-- Content for logged-in users -->
            <div class="row">
                <div class="col-md-12">
                    <div class="bg-body-tertiary p-4 rounded mb-4">
                        <h1>歡迎回來，${user.name}！</h1>
                        <p class="lead">
                            <strong>你的課程：</strong> ${user.course} | 
                            <strong>學年：</strong> ${user.academicYear}
                        </p>
                    </div>
                </div>
            </div>
            
            <!-- Course Materials Section -->
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h2 class="h4 mb-0">你的課程資料</h2>
                        </div>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${lectures != null && !lectures.isEmpty()}">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>演講標題</th>
                                                    <th>新增日期</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${lectures}" var="lecture">
                                                    <tr>
                                                        <td>${lecture.title}</td>
                                                        <td>${sessionScope['lecture_'.concat(lecture.id).concat('_date')]}</td>
                                                        <td>
                                                            <a href="/download/${lecture.id}" class="btn btn-sm btn-primary">下载</a>
                                                            <a href="/lectures/${lecture.id}" class="btn btn-sm btn-secondary">查看详情</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <a href="/lectures" class="btn btn-outline-primary mt-3">檢視所有講座</a>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-info">
                                        您的課程還沒有可用的講座資料。
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
                <h1>歡迎使用香港都會大學網上學習平台</h1>
                <p class="lead">請登入以檢視您的課程資料和參與投票。</p>
                <a class="btn btn-lg btn-primary" href="/login_zh" role="button">登錄</a>
                <a class="btn btn-lg btn-secondary" href="/register_zh" role="button">注冊</a>
            </div>
        </c:otherwise>
    </c:choose>
    
    <!-- Recent Polls Section -->
    <div class="my-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>最近投票</h2>
            <a href="/polls/zh" class="btn btn-outline-primary">查看全部</a>
        </div>
        
        <c:if test="${recentPolls.isEmpty()}">
            <div class="alert alert-info">
                目前沒有任何投票。
            </div>
        </c:if>
        
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach items="${recentPolls}" var="poll" begin="0" end="3">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">${poll.question}</h5>
                            <p class="card-text text-muted">
                                ${poll.options.size()} 個選項 • 
                                ${poll.options.stream().map(o -> o.getVoteCount()).sum()} 票
                            </p>
                        </div>
                        <div class="card-footer bg-transparent border-top-0">
                            <a href="/polls/${poll.id}/zh" class="btn btn-outline-primary stretched-link">
                                查看投票
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
                <li class="nav-item"><a class="nav-link active" href="/index_zh">首頁</a></li>
                <li class="nav-item"><a class="nav-link" href="/lectures_zh">課程資料</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls/zh">投票</a></li>
                <li class="nav-item"><a class="nav-link" href="/personal-info_zh">個人資料</a></li>
                <li class="nav-item"><a class="nav-link" href="/comments_zh">評論</a></li>
            `;
            authButton.textContent = "登出";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout";
            });
        } else {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link active" href="/index_zh">首頁</a></li>
            `;
            authButton.textContent = "登錄";
            authButton.classList.add("btn-success");
            authButton.addEventListener("click", function () {
                window.location.href = "/login_zh";
            });
        }

        if (userId && userId !== 'null' && !localStorage.getItem("user")) {
            localStorage.setItem("user", "true");
        }
    });
</script>


</body>
</html> 