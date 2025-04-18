<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comments</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
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
                <button id="authButton" class="btn btn-outline-success"></button>
            </div>
        </div>
    </div>
</nav>

<br><br>
<div class="container mt-4">
    <h2>Comments</h2>
    <div class="mt-3">
        <a href="/" class="btn btn-secondary">Home</a>
        <a href="/login" class="btn btn-secondary">Login</a>
    </div>
    <br>

    <c:if test="${sessionScope.userId != null}">


        <h3>Comments (${comments.size()})</h3>

        <c:if test="${empty comments}">
            <div class="alert alert-info">No comments yet. Be the first to comment! </div>
        </c:if>

        <c:forEach var="comment" items="${comments}">
            <div class="comment-container" id="comment-${comment.id}">
                <div class="comment-header">
                    <div class="d-flex justify-content-between">
                        <strong class="comment-user">${comment.user.name}</strong>
                            <c:if test="${comment.user.role == 'TEACHER'}">
                                <span class="bg-primary text-light">Teacher</span>
                            </c:if>
                            <span class="comment-time">
                                <fmt:parseDate value="${comment.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm" />
                            </span>
                    </div>


                    <c:if test="${sessionScope.userRole == 'TEACHER' || sessionScope.userId == comment.user.id}">
                        <div class="comment-actions">
                            <form action="/comments/delete/${comment.id}" method="post" style="display: inline;">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</button>
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
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>