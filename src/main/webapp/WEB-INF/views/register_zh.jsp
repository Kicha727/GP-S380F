<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="zh" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

    <!-- Inline CSS from register.css -->
    <style>
        html, body {
            height: 100%;
        }

        body {
            padding-top: 4.5rem;
            background-color: #f5f5f5;
        }

        .form-register {
            max-width: 400px;
            padding: 1rem;
            margin: 0 auto;
        }

        .form-register .form-floating input,
        .form-register .form-select {
            border-radius: 0;
            margin-bottom: -1px;
        }

        .form-register .form-floating:first-of-type input {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .form-register .form-floating:last-of-type input,
        .form-register .form-floating:last-of-type select {
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            margin-bottom: 10px;
        }

        button {
            border-radius: 6px;
        }
        
        .alert {
            margin-bottom: 15px;
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
<body class="text-center">
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
                            <li><a class="dropdown-item" href="/register">English</a></li>
                            <li><a class="dropdown-item active" href="/register_zh">中文</a></li>
                        </ul>
                    </div>
                    <button id="authButton" class="btn btn-outline-success"></button>
                </div>
            </div>
        </div>
    </nav>

    <main>
        <form action="/register" method="post" class="form-register w-100 m-auto">
            <input type="hidden" name="language" value="zh">
            <img class="mb-4" src="https://muhk.edu.hk/wp-content/uploads/2022/04/logo_symbol.png" alt="HKMU Logo" width="72" height="57">
            <h1 class="h3 mb-3 fw-normal">建立帳戶</h1>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>

            <div class="form-floating">
                <input type="text" class="form-control" id="name" name="name" placeholder="全名" required>
                <label for="name">姓名</label>
            </div>
            <div class="form-floating">
                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                <label for="email">電子郵件</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="password" name="password" placeholder="密碼" required>
                <label for="password">密碼</label>
            </div>
            <div class="form-floating">
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="電話號碼" required>
                <label for="phone">電話號碼</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="course" name="course" placeholder="課程" required>
                <label for="course">課程</label>
            </div>
            <div class="form-floating">
                <select class="form-select" id="academicYear" name="academicYear" required>
                    <option value="">選擇學年</option>
                    <option value="2023-2024">2023-2024</option>
                    <option value="2024-2025">2024-2025</option>
                    <option value="2025-2026">2025-2026</option>
                </select>
                <label for="academicYear">學年</label>
            </div>
            <div class="form-floating">
                <select class="form-select" id="gender" name="gender" required>
                    <option value="">選擇性別</option>
                    <option value="Male">男</option>
                    <option value="Female">女</option>
                    <option value="Other">其他</option>
                </select>
                <label for="gender">性別</label>
            </div>

            <button class="btn btn-primary w-100 py-2 mt-2" type="submit">註冊</button>

            <p class="mt-3">已有帳戶？ <a href="/login_zh">在此登錄</a></p>
            <p class="mt-5 mb-3 text-body-secondary">2025 香港都會大學學習平台</p>
        </form>
    </main>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
            `;
            authButton.textContent = "登錄";
            authButton.classList.add("btn-success");
            authButton.addEventListener("click", function () {
                window.location.href = "/login_zh";
            });
        });
    </script>
</body>
</html> 