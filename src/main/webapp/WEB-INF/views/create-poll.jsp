<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Poll - MUHK</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
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

        .breadcrumb {
            background-color: transparent;
            padding: 1rem 0;
        }

        .breadcrumb-item a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .breadcrumb-item a:hover {
            color: var(--accent-color);
        }

        .breadcrumb-item.active {
            color: var(--text-muted);
            font-weight: 500;
        }

        .breadcrumb-item + .breadcrumb-item::before {
            content: "\f105";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            color: var(--text-muted);
        }

        .card {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 1.5rem;
            border: none;
        }

        .card-header h1 {
            font-weight: 700;
            margin: 0;
        }

        .card-body {
            padding: 2rem;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        .form-text {
            color: var(--text-muted);
        }

        .form-control {
            border: 2px solid var(--border-color);
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(139, 92, 246, 0.25);
        }

        .input-group-text {
            background-color: var(--primary-color);
            color: white;
            border: none;
            font-weight: 600;
            border-radius: 0.5rem 0 0 0.5rem;
            width: 3rem;
            justify-content: center;
        }

        .input-group .form-control {
            border-radius: 0 0.5rem 0.5rem 0;
        }

        .poll-option {
            position: relative;
            padding-right: 2.5rem;
        }

        .option-controls {
            position: absolute;
            right: 0;
            top: 0;
            height: 100%;
            display: flex;
            align-items: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--accent-color), var(--secondary-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .btn-outline-secondary {
            color: var(--text-muted);
            border-color: var(--border-color);
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .btn-outline-secondary:hover {
            color: var(--text-color);
            background-color: var(--border-color);
            transform: translateY(-2px);
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

        .option-hint {
            margin-top: 2rem;
            background-color: rgba(37, 99, 235, 0.1);
            border-left: 4px solid var(--primary-color);
            padding: 1rem;
            border-radius: 0 0.5rem 0.5rem 0;
        }

        .option-hint-title {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .option-example {
            margin-top: 0.5rem;
            padding: 0.5rem;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 0.25rem;
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

    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/"><i class="fas fa-home me-1"></i>Home</a></li>
                <li class="breadcrumb-item"><a href="/polls"><i class="fas fa-poll me-1"></i>Polls</a></li>
                <li class="breadcrumb-item active"><i class="fas fa-plus-circle me-1"></i>Create New Poll</li>
            </ol>
        </nav>
        
        <div class="card shadow mb-5">
            <div class="card-header">
                <h1 class="h3 mb-0"><i class="fas fa-poll-h me-2"></i>Create New Poll</h1>
            </div>
            <div class="card-body">
                <form action="/polls/create" method="post">
                    <div class="mb-4">
                        <label for="question" class="form-label">Poll Question</label>
                        <input type="text" class="form-control" id="question" name="question" 
                               placeholder="Enter your poll question" required autofocus>
                        <div class="form-text mt-2">
                            <i class="fas fa-lightbulb text-warning me-1"></i> Example: "When would you prefer to have the midterm exam?"
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">
                            <i class="fas fa-list-ul me-2"></i>Poll Options
                        </label>
                        <p class="form-text mb-3">You must provide exactly 4 options for your poll.</p>
                        
                        <div class="input-group mb-3">
                            <span class="input-group-text">1</span>
                            <input type="text" class="form-control" name="option1" 
                                   placeholder="Option 1" required>
                        </div>
                        
                        <div class="input-group mb-3">
                            <span class="input-group-text">2</span>
                            <input type="text" class="form-control" name="option2" 
                                   placeholder="Option 2" required>
                        </div>
                        
                        <div class="input-group mb-3">
                            <span class="input-group-text">3</span>
                            <input type="text" class="form-control" name="option3" 
                                   placeholder="Option 3" required>
                        </div>
                        
                        <div class="input-group mb-3">
                            <span class="input-group-text">4</span>
                            <input type="text" class="form-control" name="option4" 
                                   placeholder="Option 4" required>
                        </div>
                    </div>
                    
                    <div class="option-hint mb-4">
                        <div class="option-hint-title">
                            <i class="fas fa-info-circle me-1"></i> Tips for Creating Effective Poll Options
                        </div>
                        <ul class="mb-2">
                            <li>Keep options clear and concise</li>
                            <li>Make sure options don't overlap</li>
                            <li>Use neutral language to avoid bias</li>
                            <li>Consider all possible responses</li>
                        </ul>
                        <div class="option-example">
                            <strong>Example:</strong> For a poll about exam timing, you might use options like:
                            <br>1. Monday morning (9-11 AM)
                            <br>2. Tuesday afternoon (2-4 PM)
                            <br>3. Wednesday evening (6-8 PM)
                            <br>4. Friday morning (10-12 AM)
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="/polls" class="btn btn-outline-secondary me-md-2">
                            <i class="fas fa-times me-1"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-paper-plane me-1"></i> Create Poll
                        </button>
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
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/course">Course Material</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls">Polls</a></li>
                    <li class="nav-item"><a class="nav-link" href="/personal-info">Personal Info</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments">Comments</a></li>
                `;
                if (userRole === "TEACHER") {
                    navLinks += `
                    <li class="nav-item"><a class="nav-link" href="/upload">Upload Lecture</a></li>
                `;
                }
                authButton.textContent = "Logout";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/login";
                });
            } else {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls">Polls</a></li>
                `;
                authButton.textContent = "Login";
                authButton.classList.add("btn-success");
                authButton.addEventListener("click", function () {
                    window.location.href = "/login";
                });
            }
        });
    </script>
</body>
</html> 