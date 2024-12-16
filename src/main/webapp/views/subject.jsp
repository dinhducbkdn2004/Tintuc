<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.bean.Article" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách bài viết</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Danh sách bài viết</h1>
    <div>
        <!-- Phần menu -->
        <nav>
            <a href="home">Trang chủ</a>
            <a href="subject?id=1">Thời sự</a>
            <a href="subject?id=2">Thế giới</a>
            <a href="subject?id=3">Kinh tế</a>
            <a href="subject?id=4">Xã hội</a>
        </nav>
    </div>

    <!-- Danh sách bài viết -->
    <div>
        <%
            List<Article> articles = (List<Article>) request.getAttribute("articles");
            if (articles != null) {
                for (Article article : articles) {
        %>
            <div style="border-bottom: 1px solid gray; margin: 10px 0; padding: 10px;">
                <img src="<%= article.getThumbnail() %>" alt="Thumbnail" width="150" height="100">
                <h3>
                    <a href="article?id=<%= article.getId() %>"><%= article.getTitle() %></a>
                </h3>
                <p><%= article.getIntroduce() %></p>
                <p><em><%= article.getCreatedAt() %></em></p>
            </div>
        <%
                }
            } else {
        %>
            <p>Không có bài viết nào trong chuyên mục này.</p>
        <%
            }
        %>
    </div>
</body>
</html>
