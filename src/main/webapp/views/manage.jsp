<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="models.bean.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path = request.getContextPath();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
    ArrayList<Article> articles = new ArrayList<>();
    Article a1 = new Article("1", "Đại tướng Phan Văn Giang: Cán bộ lãnh đạo cấp cao của Quân đội phải đặc biệt tiêu biểu, thực sự nêu gương", "subject1", "https://cdnthumb.baotintuc.vn/ha_w/600/https@@$$media.baotintuc.vn/Upload/rGkvwNpj74Z1EcpzQ6ltA/files/2024/12/tuan5/quan-doi2-131224.jpg", "Chiều 13/12, tại Hà Nội, Quân ủy Trung ương, Bộ Quốc phòng tổ chức Lễ trao Huân chương tặng cán bộ cấp cao Quân đội nhân dân Việt Nam.", new java.util.Date(), "");
    a1.setSubject("Chính trị");

    Article a2 = new Article("2", "Pháp: Thánh tích Mão gai của Chúa Jesus trở về Nhà thờ Đức Bà", "subject2", "https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/YZmStSDTjb0M07hFJ2gA/files/2024/12/01/mao-gai-131224-1.jpg", "", new java.util.Date(), "");
    a2.setSubject("Xã hội");

    articles.add(a1);
    articles.add(a2);
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
            href="<%= path %>/views/create_article.jsp"
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
              <th class="border border-gray-300 px-4 py-2 w-[180px]">Ngày tạo</th>
              <th class="border border-gray-300 px-4 py-2">Hành động</th>
            </tr>
          </thead>
          <tbody>
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
              <td class="border border-gray-300 px-4 py-1.5">
                <div class="flex-center gap-2">
                    <a class="size-6 flex-center border-2 border-sky-700 text-sky-700 bg-sky-700/10 rounded-full opacity-80 hover:opacity-100 transition-colorss" href="<%= path %>/article/<%= article.getId() %>">
	                    <i class="ph-eye ph-fill"></i>
	                </a>
	                <a class="size-6 flex-center border-2 border-green-700 text-green-700 bg-green-700/10 rounded-full opacity-80 hover:opacity-100 transition-colorss" href="<%= path %>/manage/article/edit?id=<%= article.getId() %>">
	                    <i class="ph-pen ph-fill"></i>
	                </a>
	                <a class="size-6 flex-center border-2 border-red-700 text-red-700 bg-red-700/10 rounded-full opacity-80 hover:opacity-100 transition-colorss" href="<%= path %>/manage/article/delete?id=<%= article.getId() %>">
	                    <i class="ph-trash ph-fill"></i>
	                </a>
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
