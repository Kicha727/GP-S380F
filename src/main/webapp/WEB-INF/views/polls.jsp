<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Polls - MUHK</title>
    
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

        .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            position: relative;
            display: inline-block;
        }

        .page-title::after {
            content: "";
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 4px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: 2px;
        }

        .page-description {
            color: var(--text-muted);
            margin-bottom: 2rem;
            max-width: 600px;
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

        .btn-outline-primary {
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
            padding: 0.6rem 1.2rem;
            font-weight: 500;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            background-color: transparent;
        }

        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(67, 56, 202, 0.3);
        }

        .card {
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            transition: all 0.3s ease;
            background-color: var(--card-bg);
            height: 100%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-title {
            font-weight: 600;
            font-size: 1.25rem;
            color: var(--primary-color);
            margin-bottom: 0.75rem;
        }

        .card-text {
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .card-footer {
            background-color: transparent;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            padding: 1rem 1.5rem;
        }

        .badge {
            padding: 0.5rem 0.75rem;
            border-radius: 0.5rem;
            font-weight: 600;
            font-size: 0.75rem;
        }

        .badge-new {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }

        .badge-popular {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--warning-color);
        }

        .poll-card-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            opacity: 0.1;
            position: absolute;
            top: 1rem;
            right: 1rem;
        }

        .poll-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .poll-meta-item {
            display: flex;
            align-items: center;
            color: var(--text-muted);
            font-size: 0.875rem;
        }

        .poll-meta-item i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }

        .poll-author {
            display: flex;
            align-items: center;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
        }

        .author-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 0.75rem;
        }

        .author-name {
            font-weight: 500;
            color: var(--text-color);
        }

        .author-role {
            font-size: 0.75rem;
            color: var(--text-muted);
        }

        .search-bar {
            margin-bottom: 2rem;
            position: relative;
        }

        .search-input {
            padding: 0.75rem 1rem 0.75rem 3rem;
            border-radius: 0.5rem;
            border: 2px solid var(--border-color);
            width: 100%;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(37, 99, 235, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
        }

        .polls-filter {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .filter-item {
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            background-color: white;
            color: var(--text-muted);
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .filter-item:hover {
            color: var(--primary-color);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .filter-item.active {
            background-color: var(--primary-color);
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            background-color: white;
            border-radius: 1rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .empty-state-icon {
            font-size: 4rem;
            color: var(--border-color);
            margin-bottom: 1rem;
        }

        .empty-state-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        .empty-state-text {
            color: var(--text-muted);
            margin-bottom: 1.5rem;
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

        .create-poll-fab {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            z-index: 1000;
        }

        .create-poll-fab:hover {
            transform: scale(1.1) rotate(45deg);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
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
                <li class="breadcrumb-item active"><i class="fas fa-poll me-1"></i>Polls</li>
            </ol>
        </nav>
        
        <div class="mb-5">
            <h1 class="page-title">Polls</h1>
            <p class="page-description">Participate in polls related to your courses, share your opinions, and see what others think.</p>
        </div>
        
        <!-- Search-->
        <div class="row mb-4">
            <div class="col-md-8">
                <div class="search-bar">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" placeholder="Search polls..." id="searchPoll">
                </div>
            </div>
            <div class="col-md-4 d-flex justify-content-md-end align-items-center">
                <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
                    <a href="/polls/create" class="btn btn-primary">
                        <i class="fas fa-plus me-2"></i>Create New Poll
                    </a>
                </c:if>
            </div>
        </div>

        <c:if test="${polls.isEmpty()}">
            <div class="empty-state">
                <i class="fas fa-poll-h empty-state-icon"></i>
                <h3 class="empty-state-title">No polls available</h3>
                <p class="empty-state-text">There are no polls available at the moment. Check back later or create a new poll.</p>
                <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
                    <a href="/polls/create" class="btn btn-primary">
                        <i class="fas fa-plus me-2"></i>Create First Poll
                    </a>
                </c:if>
            </div>
        </c:if>
        
        <div class="row" id="pollsContainer">
            <c:forEach items="${polls}" var="poll" varStatus="status">
                <div class="col-md-6 col-lg-4 mb-4 poll-item">
                    <div class="card h-100">
                        <div class="card-body position-relative">
                            <i class="fas fa-poll-h poll-card-icon"></i>
                            
                            <!-- Badge based on poll properties -->
                            <c:if test="${status.index < 2}">
                                <span class="badge badge-new mb-2">New</span>
                            </c:if>
                            <c:if test="${poll.options.stream().map(o -> o.getVoteCount()).sum() > 10}">
                                <span class="badge badge-popular mb-2">Popular</span>
                            </c:if>
                            
                            <h5 class="card-title">${poll.question}</h5>
                            
                            <div class="poll-meta">
                                <div class="poll-meta-item">
                                    <i class="fas fa-list-ul"></i>
                                    <span>${poll.options.size()} options</span>
                                </div>
                                <div class="poll-meta-item">
                                    <i class="fas fa-vote-yea"></i>
                                    <span>${poll.options.stream().map(o -> o.getVoteCount()).sum()} votes</span>
                                </div>
                            </div>
                            
                            <!-- Progress for leading option -->
                            <c:forEach items="${poll.options}" var="option" begin="0" end="0">
                                <div class="mb-3">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <small class="text-muted">Leading option</small>
                                        <small class="text-muted">
                                            <c:if test="${poll.options.stream().map(o -> o.getVoteCount()).sum() > 0}">
                                                ${Math.round(option.voteCount * 100.0 / poll.options.stream().map(o -> o.getVoteCount()).sum())}%
                                            </c:if>
                                            <c:if test="${poll.options.stream().map(o -> o.getVoteCount()).sum() == 0}">
                                                0%
                                            </c:if>
                                        </small>
                                    </div>
                                    <div class="progress" style="height: 8px;">
                                        <div class="progress-bar" role="progressbar" 
                                            style="width: ${poll.options.stream().map(o -> o.getVoteCount()).sum() > 0 ? 
                                                option.voteCount * 100 / poll.options.stream().map(o -> o.getVoteCount()).sum() : 0}%" 
                                            aria-valuenow="${option.voteCount}" aria-valuemin="0" 
                                            aria-valuemax="${poll.options.stream().map(o -> o.getVoteCount()).sum()}"></div>
                                    </div>
                                </div>
                            </c:forEach>
                            
                            <!-- Poll author -->
                            <div class="poll-author">
                                <div class="author-avatar">T</div>
                                <div>
                                    <div class="author-name">Teacher</div>
                                    <div class="author-role">Created 3 days ago</div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="/polls/${poll.id}" class="btn btn-outline-primary w-100">
                                <i class="fas fa-eye me-2"></i>View Poll
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <c:if test="${sessionScope.userId != null && sessionScope.userRole == 'TEACHER'}">
            <a href="/polls/create" class="create-poll-fab d-md-none">
                <i class="fas fa-plus"></i>
            </a>
        </c:if>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Navigation and authentication
        document.addEventListener("DOMContentLoaded", function () {
            const user = localStorage.getItem("user");
            const navMenu = document.getElementById("navMenu");
            const authButton = document.getElementById("authButton");

            if (user) {
                navMenu.innerHTML = `
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/lectures"><i class="fas fa-book me-1"></i> Course Material</a></li>
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
            
            // Handle search
            const searchInput = document.getElementById('searchPoll');
            searchInput.addEventListener('input', filterPolls);
            
            // Handle filter buttons
            const filterButtons = document.querySelectorAll('.filter-item');
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Remove active class from all buttons
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    
                    // Add active class to clicked button
                    this.classList.add('active');
                    
                    // Apply filter
                    filterPolls();
                });
            });
            
            function filterPolls() {
                const searchTerm = searchInput.value.toLowerCase();
                const activeFilter = document.querySelector('.filter-item.active').getAttribute('data-filter');
                const polls = document.querySelectorAll('.poll-item');
                
                polls.forEach(poll => {
                    const title = poll.querySelector('.card-title').textContent.toLowerCase();
                    const votes = parseInt(poll.querySelector('.poll-meta-item:nth-child(2) span').textContent);
                    const isNew = poll.querySelector('.badge-new') !== null;
                    const isPopular = poll.querySelector('.badge-popular') !== null;
                    
                    const matchesSearch = title.includes(searchTerm);
                    
                    let matchesFilter = true;
                    if (activeFilter === 'new') {
                        matchesFilter = isNew;
                    } else if (activeFilter === 'popular') {
                        matchesFilter = isPopular;
                    } else if (activeFilter === 'my') {

                        matchesFilter = true;
                    }
                    
                    if (matchesSearch && matchesFilter) {
                        poll.style.display = 'block';
                    } else {
                        poll.style.display = 'none';
                    }
                });
                
                const visiblePolls = document.querySelectorAll('.poll-item[style="display: block;"]');
                const pollsContainer = document.getElementById('pollsContainer');
                
                if (visiblePolls.length === 0 && polls.length > 0) {
                    // if there no results found, will create no results message
                    if (!document.getElementById('noResultsMessage')) {
                        const noResults = document.createElement('div');
                        noResults.id = 'noResultsMessage';
                        noResults.className = 'col-12 text-center py-5';
                        noResults.innerHTML = `
                            <i class="fas fa-search fa-3x text-muted mb-3"></i>
                            <h3>No polls found</h3>
                            <p class="text-muted">No polls match your search criteria. Try a different search term or filter.</p>
                        `;
                        pollsContainer.appendChild(noResults);
                    }
                } else {
                    // Results found, remove "no results" message if it exists
                    const noResultsMessage = document.getElementById('noResultsMessage');
                    if (noResultsMessage) {
                        noResultsMessage.remove();
                    }
                }
            }
        });
    </script>
</body>
</html>