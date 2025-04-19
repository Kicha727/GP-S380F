<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Lecture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="mb-4">Upload Lecture Material</h2>

<c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
</c:if>

<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/upload" class="mb-4">
    <div class="mb-3">
        <label for="title" class="form-label">Title:</label>
        <input type="text" class="form-control" id="title" name="title" required />
    </div>

    <div class="mb-3">
        <label for="file" class="form-label">PDF File:</label>
        <input type="file" class="form-control" id="file" name="file" accept="application/pdf" required />
    </div>

    <button type="submit" class="btn btn-primary">Upload</button>
</form>

<a href="/lectures" class="btn btn-outline-secondary">Back to Lectures</a>

</body>
</html>
