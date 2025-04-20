<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create an Account - MUHK</title>

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

        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            margin-top: 2rem;
        }

        .register-container {
            display: flex;
            width: 1000px;
            max-width: 100%;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
            overflow: hidden;
            background-color: var(--card-bg);
        }

        .register-image {
            flex: 1;
            background-image: url('https://source.unsplash.com/random/1200x800/?university,student');
            background-size: cover;
            background-position: center;
            min-height: 600px;
            display: none;
        }

        .register-form {
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
            margin-bottom: 0.5rem;
            text-align: center;
        }

        .form-subtitle {
            color: var(--text-muted);
            margin-bottom: 2rem;
            text-align: center;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .logo {
            width: 80px;
            height: auto;
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.1);
        }

        .form-floating {
            margin-bottom: 1rem;
        }

        .form-control, .form-select {
            border: 2px solid var(--border-color);
            padding: 1rem 0.75rem;
            height: calc(3.5rem + 2px);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(139, 92, 246, 0.25);
        }

        .form-floating > label {
            padding: 1rem 0.75rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group-label {
            display: block;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--text-color);
        }

        .form-check-label {
            color: var(--text-muted);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            padding: 0.8rem;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            border-radius: 0.5rem;
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
            display: flex;
            align-items: center;
        }

        .alert-icon {
            margin-right: 0.75rem;
            font-size: 1.25rem;
        }

        /* Progress bar for password strength */
        .password-strength {
            margin-top: -0.5rem;
            margin-bottom: 1rem;
            height: 5px;
            border-radius: 5px;
            overflow: hidden;
            background-color: var(--border-color);
        }

        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: width 0.3s ease, background-color 0.3s ease;
        }

        .password-strength-label {
            display: flex;
            justify-content: space-between;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .password-requirements {
            margin-top: 0.5rem;
            padding: 0.75rem;
            border-radius: 0.5rem;
            font-size: 0.9rem;
            color: var(--text-muted);
            background-color: rgba(226, 232, 240, 0.3);
        }

        .password-requirement {
            display: flex;
            align-items: center;
            margin-bottom: 0.25rem;
        }

        .password-requirement i {
            margin-right: 0.5rem;
            font-size: 0.8rem;
        }

        .requirement-met {
            color: #10b981;
        }

        .requirement-not-met {
            color: var(--text-muted);
        }

        /* Responsive styles */
        @media (min-width: 768px) {
            .register-image {
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

        .copyright {
            font-size: 0.9rem;
            color: var(--text-muted);
            margin-top: 2rem;
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
        <div class="register-container">
            <div class="register-image"></div>
            <div class="register-form">
                <div class="logo-container">
                    <img class="logo" src="https://muhk.edu.hk/wp-content/uploads/2022/04/logo_symbol.png" alt="MUHK Logo">
                </div>
                <h1 class="form-title">Create an Account</h1>
                <p class="form-subtitle">Join MUHK's learning community today</p>
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle alert-icon"></i>
                        <div>${error}</div>
                    </div>
                </c:if>

                <form action="/register" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required>
                                <label for="name"><i class="fas fa-user me-2"></i>Full Name</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                                <label for="email"><i class="fas fa-envelope me-2"></i>Email address</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                    </div>
                    
                    <div class="password-strength">
                        <div class="password-strength-bar" id="passwordStrengthBar"></div>
                    </div>
                    
                    <div class="password-strength-label">
                        <span>Weak</span>
                        <span>Strong</span>
                    </div>
                    
                    <div class="password-requirements mb-3">
                        <div class="password-requirement">
                            <i class="fas fa-circle requirement-not-met" id="req-length"></i>
                            <span>At least 8 characters</span>
                        </div>
                        <div class="password-requirement">
                            <i class="fas fa-circle requirement-not-met" id="req-uppercase"></i>
                            <span>Contains uppercase letter</span>
                        </div>
                        <div class="password-requirement">
                            <i class="fas fa-circle requirement-not-met" id="req-lowercase"></i>
                            <span>Contains lowercase letter</span>
                        </div>
                        <div class="password-requirement">
                            <i class="fas fa-circle requirement-not-met" id="req-number"></i>
                            <span>Contains number</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone Number" required>
                                <label for="phone"><i class="fas fa-phone me-2"></i>Phone Number</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <select class="form-select" id="gender" name="gender" required>
                                    <option value="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                                <label for="gender"><i class="fas fa-venus-mars me-2"></i>Gender</label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="course" name="course" placeholder="Course" required>
                                <label for="course"><i class="fas fa-graduation-cap me-2"></i>Course</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating mb-3">
                                <select class="form-select" id="academicYear" name="academicYear" required>
                                    <option value="">Select Academic Year</option>
                                    <option value="2023-2024">2023-2024</option>
                                    <option value="2024-2025">2024-2025</option>
                                    <option value="2025-2026">2025-2026</option>
                                </select>
                                <label for="academicYear"><i class="fas fa-calendar-alt me-2"></i>Academic Year</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">
                            I agree to the <a href="#" class="text-decoration-none">Terms of Service</a> and <a href="#" class="text-decoration-none">Privacy Policy</a>
                        </label>
                    </div>

                    <button class="btn btn-primary w-100 py-2" type="submit">
                        Create Account <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </form>

                <div class="auth-footer">
                    Already have an account? <a href="/login">Sign in here</a>
                </div>
                <div class="copyright text-center">
                    &copy; 2025 MUHK Polling System
                </div>
            </div>
        </div>
    </main>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
            `;
            authButton.textContent = "Login";
            authButton.classList.add("btn-success");
            authButton.addEventListener("click", function () {
                window.location.href = "/login";
            });
            
            // Password strength checker
            const passwordInput = document.getElementById('password');
            const strengthBar = document.getElementById('passwordStrengthBar');
            const reqLength = document.getElementById('req-length');
            const reqUppercase = document.getElementById('req-uppercase');
            const reqLowercase = document.getElementById('req-lowercase');
            const reqNumber = document.getElementById('req-number');
            
            passwordInput.addEventListener('input', function() {
                const password = this.value;
                let strength = 0;
                
                // Check requirements
                const hasLength = password.length >= 8;
                const hasUpperCase = /[A-Z]/.test(password);
                const hasLowerCase = /[a-z]/.test(password);
                const hasNumber = /[0-9]/.test(password);
                
                // Update requirement indicators
                reqLength.className = hasLength ? 'fas fa-check-circle requirement-met' : 'fas fa-circle requirement-not-met';
                reqUppercase.className = hasUpperCase ? 'fas fa-check-circle requirement-met' : 'fas fa-circle requirement-not-met';
                reqLowercase.className = hasLowerCase ? 'fas fa-check-circle requirement-met' : 'fas fa-circle requirement-not-met';
                reqNumber.className = hasNumber ? 'fas fa-check-circle requirement-met' : 'fas fa-circle requirement-not-met';
                
                // Calculate strength
                if (hasLength) strength += 25;
                if (hasUpperCase) strength += 25;
                if (hasLowerCase) strength += 25;
                if (hasNumber) strength += 25;
                
                // Update strength bar
                strengthBar.style.width = strength + '%';
                
                // Change color
                if (strength <= 25) {
                    strengthBar.style.backgroundColor = '#ef4444';
                } else if (strength <= 50) {
                    strengthBar.style.backgroundColor = '#f97316';
                } else if (strength <= 75) {
                    strengthBar.style.backgroundColor = '#facc15';
                } else {
                    strengthBar.style.backgroundColor = '#10b981';
                }
            });
        });
    </script>
</body>
</html>