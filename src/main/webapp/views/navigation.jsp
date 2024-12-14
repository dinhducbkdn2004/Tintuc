<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="models.bean.User" %>
<%
    String path = request.getContextPath();
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
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
    <nav class="w-full h-8 bg-[#ed1b24] text-white">
      <div
        class="max-w-[95vw] sm:max-w-[90vw] xl:max-w-[1180px] mx-auto h-full flex items-center gap-1 [&>a>span]:uppercase [&>a>span]:font-bold [&>a>span]:text-xs [&>a>span]:px-2 [&>a>span]:transition-all"
      >
        <a href="<%= path %>" target="_parent">
          <span class="uppercase font-bold text-xs px-2 hover:text-amber-100 translate-y-[-1px]">
            <span class="inline-block mr-1 translate-y-[2px]">
              <i class="ph-fill ph-house text-sm"></i>
            </span>
            Trang chủ
          </span>
        </a>
        <a href="<%= path %>/views/thoisu" target="_parent">
          <span class="hover:text-amber-100">Thời sự</span>
        </a>
        <a href="<%= path %>/views/thegioi" target="_parent">
          <span class="hover:text-amber-100">Thế giới</span>
        </a>
        <a href="<%= path %>/views/kinhte" target="_parent">
          <span class="hover:text-amber-100">Kinh tế</span>
        </a>
        <a href="<%= path %>/views/xahoi" target="_parent">
          <span class="hover:text-amber-100">Xã hội</span>
        </a>
        <a href="<%= path %>/views/phapluat" target="_parent">
          <span class="hover:text-amber-100">Pháp luật</span>
        </a>
        <a href="<%= path %>/views/vanhoa" target="_parent">
          <span class="hover:text-amber-100">Văn hóa</span>
        </a>
        <a href="<%= path %>/views/giaoduc" target="_parent">
          <span class="hover:text-amber-100">Giáo dục</span>
        </a>
        <a href="<%= path %>/views/thethao" target="_parent">
          <span class="hover:text-amber-100">Thể thao</span>
        </a>
        <a href="<%= path %>/views/quansu" target="_parent">
          <span class="hover:text-amber-100">Quân sự</span>
        </a>
        <a href="<%= path %>/views/khoahoc" target="_parent">
          <span class="hover:text-amber-100">Khoa học - Công nghệ</span>
        </a>
        <a href="<%= path %>/views/yte" target="_parent">
          <span class="hover:text-amber-100">Y tế</span>
        </a>
        <% if (user != null && user.getUserRole() == User.Role.admin) { %>
            <div class="h-6 w-[1px] bg-white/50 mx-1"></div>
            <a href="<%= path %>/views/manage.html" target="_parent">
              <span
                class="uppercase font-bold text-xs px-2 hover:text-amber-100 translate-y-[-1px]"
              >
                <span class="inline-block mr-1 translate-y-[2px]">
                  <i class="ph ph-gear text-sm"></i>
                </span>
                Trang quản lý
              </span>
            </a>
        <% } %>
      </div>
    </nav>
  </body>
</html>
