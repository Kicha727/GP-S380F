<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In to page</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Inline CSS -->
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
            height: 100%;
            font-family: 'Poppins', sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        body {
            display: flex;
            flex-direction: column;
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

        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            margin-top: 2rem;
        }

        .login-container {
            display: flex;
            width: 900px;
            max-width: 100%;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
            overflow: hidden;
            background-color: var(--card-bg);
        }

        .login-image {
            flex: 1;
            background-image: url('https://source.unsplash.com/random/1200x800/?university');
            background-size: cover;
            background-position: center;
            min-height: 500px;
            display: none;
        }

        .login-form {
            flex: 1;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-subtitle {
            color: var(--text-muted);
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-floating {
            margin-bottom: 1.5rem;
        }

        .form-control {
            border: 2px solid var(--border-color);
            padding: 1rem 0.75rem;
            height: calc(3.5rem + 2px);
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(139, 92, 246, 0.25);
        }

        .form-floating > label {
            padding: 1rem 0.75rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            padding: 0.8rem;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--accent-color), var(--secondary-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .form-divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: var(--text-muted);
        }

        .form-divider::before, .form-divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid var(--border-color);
        }

        .form-divider::before {
            margin-right: 1rem;
        }

        .form-divider::after {
            margin-left: 1rem;
        }

        .social-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .btn-social {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.8rem;
            border: 2px solid var(--border-color);
            border-radius: 0.375rem;
            font-weight: 500;
            color: var(--text-color);
            background-color: transparent;
            transition: all 0.3s ease;
        }

        .btn-social:hover {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .btn-social i {
            font-size: 1.2rem;
        }

        .auth-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: var(--text-muted);
        }

        .auth-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .auth-footer a:hover {
            text-decoration: underline;
        }

        .alert {
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
        }

        /* Responsive styles */
        @media (min-width: 768px) {
            .login-image {
                display: block;
            }
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

        #authButton:active {
            transform: translateY(0);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Welcome</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarCollapse">
                <ul class="navbar-nav" id="navMenu"></ul>
                <div class="d-flex align-items-center">
                    <button id="authButton" class="btn btn-success"></button>
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
    </nav>

    <main>
        <div class="login-container">
            <div class="login-image"></div>
            <div class="login-form">
                <h1 class="form-title">Hello User!</h1>
                <p class="form-subtitle">Sign in to continue to your account</p>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i>${error}
                    </div>
                </c:if>
                
                <c:if test="${not empty success}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>${success}
                    </div>
                </c:if>

                <form action="/login" method="post">
                    <div class="form-floating">
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                        <label for="email">Email address</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <label for="password">Password</label>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>

                    <button class="btn btn-primary w-100 py-2" type="submit">
                        Sign in <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </form>

                <div class="form-divider">or continue with</div>

                <div class="social-buttons">
                    <button class="btn-social">
                        <i class="fab fa-google" style="color: #EA4335;"></i>
                        Google
                    </button>
                    <button class="btn-social">
                        <i class="fab fa-facebook" style="color: #1877F2;"></i>
                        Facebook
                    </button>
                </div>

                <div class="auth-footer">
                    Don't have an account? <a href="/register">Register here</a>
                </div>
            </div>
        </div>
    </main>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const user = localStorage.getItem("user");
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
            `;
            authButton.textContent = "Login";
            authButton.addEventListener("click", function () {
                window.location.href = "/login";
            });
        });
    </script>
</body>
</html>