<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Material Detail</title>
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
            <a class="navbar-brand" href="#">MUHK</a>
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
                            <i class="bi bi-globe"></i> Language
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                            <li><a class="dropdown-item active" href="/lectures/${id}">English</a></li>
                            <li><a class="dropdown-item" href="/lectures_zh/${id}">中文</a></li>
                        </ul>
                    </div>
                    <button id="authButton" class="btn btn-outline-success"></button>
                </div>
            </div>
        </div>
    </nav>
    <div class="container my-4">
        <h2 class="mb-4">Lecture Materials</h2>
        <h2 class="mb-4">Computer Science</h2>

        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>

        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach var="lecture" items="${lectureMaterials}">
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">${lecture.title}</h5>
                            <div class="mt-3">
                                <a href="${pageContext.request.contextPath}/download/${lecture.id}" class="btn btn-sm btn-primary me-2">
                                    <i class="bi bi-download"></i> Download
                                </a>
                                <a href="/lectures/${lecture.id}" class="btn btn-sm btn-outline-secondary">
                                    <i class="bi bi-eye"></i> View Details
                                </a>
                                <!-- 🗑 Delete Form (for TEACHER only) -->
                                <c:if test="${sessionScope.userRole == 'TEACHER'}">
                                <form action="/lectures/${lecture.id}/delete" method="post"
                                          onsubmit="return confirm('Are you sure you want to delete this lecture?');">
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <c:if test="${pageContext.request.isUserInRole('TEACHER')}">
            <div class="mt-4">
                <a href="/upload" class="btn btn-success">
                    <i class="bi bi-upload"></i> Upload New Lecture
                </a>
            </div>
        </c:if>
    </div>
</body>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const userId = '<%= session.getAttribute("userId") %>';
        const userRole = '<%= session.getAttribute("userRole") %>';
        const user = localStorage.getItem("user") || (userId && userId !== 'null');
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");

        if (user) {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="/lectures">Course Material</a></li>
                <li class="nav-item"><a class="nav-link" href="/polls">Polls</a></li>
                <li class="nav-item"><a class="nav-link" href="/personal-info">Personal Info</a></li>
                <li class="nav-item"><a class="nav-link" href="/comments">Comments</a></li>
            `;

            if (userRole === "TEACHER") {
                navMenu.innerHTML += `
                    <li class="nav-item"><a class="nav-link" href="/upload">Upload Lecture</a></li>
                `;
            }

            authButton.textContent = "Logout";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/logout";
            });
        } else {
            navMenu.innerHTML = `
                <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
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
</script>
</html>