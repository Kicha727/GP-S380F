<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecture Materials | MUHK</title>

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
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            background-color: var(--card-bg);
            height: 100%;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-weight: 600;
            color: var(--primary-color);
            font-size: 1.25rem;
            margin-bottom: 1rem;
        }

        .card-body {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
        }

        .card-text {
            flex: 1;
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .card-footer {
            padding: 1rem 1.5rem;
            background-color: rgba(0, 0, 0, 0.02);
            border-top: 1px solid var(--border-color);
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
            color: white;
        }

        .btn-outline-secondary {
            color: var(--text-muted);
            border-color: var(--border-color);
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-outline-secondary:hover {
            background-color: var(--text-muted);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(100, 116, 139, 0.3);
            color: white;
            border-color: var(--text-muted);
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #b91c1c);
            border: none;
            transition: all 0.3s ease;
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #dc2626, #991b1b);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(185, 28, 28, 0.3);
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981, #059669);
            border: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background: linear-gradient(135deg, #059669, #047857);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(5, 150, 105, 0.3);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            margin-top: auto;
        }

        .alert-success {
            background-color: rgba(16, 185, 129, 0.1);
            border: none;
            border-radius: 0.5rem;
            color: #059669;
            padding: 1rem;
            margin-bottom: 2rem;
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            background-color: var(--card-bg);
            border-radius: 1rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .empty-state-icon {
            font-size: 4rem;
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .empty-state-text {
            color: var(--text-muted);
            font-size: 1.2rem;
            margin-bottom: 2rem;
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

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .lecture-meta {
            font-size: 0.9rem;
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .lecture-meta i {
            margin-right: 0.5rem;
        }

        .category-badge {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 0.3rem 0.8rem;
            border-radius: 2rem;
            font-size: 0.75rem;
            font-weight: 500;
            margin-bottom: 1rem;
            display: inline-block;
        }

        .breadcrumb {
            background-color: transparent;
            padding: 0.5rem 0;
            margin-bottom: 1.5rem;
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

        @media (max-width: 767.98px) {
            .section-title {
                font-size: 1.75rem;
            }
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
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
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0" id="navMenu"></ul>
            <div class="d-flex align-items-center">
                <button id="authButton" class="btn"></button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Content -->
<main class="container py-4">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/"><i class="fas fa-home me-1"></i> Home</a></li>
            <li class="breadcrumb-item active">Course Materials</li>
        </ol>
    </nav>

    <!-- Page Header -->
    <div class="page-header">
        <h1 class="section-title">Lecture Materials</h1>
        <c:if test="${sessionScope.userRole == 'TEACHER'}">
            <a href="/upload" class="btn btn-success">
                <i class="fas fa-plus me-2"></i> Upload New Lecture
            </a>
        </c:if>
    </div>

    <!-- Success Message -->
    <c:if test="${not empty message}">
        <div class="alert alert-success">
            <i class="fas fa-check-circle me-2"></i> ${message}
        </div>
    </c:if>

    <!-- Lectures Grid -->
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:if test="${empty lectureMaterials}">
            <div class="col-12">
                <div class="empty-state">
                    <i class="fas fa-book-open empty-state-icon"></i>
                    <p class="empty-state-text">No lecture materials available yet.</p>
                </div>
            </div>
        </c:if>

        <c:forEach var="lecture" items="${lectureMaterials}">
            <div class="col">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">${lecture.title}</h5>
                        <div class="lecture-meta">
                            <div><i class="fas fa-calendar-alt"></i> ${lecture.createdAt}</div>
                        </div>
                        <div class="action-buttons">
                            <a href="${pageContext.request.contextPath}/download/${lecture.id}" class="btn btn-primary">
                                <i class="fas fa-download me-1"></i> Download
                            </a>
                            <a href="/lectures/${lecture.id}" class="btn btn-outline-secondary">
                                <i class="fas fa-eye me-1"></i> View Details
                            </a>
                            <c:if test="${sessionScope.userRole == 'TEACHER'}">
                                <button onclick="deleteLecture(${lecture.id})" class="btn btn-danger">
                                    <i class="fas fa-trash me-1"></i>
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const userId = '<%= session.getAttribute("userId") %>';
        const user = localStorage.getItem("user") || (userId && userId !== 'null');
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");

        if (user) {
            navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/lectures"><i class="fas fa-book me-1"></i> Course Materials</a></li>
                    <li class="nav-item"><a class="nav-link" href="/polls"><i class="fas fa-poll me-1"></i> Polls</a></li>
                    <li class="nav-item"><a class="nav-link" href="/personal-info"><i class="fas fa-user me-1"></i> Personal Info</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments"><i class="fas fa-comments me-1"></i> Comments</a></li>
                `;
            authButton.textContent = "Logout";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout";
            });
        } else {
            navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/lectures"><i class="fas fa-book me-1"></i> Course Materials</a></li>
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

    // Function to handle lecture deletion
    function deleteLecture(lectureId) {
        if (confirm("Are you sure you want to delete this lecture? This action cannot be undone.")) {
            fetch(`/lectures/${lectureId}/delete`, {
                method: 'POST'
            })
                .then(response => {
                    if (response.ok) {
                        window.location.reload();
                    } else {
                        alert("Failed to delete the lecture. Please try again later.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("An error occurred while trying to delete the lecture.");
                });
        }
    }
</script>
</body>
</html>