<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poll: ${poll.question} - MUHK</title>
    
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
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
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

        .poll-container {
            max-width: 900px;
            margin: 0 auto;
        }

        .card {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: var(--card-bg);
            margin-bottom: 2rem;
            transition: all 0.3s ease;
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

        .poll-stats {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            background-color: rgba(37, 99, 235, 0.05);
            padding: 1rem;
            border-radius: 0.5rem;
        }

        .stat-item {
            text-align: center;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            display: block;
        }

        .stat-label {
            font-size: 0.875rem;
            color: var(--text-muted);
        }

        .poll-option {
            padding: 1.25rem;
            margin-bottom: 1rem;
            border: 2px solid var(--border-color);
            border-radius: 0.75rem;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .poll-option:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-color: rgba(37, 99, 235, 0.3);
        }

        .poll-option.selected {
            background-color: rgba(37, 99, 235, 0.05);
            border-color: var(--primary-color);
        }

        .poll-option-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
        }

        .option-text {
            font-weight: 600;
            font-size: 1.1rem;
            margin-left: 0.5rem;
        }

        .option-votes {
            background-color: rgba(37, 99, 235, 0.1);
            color: var(--primary-color);
            padding: 0.35rem 0.75rem;
            border-radius: 2rem;
            font-weight: 600;
            font-size: 0.875rem;
            display: flex;
            align-items: center;
        }

        .progress {
            height: 12px;
            background-color: var(--border-color);
            border-radius: 1rem;
            overflow: hidden;
        }

        .progress-bar {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: 1rem;
            transition: width 0.5s ease;
        }

        .option-percentage {
            font-weight: 600;
            font-size: 0.875rem;
            color: var(--primary-color);
            margin-top: 0.5rem;
            text-align: right;
        }

        .vote-message {
            margin: 1.5rem 0;
            padding: 1rem;
            border-radius: 0.5rem;
            font-weight: 500;
        }

        .vote-message.success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
        }

        .vote-message.info {
            background-color: rgba(37, 99, 235, 0.1);
            color: var(--primary-color);
            border-left: 4px solid var(--primary-color);
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
            margin: 2rem 0 1rem;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: "";
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 30px;
            height: 3px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
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
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .comment-form {
            margin-bottom: 2rem;
            background-color: var(--card-bg);
            padding: 1.5rem;
            border-radius: 0.75rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
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

        .comment {
            margin-bottom: 1.5rem;
            padding: 1.5rem;
            border-radius: 0.75rem;
            background-color: var(--card-bg);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            position: relative;
        }

        .comment:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }

        .comment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
        }

        .comment-user {
            display: flex;
            align-items: center;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 0.75rem;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }

        .comment-username {
            font-weight: 600;
            color: var(--text-color);
        }

        .badge-teacher {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 0.35rem 0.75rem;
            border-radius: 2rem;
            font-weight: 600;
            font-size: 0.75rem;
            margin-left: 0.5rem;
        }

        .badge-user {
            background-color: rgba(37, 99, 235, 0.1);
            color: var(--primary-color);
            padding: 0.35rem 0.75rem;
            border-radius: 2rem;
            font-weight: 600;
            font-size: 0.75rem;
            margin-left: 0.5rem;
        }

        .comment-time {
            color: var(--text-muted);
            font-size: 0.875rem;
        }

        .comment-content {
            color: var(--text-color);
            line-height: 1.6;
        }

        .no-comments {
            text-align: center;
            padding: 2rem;
            background-color: var(--card-bg);
            border-radius: 0.75rem;
            color: var(--text-muted);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .no-comments i {
            font-size: 3rem;
            color: var(--border-color);
            margin-bottom: 1rem;
            display: block;
        }

        .login-alert {
            background-color: rgba(37, 99, 235, 0.1);
            border-left: 4px solid var(--primary-color);
            padding: 1rem;
            border-radius: 0 0.5rem 0.5rem 0;
            margin: 1.5rem 0;
        }

        .login-alert a {
            color: var(--primary-color);
            font-weight: 600;
            text-decoration: none;
        }

        .login-alert a:hover {
            text-decoration: underline;
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

        /* Animation for newly selected option */
        @keyframes selectPulse {
            0% { background-color: rgba(37, 99, 235, 0.1); }
            50% { background-color: rgba(37, 99, 235, 0.2); }
            100% { background-color: rgba(37, 99, 235, 0.1); }
        }

        .poll-option.selected-animation {
            animation: selectPulse 1s ease-in-out;
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
        </div>
    </nav>

    <div class="container poll-container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/"><i class="fas fa-home me-1"></i>Home</a></li>
                <li class="breadcrumb-item"><a href="/polls"><i class="fas fa-poll me-1"></i>Polls</a></li>
                <li class="breadcrumb-item active"><i class="fas fa-vote-yea me-1"></i>Current Poll</li>
            </ol>
        </nav>
        
        <div class="card shadow">
            <div class="card-header">
                <h1 class="h3 mb-0"><i class="fas fa-question-circle me-2"></i>${poll.question}</h1>
            </div>
            <div class="card-body">
                <!-- Poll Stats -->
                <div class="poll-stats">
                    <div class="stat-item">
                        <span class="stat-value">${poll.options.size()}</span>
                        <span class="stat-label">Options</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-value">${poll.options.stream().map(o -> o.getVoteCount()).sum()}</span>
                        <span class="stat-label">Total Votes</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-value">${comments.size()}</span>
                        <span class="stat-label">Comments</span>
                    </div>
                </div>
                
                <!-- Poll Options -->
                <form action="/polls/${poll.id}/vote" method="post" id="voteForm">
                    <c:forEach items="${poll.options}" var="option">
                        <div class="poll-option ${userVote == option.id ? 'selected' : ''}" onclick="selectOption(${option.id})">
                            <div class="poll-option-header">
                                <div>
                                    <input type="radio" name="optionId" id="option_${option.id}" value="${option.id}" 
                                        ${userVote == option.id ? 'checked' : ''} class="form-check-input">
                                    <span class="option-text">${option.optionText}</span>
                                </div>
                                <div class="option-votes">
                                    <i class="fas fa-vote-yea me-2"></i> ${option.voteCount}
                                </div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" 
                                    style="width: ${poll.options.stream().map(o -> o.getVoteCount()).sum() > 0 ? 
                                        option.voteCount * 100 / poll.options.stream().map(o -> o.getVoteCount()).sum() : 0}%" 
                                    aria-valuenow="${option.voteCount}" aria-valuemin="0" 
                                    aria-valuemax="${poll.options.stream().map(o -> o.getVoteCount()).sum()}"></div>
                            </div>
                            <div class="option-percentage">
                                ${poll.options.stream().map(o -> o.getVoteCount()).sum() > 0 ? 
                                    Math.round(option.voteCount * 100.0 / poll.options.stream().map(o -> o.getVoteCount()).sum()) : 0}%
                            </div>
                        </div>
                    </c:forEach>
                    
                    <c:if test="${userVote != null}">
                        <div class="vote-message success">
                            <i class="fas fa-check-circle me-2"></i> You have already voted in this poll. You can change your vote by selecting a different option.
                        </div>
                    </c:if>
                    
                    <c:if test="${user != null}">
                        <button type="submit" class="btn btn-primary mt-3">
                            <i class="fas fa-vote-yea me-2"></i> Submit Vote
                        </button>
                    </c:if>
                    <c:if test="${user == null}">
                        <div class="login-alert">
                            <i class="fas fa-info-circle me-2"></i> Please <a href="/login">login</a> to vote in this poll and join the discussion.
                        </div>
                    </c:if>
                </form>
                
                <!-- Comments Section -->
                <h2 class="section-title"><i class="fas fa-comments me-2"></i>Discussion</h2>
                
                <c:if test="${user != null}">
                    <div class="comment-form">
                        <form action="/polls/${poll.id}/comment" method="post">
                            <div class="mb-3">
                                <label for="commentContent" class="form-label">Add your thoughts about this poll</label>
                                <textarea id="commentContent" name="content" class="form-control" rows="3" placeholder="What do you think about this poll?" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane me-2"></i> Post Comment
                            </button>
                        </form>
                    </div>
                </c:if>
                
                <c:if test="${comments.isEmpty()}">
                    <div class="no-comments">
                        <i class="fas fa-comment-slash"></i>
                        <p>No comments yet. Be the first to share your thoughts!</p>
                    </div>
                </c:if>
                
                <div class="comments-list">
                    <c:forEach items="${comments}" var="comment">
                        <div class="comment">
                            <div class="comment-header">
                                <div class="comment-user">
                                    <div class="user-avatar">
                                        ${comment.user.name.charAt(0)}
                                    </div>
                                    <div>
                                        <span class="comment-username">${comment.user.name}</span>
                                        <c:if test="${comment.user.role == 'TEACHER'}">
                                            <span class="badge-teacher"><i class="fas fa-chalkboard-teacher me-1"></i>Teacher</span>
                                        </c:if>
                                        <c:if test="${comment.user.role == 'STUDENT'}">
                                            <span class="badge-user"><i class="fas fa-user-graduate me-1"></i>Student</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="comment-time">
                                    <i class="far fa-clock me-1"></i>${comment.createdAt}
                                </div>
                            </div>
                            <div class="comment-content">
                                ${comment.content}
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function selectOption(optionId) {
            document.getElementById('option_' + optionId).checked = true;
            
            // Remove selected class from all options
            document.querySelectorAll('.poll-option').forEach(option => {
                option.classList.remove('selected');
                option.classList.remove('selected-animation');
            });
            
            // Add selected class and animation to the clicked option
            const selectedOption = document.querySelector('.poll-option:has(#option_' + optionId + ')');
            selectedOption.classList.add('selected');
            selectedOption.classList.add('selected-animation');
        }
        
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const user = localStorage.getItem("user");
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            if (user) {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/lectures"><i class="fas fa-book me-1"></i> Course Materials</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls"><i class="fas fa-poll me-1"></i> Polls</a></li>
                    <li class="nav-item"><a class="nav-link" href="/personal-info"><i class="fas fa-user me-1"></i> Personal Info</a></li>
                    <li class="nav-item"><a class="nav-link" href="/comments"><i class="fas fa-comments me-1"></i> Comments</a></li>
                `;
                authButton.textContent = "Logout";
                authButton.classList.add("btn-danger");
                authButton.addEventListener("click", function () {
                    localStorage.removeItem("user");
                    window.location.href = "/login";
                });
            } else {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/polls"><i class="fas fa-poll me-1"></i> Polls</a></li>
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