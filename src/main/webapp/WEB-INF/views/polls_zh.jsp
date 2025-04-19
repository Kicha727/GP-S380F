<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>投票</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body {
            min-height: 75rem;
            padding-top: 4.5rem;
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
                            <i class="bi bi-globe"></i> 語言
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                            <li><a class="dropdown-item" href="/polls">English</a></li>
                            <li><a class="dropdown-item active" href="/polls/zh">中文</a></li>
                        </ul>
                    </div>
                    <button id="authButton" class="btn btn-outline-success"></button>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>投票</h1>
            <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
                <a href="/polls/create_zh" class="btn btn-primary">建立新投票</a>
            </c:if>
        </div>
        
        <c:if test="${polls.isEmpty()}">
            <div class="alert alert-info">
                目前沒有任何投票。
            </div>
        </c:if>
        
        <div class="row">
            <c:forEach items="${polls}" var="poll">
                <div class="col-md-6 mb-4">
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const user = localStorage.getItem("user");
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            if (user) {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
                    <li class="nav-item"><a class="nav-link" href="/lectures_zh">課程資料</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls/zh">投票</a></li>
                    <li class="nav-item"><a class="nav-link" href="/personal-info_zh">個人資料</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments_zh">評論</a></li>
                `;
                authButton.textContent = "登出";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/login_zh";
                });
            } else {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls/zh">投票</a></li>
                `;
                authButton.textContent = "登錄";
                authButton.classList.add("btn-success");
                authButton.addEventListener("click", function () {
                    window.location.href = "/login_zh";
                });
            }
        });
    </script>
</body>
</html> 