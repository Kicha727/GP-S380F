<!-- material.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>${lecture.title}</title>
</head>
<body>
<h2>${lecture.title}</h2>
<a href="/download/${lecture.id}">下載講義</a>

<h3>留言區</h3>
<ul>
    <c:forEach var="comment" items="${comments}">
        <li><strong>${comment.username}</strong>: ${comment.content}</li>
    </c:forEach>
</ul>

<form action="/lectures/${lecture.id}/comment" method="post">
    <textarea name="content" placeholder="寫下你的留言..."></textarea>
    <button type="submit">送出</button>
</form>
</body>
</html>
