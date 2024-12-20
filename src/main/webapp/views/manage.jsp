<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="models.bean.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path = request.getContextPath();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
    List<Article> articles = (List<Article>) request.getAttribute("articles");

    if (articles == null) {
        response.sendRedirect(path);
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý bài viết</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
      rel="stylesheet"
    />
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      body {
        font-family: "Open Sans", sans-serif;
      }
      .font-playfair {
        font-family: "Playfair Display", serif;
        font-optical-sizing: auto;
        font-style: normal;
      }
    </style>
    <style type="text/tailwindcss">
      @layer utilities {
        .search-bar > input:focus .search-bar {
          @apply border-[#ed1b24];
        }

        .main-wrapper {
          @apply max-w-[95vw] sm:max-w-[90vw] xl:max-w-[1180px] mx-auto;
        }
        .flex-center {
          @apply flex items-center justify-center;
        }
      }
    </style>
  </head>
  <body>
    <iframe
      class="w-full h-[110px]"
      src="<%= path %>/views/header.jsp"
      frameborder="0"
      loading="eager"
    ></iframe>
    <iframe
      class="w-full h-8 sticky top-[-1px] z-10"
      src="<%= path %>/views/navigation.jsp"
      frameborder="0"
      loading="eager"
    ></iframe>
    <main class="py-4">
      <div class="main-wrapper">
        <div class="flex justify-between items-center mb-4 mt-1">
          <h1 class="text-2xl font-bold">Quản lý bài viết</h1>
          <a
            href="<%= path %>/article/create"
            class="bg-[#d21d21] text-white font-semibold px-4 py-1.5 rounded-sm hover:bg-[#ed1b24] transition-colors"
          >
            Tạo mới
          </a>
        </div>
        <table class="w-full border-collapse border border-gray-300">
          <thead>
            <tr class="bg-gray-100">
              <th class="border border-gray-300 px-4 py-2">ID</th>
              <th class="border border-gray-300 px-4 py-2">Tiêu đề</th>
              <th class="border border-gray-300 px-4 py-2 w-[200px]">Chuyên mục</th>
              <th class="border border-gray-300 px-4 py-2 w-[180px]">Thời gian tạo</th>
              <th class="border border-gray-300 px-4 py-2 w-[120px]">Trang chủ</th>
              <th class="border border-gray-300 px-4 py-2">Hành động</th>
            </tr>
          </thead>
          <tbody>
            <% if (articles.isEmpty()) { %>
              <tr>
                <td class="border border-gray-300 px-4 py-20 text-center text-lg font-semibold text-gray-600" colspan="6">Không có bài viết nào</td>
              </tr>
            <% } %>
            <% for (Article article : articles) { %>
              <tr>
                <td class="border border-gray-300 px-4 py-1.5 text-center"><%= article.getId() %></td>
                <td class="border border-gray-300 px-4 py-1.5">
                  <p class="line-clamp-1">
                    <%= article.getTitle() %>
                  </p>
                </td>
                <td class="border border-gray-300 px-4 py-1.5"><%= article.getSubject() %></td>
                <td class="border border-gray-300 px-4 py-1.5 text-center"><%= sdf.format(article.getCreatedAt()) %></td>
                <td class="border border-gray-300 px-4 py-1.5 text-center">
                  <select
                    name="homePosition"
                    class="border border-gray-200 px-2 py-1 text-sm"
                    onchange="location.href='<%= path %>/manage/home?id=<%= article.getId() %>&position=' + this.value"
                  >
                    <option value="0" <%= article.getPosition() <= 0 ? "selected" : "" %> disabled hidden="true" >Không</option>
                    <option value="1" <%= article.getPosition() == 1 ? "selected" : "" %>>1(*)</option>
                    <option value="2" <%= article.getPosition() == 2 ? "selected" : "" %>>2</option>
                    <option value="3" <%= article.getPosition() == 3 ? "selected" : "" %>>3</option>
                    <option value="4" <%= article.getPosition() == 4 ? "selected" : "" %>>4</option>
                    <option value="5" <%= article.getPosition() == 5 ? "selected" : "" %>>5</option>
                  </select>
                <td class="border border-gray-300 px-4 py-1.5">
                  <div class="flex-center gap-2">
                      <a class="size-6 flex-center border-2 border-sky-700 text-sky-700 bg-sky-700/10 rounded-full opacity-80 hover:opacity-100 transition-colors" href="<%= path %>/article/<%= article.getId() %>">
                        <i class="ph-eye ph-fill"></i>
                    </a>
                    <a class="size-6 flex-center border-2 border-green-700 text-green-700 bg-green-700/10 rounded-full opacity-80 hover:opacity-100 transition-colors" href="<%= path %>/manage/article/edit?id=<%= article.getId() %>">
                        <i class="ph-pen ph-fill"></i>
                    </a>
                    <button class="size-6 flex-center border-2 border-red-700 text-red-700 bg-red-700/10 rounded-full opacity-80 hover:opacity-100 transition-colors"
                      title="Xóa bài viết"
                      onclick="if (confirm('Bạn có chắc chắn muốn xóa bài viết này không?')) location.href='<%= path %>/manage/article/edit?id=<%= article.getId() %>&action=delete'"
                    >
                        <i class="ph-trash ph-fill"></i>
                    </button>
                  </div>
                </td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </main>
  </body>
</html>
