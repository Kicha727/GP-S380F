<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>創建投票</title>
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
                            <i class="bi bi-globe"></i>   語言
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                            <li><a class="dropdown-item" href="/create-poll">English</a></li>
                            <li><a class="dropdown-item active" href="/create-poll_zh">中文</a></li>
                        </ul>
                    </div>
                    <button id="authButton" class="btn btn-outline-success"></button>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
      
        
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h1 class="h3 mb-0">建立新投票</h1>
            </div>
            <div class="card-body">
                <form action="/polls/create_zh" method="post">
                    <div class="mb-3">
                        <label for="question" class="form-label">投票問題</label>
                        <input type="text" class="form-control" id="question" name="question" 
                               placeholder="填入投票問題" required>
                        <div class="form-text">例如："你會在什麼時候舉行期中考試？"</div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">投票選項</label>
                        <p class="form-text mb-2">您必須提供4個選項。</p>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">1</span>
                            <input type="text" class="form-control" name="option1" 
                                   placeholder="選項 1" required>
                        </div>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">2</span>
                            <input type="text" class="form-control" name="option2" 
                                   placeholder="選項 2" required>
                        </div>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">3</span>
                            <input type="text" class="form-control" name="option3" 
                                   placeholder="選項 3" required>
                        </div>
                        
                        <div class="input-group mb-2">
                            <span class="input-group-text">4</span>
                            <input type="text" class="form-control" name="option4" 
                                   placeholder="選項 4" required>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="/polls/zh" class="btn btn-outline-secondary me-md-2">取消</a>
                        <button type="submit" class="btn btn-primary">建立投票</button>
                    </div>
                </form>
            </div>
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
                    <li class="nav-item"><a class="nav-link" href="/personal-info/zh">個人資料</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments_zh">評論</a></li>
                `;
                authButton.textContent = "登出";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/login";
                });
            } else {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls_zh">投票</a></li>
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