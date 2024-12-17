<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
    String path = request.getContextPath();
    String redirectUrl = request.getParameter("redirect");
    if (redirectUrl == null || redirectUrl.isEmpty()) {
        redirectUrl = path;
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập</title>
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
    <link
      href="https://cdn.jsdelivr.net/npm/phosphor-icons@1.4.2/src/css/icons.min.css"
      rel="stylesheet"
    />
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
    <main class="pt-2 pb-4 h-[calc(100vh-150px)]">
      <div class="main-wrapper flex-center h-full">
        <div
          class="card w-[400px] max-h-[90%] max-w-[90vw] sm:max-w-[70vw] bg-white shadow-lg border border-gray-100 rounded py-6 px-8"
        >
          <h1
            class="text-2xl font-extrabold font-playfair text-center text-[#ed1b24] mt-2"
          >
            Chào mừng quay trở lại
          </h1>
          <p class="text-xs text-gray-700 text-center mt-0.5 leading-3">
            Đăng nhập để truy cập đầy đủ các chức năng của trang web
          </p>

          <form
            class="block w-full space-y-4 mt-6"
            action="<%= path %>/login"
            method="post"
          >
            <div class="space-y-1">
              <label for="username" class="text-sm font-semibold text-gray-700"
                >Tên đăng nhập</label
              >
              <input
                id="username"
                name="username"
                type="text"
                class="w-full border border-gray-200 rounded p-2 text-sm"
                placeholder="Nhập tên đăng nhập"
              />
            </div>
            <div class="space-y-1">
              <label for="password" class="text-sm font-semibold text-gray-700"
                >Mật khẩu</label
              >
              <input
                id="password"
                name="password"
                type="password"
                class="w-full border border-gray-200 rounded p-2 text-sm"
                placeholder="Nhập mật khẩu"
                required
              />
            </div>
            <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
            <input type="hidden" name="redirect" value="<%= redirectUrl %>">
            <div class="flex justify-between items-center">
              <div class="flex items-center">
                <div class="relative">
                  <i
                    class="ph-check ph-bold text-[8px] text-white absolute top-[7px] left-[2px] pointer-events-none"
                  ></i>
                  <input
                    id="remember"
                    name="remember"
                    type="checkbox"
                    class="rounded-sm size-3 cursor-pointer border bg-white border-[#ed1b24] focus:ring-red-200 appearance-none checked:bg-[#ed1b24] checked:border-transparent checked:text-white checked:focus:ring-red-200 transition-all"
                  />
                </div>

                <label
                  for="remember"
                  class="text-xs text-gray-700 font-semibold ml-2 cursor-pointer"
                  >Ghi nhớ đăng nhập</label
                >
              </div>
              <!-- <a
                href="forgot-password.html"
                class="text-xs text-[#ed1b24] font-semibold hover:underline"
                >Quên mật khẩu?</a
              > -->
            </div>
            <button
              type="submit"
              class="w-full bg-[#ed1b24] hover:bg-[#c9131c] text-white font-semibold text-sm py-2 rounded disabled:bg-[#ed1b24]/70 transition-colors"
            >
              Đăng nhập
            </button>
          </form>
          <div class="flex items-center justify-center mt-3">
            <span class="text-sm text-gray-700">Chưa có tài khoản?</span>
            <a
              href="<%= path %>/views/register.jsp"
              class="text-[#ed1b24] font-semibold text-sm ml-1 hover:underline"
              >Đăng ký ngay.</a
            >
          </div>
          <c:if test="${not empty errorMessage}">
            <p class="error text-[13px] text-red-500 text-center px-2 mt-4 leading-4">
              ${errorMessage}
            </p>
          </c:if>
        </div>
      </div>
    </main>
  </body>
</html>