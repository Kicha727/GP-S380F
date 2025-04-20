<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>講座資料</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  
    <style>
        body{
            min-height: 75rem;
            padding-top: 4.5rem;
        }
        #authButton{
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
                        <li><a class="dropdown-item" href="/lectures/${id}">English</a></li>
                        <li><a class="dropdown-item active" href="/lectures_zh/${id}">中文</a></li>
                    </ul>
                </div>
                <button id="authButton" class="btn btn-outline-success"></button>
            </div>
        </div>
    </div>
</nav>

<!-- Main content container -->
<div class="container mt-5">
    <!-- Lecture Info -->
    <p class="card-text text-muted">
        上传时间: <fmt:formatDate value="${lecture.createdAt}" pattern="yyyy-MM-dd HH:mm" />
    </p>

    <!-- Comments List -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h3 class="card-title">🗨 評論</h3>
            <ul class="list-group list-group-flush">
                <c:forEach var="comment" items="${comments}">
                    <li class="list-group-item">
                        <strong>${comment.user != null ? comment.user.name : "未知用戶"}</strong>: ${comment.content}<br/>
                        <small>發佈於: ${comment.createdAt}</small>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>

    <!-- Comment Form -->
    <div class="card shadow-sm">
        <div class="card-body">
            <h3 class="card-title">➕ 添加評論</h3>
            <!-- ✅ FIXED FORM ACTION -->
            <form method="post" action="/lectures/${id}/comment_zh">
            <div class="mb-3">
                    <textarea name="content" class="form-control" rows="3" required placeholder="在此輸入你的評論。。。"></textarea>
                </div>
                <button type="submit" class="btn btn-success">發佈評論</button>
            </form>
        </div>
    </div>

    <!-- Back to list -->
    <div class="mt-3">
        <a href="/lectures_zh" class="btn btn-outline-secondary">← 返回講座列表</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
    });
</script>
</body>
</html> 