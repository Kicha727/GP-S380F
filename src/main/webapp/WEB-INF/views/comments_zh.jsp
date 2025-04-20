<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>評論</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }
        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
        .comment-container {
            margin-bottom: 20px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            padding: 15px;
            background-color: #f9f9f9;
        }
        .comment-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .comment-actions {
            display: flex;
            gap: 10px;
        }
        .comment-user {
            font-weight: bold;
        }
        .comment-time {
            color: #777;
            font-size: 0.9em;
        }
        .comment-content {
            margin-top: 10px;
            white-space: pre-wrap;
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
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0" id="navMenu"></ul>
            <div class="d-flex">
                <div class="dropdown me-2">
                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-globe"></i>   語言
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                        <li><a class="dropdown-item" href="/">English</a></li>
                        <li><a class="dropdown-item active" href="/index_zh">中文</a></li>
                    </ul>
                </div>
                <button id="authButton" class="btn btn-outline-success"></button>
            </div>
        </div>
    </div>
</nav>

<br><br><br>
<!--Show Comments-->
<h3>評論 (${comments.size()})</h3>
<c:if test="${sessionScope.userId == null}">
    <a>您必須登入才能檢視評論。</a>
    <a href="/login_zh">登錄</a>
</c:if>

<c:if test="${sessionScope.userId != null}">
    <form action="/comments/addComment_zh" method="post" class="mb-4">
        <div class="form-group">
            <textarea name="content" class="form-control" rows="3" placeholder="留下你的評論" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary mt-2">發表評論</button>
    </form>
    <c:if test="${empty comments}">
        <div class="alert alert-info">尚未有評論。成為第一個發表評論的人！</div>
    </c:if>



        <c:forEach var="comment" items="${comments}">
            <div class="comment-container" id="comment-${comment.id}">
                <div class="comment-header">
                    <div class="d-flex justify-content-between">
                        <div>
                            <strong>${comment.user.name}</strong>
                            <c:if test="${comment.user.role == 'TEACHER'}">
                                <span class="badge bg-primary text-light">講師</span>
                            </c:if>

                            <span class="comment-time">
                                <fmt:parseDate value="${comment.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm" />
                            </span>
                        </div>
                    </div>
                    <c:if test="${sessionScope.userRole == 'TEACHER' || sessionScope.userId == comment.user.id}">
                        <div class="comment-actions">
                            <form action="/comments/delete_zh/${comment.id}" method="post" style="display: inline;">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('你確定要刪除這則評論嗎？')">刪除</button>
                            </form>
                        </div>
                    </c:if>
                </div>

                <div class="comment-content">${comment.content}</div>
            </div>
        </c:forEach>

    </c:if>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Navigation and authentication
    document.addEventListener("DOMContentLoaded", function () {
        const user = localStorage.getItem("user");
        const navMenu = document.getElementById("navMenu");
        const authButton = document.getElementById("authButton");

        navMenu.innerHTML = `
            <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
            <li class="nav-item"><a class="nav-link" href="/lectures_zh">課程資料</a></li>
            <li class="nav-item"><a class="nav-link" href="/polls/zh">投票</a></li>
            <li class="nav-item"><a class="nav-link" href="/personal-info_zh">個人資料</a></li>
            <li class="nav-item"><a class="nav-link active" href="/comments_zh">評論</a></li>
             `;
        if (user) {
            authButton.textContent = "登出";
            authButton.classList.add("btn-danger");
            authButton.addEventListener("click", function () {
                localStorage.removeItem("user");
                window.location.href = "/login_zh";
            });
        } else {
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