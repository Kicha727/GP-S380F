<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comments - ${poll.title}</title>
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
        .edit-form {
            display: none;
            margin-top: 10px;
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
    <div class="container mt-4">
        <sec:authorize access="hasAnyRole('STUDENT', 'TEACHER')">
            <h2>Poll：${poll.title}</h2>
            <p>${poll.description}</p>
            
            <div class="card mb-4">
                <div class="card-header">
                    <h4>Add comments</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success">${success}</div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/comments/add" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" name="pollId" value="${poll.id}" />
                        <div class="form-group">
                            <label for="content">Comments content</label>
                            <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Post comment</button>
                    </form>
                </div>
            </div>
            
            <h3>Comments (${comments.size()})</h3>
            
            <c:if test="${empty comments}">
                <div class="alert alert-info">No comment yet</div>
            </c:if>
            
            <c:forEach var="comment" items="${comments}">
                <div class="comment-container" id="comment-${comment.id}">
                    <div class="comment-header">
                        <div>
                            <span class="comment-user">${comment.user.username}</span>
                            <span class="comment-time">
                                <fmt:parseDate value="${comment.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd HH:mm" />
                            </span>
                        </div>
                        
                        <sec:authentication property="principal.username" var="currentUsername" />
                        <c:if test="${comment.user.username eq currentUsername}">
                            <div class="comment-actions">
                                <button class="btn btn-sm btn-primary edit-button" onclick="showEditForm(${comment.id})">Edit</button>
                                <form action="${pageContext.request.contextPath}/comments/delete/${comment.id}" method="post" style="display: inline;">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Sure to delete this comment？')">Delete</button>
                                </form>
                            </div>
                        </c:if>
                    </div>
                    
                    <div class="comment-content" id="content-${comment.id}">
                        ${comment.content}
                    </div>
                    
                    <div class="edit-form" id="edit-form-${comment.id}">
                        <form action="${pageContext.request.contextPath}/comments/edit/${comment.id}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="form-group">
                                <textarea class="form-control" name="content" rows="3" required>${comment.content}</textarea>
                            </div>
                            <button type="submit" class="btn btn-success btn-sm">Save</button>
                            <button type="button" class="btn btn-secondary btn-sm" onclick="hideEditForm(${comment.id})">Cancel</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
            
            <div class="mt-3">
                <a href="${pageContext.request.contextPath}/polls" class="btn btn-secondary">Back to pull page</a>
            </div>
        </sec:authorize>
        
        <sec:authorize access="!hasAnyRole('STUDENT', 'TEACHER')">
            <div class="alert alert-danger">
                <h3>Cannot visit this page</h3>
                <p>Only teacher and student can view comments</p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Back to index</a>
            </div>
        </sec:authorize>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showEditForm(commentId) {
            document.getElementById('content-' + commentId).style.display = 'none';
            document.getElementById('edit-form-' + commentId).style.display = 'block';
        }
        
        function hideEditForm(commentId) {
            document.getElementById('content-' + commentId).style.display = 'block';
            document.getElementById('edit-form-' + commentId).style.display = 'none';
        }
    </script>
</body>
</html>
