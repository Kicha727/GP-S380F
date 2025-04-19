<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${lecture.title} - Lecture Details | MUHK</title>

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
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .lecture-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
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

        .lecture-meta {
            color: var(--text-muted);
            margin-bottom: 1.5rem;
        }

        .lecture-meta i {
            margin-right: 0.5rem;
        }

        .badge-category {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            font-weight: 500;
            padding: 0.4rem 0.8rem;
            border-radius: 2rem;
            font-size: 0.8rem;
        }

        .lecture-content {
            margin-top: 2rem;
        }

        .lecture-content h4 {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .comment-card {
            background-color: var(--card-bg);
            border-radius: 1rem;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            transition: all 0.3s ease;
        }

        .comment-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .comment-author {
            font-weight: 600;
            display: flex;
            align-items: center;
        }

        .teacher-badge {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            font-size: 0.7rem;
            padding: 0.2rem 0.6rem;
            border-radius: 1rem;
            margin-left: 0.7rem;
            font-weight: 500;
        }

        .comment-date {
            color: var(--text-muted);
            font-size: 0.9rem;
        }

        .comment-content {
            color: var(--text-color);
            line-height: 1.6;
        }

        .breadcrumb {
            background-color: transparent;
            padding: 0.5rem 0;
            margin-bottom: 2rem;
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

        textarea.form-control {
            border-radius: 0.5rem;
            padding: 1rem;
            font-family: 'Poppins', sans-serif;
            border: 1px solid var(--border-color);
            transition: all 0.3s ease;
        }

        textarea.form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.25);
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

        .btn-back {
            background: linear-gradient(135deg, var(--text-muted), #475569);
            color: white;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background: linear-gradient(135deg, #475569, #334155);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(71, 85, 105, 0.3);
            color: white;
        }

        .teacher-actions {
            margin-top: 1.5rem;
            display: flex;
            gap: 1rem;
        }

        .btn-edit {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            color: white;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-edit:hover {
            background: linear-gradient(135deg, #1d4ed8, #1e40af);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(29, 78, 216, 0.3);
            color: white;
        }

        .btn-delete {
            background: linear-gradient(135deg, #ef4444, #b91c1c);
            color: white;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-delete:hover {
            background: linear-gradient(135deg, #b91c1c, #991b1b);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(185, 28, 28, 0.3);
            color: white;
        }

        .no-comments {
            text-align: center;
            padding: 3rem 0;
        }

        .no-comments-icon {
            font-size: 3rem;
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .no-comments-text {
            font-size: 1.2rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        @media (max-width: 767.98px) {
            .lecture-title {
                font-size: 2rem;
            }
            .section-title {
                font-size: 1.75rem;
            }
            .comment-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .comment-date {
                margin-top: 0.5rem;
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
<main class="container py-5">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/"><i class="fas fa-home me-1"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="/lectures"><i class="fas fa-book me-1"></i> Course Materials</a></li>
            <li class="breadcrumb-item active">${lecture.title}</li>
        </ol>
    </nav>

    <!-- Lecture Details -->
    <div class="card mb-5">
        <div class="card-body p-4">
            <h1 class="lecture-title">${lecture.title}</h1>

            <div class="lecture-meta d-flex flex-wrap align-items-center">
                <c:if test="${not empty lecture.createdAt}">
                    <span class="me-4"><i class="fas fa-calendar-alt"></i> ${lecture.createdAt.toLocalDate()}</span>
                    <span class="me-4"><i class="fas fa-clock"></i> ${lecture.createdAt.toLocalTime().toString().substring(0, 5)}</span>
                </c:if>
                <c:if test="${not empty lecture.category}">
                    <span class="badge badge-category"><i class="fas fa-tag me-1"></i> ${lecture.category}</span>
                </c:if>
            </div>

            <div class="lecture-content">
                <c:if test="${not empty lecture.description}">
                    <h4>Description</h4>
                    <p>${lecture.description}</p>
                </c:if>

                <c:if test="${not empty lecture.content}">
                    <h4 class="mt-4">Content</h4>
                    <div class="content-html">
                            ${lecture.content}
                    </div>
                </c:if>

                <c:if test="${sessionScope.userRole == 'TEACHER'}">
                    <div class="teacher-actions">
                        <a href="/lectures/${lecture.id}/edit" class="btn btn-edit">
                            <i class="fas fa-edit me-2"></i> Edit Lecture
                        </a>
                        <button onclick="deleteLecture(${lecture.id})" class="btn btn-delete">
                            <i class="fas fa-trash me-2"></i> Delete Lecture
                        </button>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Comments Section -->
    <section class="comments-section mb-5">
        <h2 class="section-title">Comments</h2>

        <c:if test="${empty comments}">
            <div class="no-comments">
                <i class="fas fa-comments no-comments-icon"></i>
                <p class="no-comments-text">No comments yet. Be the first to share your thoughts!</p>
            </div>
        </c:if>

        <div class="comments-list">
            <c:forEach var="comment" items="${comments}">
                <div class="comment-card">
                    <div class="comment-header">
                        <div class="comment-author">
                                ${comment.user != null ? comment.user.name : "Unknown User"}
                            <c:if test="${comment.user.role == 'TEACHER'}">
                                <span class="teacher-badge"><i class="fas fa-chalkboard-teacher me-1"></i> Teacher</span>
                            </c:if>
                        </div>
                        <div class="comment-date">
                            <i class="fas fa-clock me-1"></i>
                            <c:if test="${not empty comment.createdAt}">
                                ${comment.createdAt.toLocalDate()} at ${comment.createdAt.toLocalTime().toString().substring(0, 5)}
                            </c:if>
                        </div>
                    </div>
                    <div class="comment-content">
                            ${comment.content}
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- Comment Form -->
    <c:if test="${not empty sessionScope.userId}">
        <div class="card mb-5">
            <div class="card-body p-4">
                <h4 class="card-title mb-3">Add Your Comment</h4>
                <form method="post" action="/lectures/${lecture.id}/comment">
                    <div class="mb-3">
                            <textarea name="content" class="form-control" rows="4" required
                                      placeholder="Share your thoughts about this lecture..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane me-2"></i> Post Comment
                    </button>
                </form>
            </div>
        </div>
    </c:if>

    <c:if test="${empty sessionScope.userId}">
        <div class="alert alert-info mb-5" role="alert">
            <i class="fas fa-info-circle me-2"></i>
            Please <a href="/login" class="alert-link">login</a> to add your comment to this lecture.
        </div>
    </c:if>

    <!-- Back Button -->
    <div class="text-center">
        <a href="/lectures" class="btn btn-back">
            <i class="fas fa-arrow-left me-2"></i> Back to Lecture List
        </a>
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
                        window.location.href = "/lectures";
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