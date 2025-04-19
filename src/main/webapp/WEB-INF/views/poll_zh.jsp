<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>投票: ${poll.question}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    
    <style>
        body {
            min-height: 75rem;
            padding-top: 4.5rem;
        }
        .poll-option {
            padding: 15px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .poll-option:hover {
            background-color: #f8f9fa;
        }
        .poll-option.selected {
            background-color: #cfe2ff;
            border-color: #9ec5fe;
        }
        .comment {
            margin-bottom: 15px;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .progress {
            height: 25px;
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
            <div class="collapse navbar-collapse d-flex justify-content-between align-items-center" id="navbarCollapse">
                <ul class="navbar-nav" id="navMenu"></ul>
                <div class="d-flex align-items-center">
                    <div class="dropdown me-2">
                        <button class="btn btn-outline-light dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-globe"></i> 語言
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="languageDropdown">
                            <li><a class="dropdown-item" href="/polls/${poll.id}">English</a></li>
                            <li><a class="dropdown-item active" href="/polls/${poll.id}/zh">中文</a></li>
                        </ul>
                    </div>
                    <button id="authButton" class="btn btn-outline-success"></button>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="h3 mb-0">${poll.question}</h1>
                    <c:if test="${isTeacher == true}">
                        <form action="/polls/${poll.id}/delete_zh" method="post" onsubmit="return confirm('你確定要刪除此投票嗎？此動作無法撤銷。');">
                            <button type="submit" class="btn btn-sm btn-danger">刪除投票</button>
                        </form>
                    </c:if>
                </div>
            </div>
            <div class="card-body">
                <!-- Poll Options -->
                <form action="/polls/${poll.id}/vote_zh" method="post" id="voteForm">
                    <c:forEach items="${poll.options}" var="option">
                        <div class="poll-option ${userVote == option.id ? 'selected' : ''}" onclick="selectOption(${option.id})">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <input type="radio" name="optionId" id="option_${option.id}" value="${option.id}" 
                                        ${userVote == option.id ? 'checked' : ''} style="margin-right: 10px;">
                                    <label for="option_${option.id}" class="form-check-label">${option.optionText}</label>
                                </div>
                                <div class="text-muted">${option.voteCount} 票</div>
                            </div>
                            <div class="progress mt-2">
                                <div class="progress-bar" role="progressbar" 
                                    style="width: ${poll.options.stream().map(o -> o.getVoteCount()).sum() > 0 ? 
                                        option.voteCount * 100 / poll.options.stream().map(o -> o.getVoteCount()).sum() : 0}%" 
                                    aria-valuenow="${option.voteCount}" aria-valuemin="0" 
                                    aria-valuemax="${poll.options.stream().map(o -> o.getVoteCount()).sum()}">
                                    ${poll.options.stream().map(o -> o.getVoteCount()).sum() > 0 ? 
                                        Math.round(option.voteCount * 100.0 / poll.options.stream().map(o -> o.getVoteCount()).sum()) : 0}%
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <c:if test="${user != null}">
                        <button type="submit" class="btn btn-primary mt-3">投票</button>
                    </c:if>
                    <c:if test="${user == null}">
                        <div class="alert alert-info mt-3">
                            請<a href="/login_zh">登錄</a>參與此投票。
                        </div>
                    </c:if>
                </form>
                
                <!-- Comments Section -->
                <div class="mt-5">
                    <h3>評論</h3>
                    
                    <c:if test="${user != null}">
                        <form action="/polls/${poll.id}/comment_zh" method="post" class="mb-4">
                            <div class="form-group">
                                <textarea name="content" class="form-control" rows="3" placeholder="在此添加你的評論" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">發表評論</button>
                        </form>
                    </c:if>
                    
                    <c:if test="${comments.isEmpty()}">
                        <p class="text-muted">暫無評論。成為第一個評論的人！</p>
                    </c:if>
                    
                    <div class="comments-list">
                        <c:forEach items="${comments}" var="comment">
                            <div class="comment">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <strong>${comment.user.name}</strong>
                                        <c:if test="${comment.user.role == 'TEACHER'}">
                                            <span class="badge bg-primary">教師</span>
                                        </c:if>
                                    </div>
                                    <small class="text-muted">${comment.createdAt}</small>
                                </div>
                                <p class="mt-2">${comment.content}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function selectOption(optionId) {
            document.getElementById('option_' + optionId).checked = true;
            
            // Remove selected class from all options
            document.querySelectorAll('.poll-option').forEach(option => {
                option.classList.remove('selected');
            });
            
            // Add selected class to the clicked option
            document.querySelector('.poll-option:has(#option_' + optionId + ')').classList.add('selected');
        }
        
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const user = localStorage.getItem("user");
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            if (user) {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
                    <li class="nav-item"><a class="nav-link" href="/lectures_zh">課程資料</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls/zh">投票</a></li>
                    <li class="nav-item"><a class="nav-link" href="/personal-info_zh">個人資料</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments_zh">評論</a></li>
                `;
                authButton.textContent = "登出";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/login_zh";
                });
            } else {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/index_zh">首頁</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls/zh">投票</a></li>
                `;
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