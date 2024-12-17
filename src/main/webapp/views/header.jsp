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
        .flex-center {
          @apply flex items-center justify-center;
        }
      }
    </style>
  </head>
  <body>
    <header class="w-full h-[110px]">
      <div
        class="max-w-[95vw] sm:max-w-[90vw] xl:max-w-[1180px] mx-auto h-full flex justify-between"
      >
        <img
          src="https://cdnstatic.baotintuc.vn/web_images/baotintuc-logo.png?v=100"
          alt="logo"
        />
        <div class="pb-2 h-full flex flex-col justify-between items-end">
          <div class="w-full h-8 flex items-center justify-end gap-4">
            <div
              class="flex items-center gap-1 text-xs text-gray-500 hover:text-sky-700 group transition-all"
            >
              <i class="ph-phone ph-fill"></i>
              <a
                class="font-semibold -mt-0.5 group-hover:underline"
                href="tel:0987654321"
                target="_parent"
                >0987.654.321</a
              >
            </div>
            <div
              class="flex items-center gap-1 text-xs text-gray-500 hover:text-sky-700 group transition-all"
            >
              <i class="ph-bold ph-envelope-simple"></i>
              <a
                class="font-semibold -mt-0.5 group-hover:underline"
                href="mailto:example@email.com"
                target="_parent"
                >example@email.com</a
              >
            </div>
            <%
              if (user != null) {
            %>
            <div
              class="flex items-center gap-1 text-xs text-gray-500 transition-all"
            >
              <i class="ph-bold ph-user"></i>
              <p class="font-semibold -mt-0.5"><%= user.getName() %></p>
              <a
                class="font-semibold -mt-0.5 hover:underline hover:text-[#ed1b24]"
                href="<%= path %>/logout"
                target="_parent"
                >(Đăng xuất)</a
              >
            </div>
            <%
              } else {
            %>
            <div
              class="flex items-center gap-1 text-xs text-gray-500 group transition-all"
            >
              <i class="ph-bold ph-sign-in group-hover:text-[#ed1b24]"></i>
              <a
                class="font-semibold -mt-0.5 hover:underline hover:text-[#ed1b24]"
                href="<%= path %>/views/login.jsp"
                target="_parent"
                >Đăng nhập</a
              >
              <span class="group-hover:text-[#ed1b24] font-bold">/</span>
              <a
                class="font-semibold -mt-0.5 hover:underline hover:text-[#ed1b24]"
                href="<%= path %>/views/register.jsp"
                target="_parent"
                >Đăng ký</a
              >
            </div>
            <%
              }
            %>
          </div>
          <div class="w-[300px]">
            <div class="font-semibold text-sm pb-0.5">Tìm kiếm:</div>
            <div
              class="search-bar w-[300px] h-[30px] px-3 pt-[1px] border border-[#bbb] flex items-center gap-2"
            >
              <input
                class="text-[13px] leading-[16px] flex-1 focus:outline-none focus:ring-0"
                type="text"
                name="searchValue"
                id="searchValue"
                placeholder="Nhập từ khóa tìm kiếm"
                required
              />
              <button
                class="hover:text-[#ed1b24] active:text-[#bd191c] transition-colors"
                onclick="search()"
              >
                <svg
                  stroke="currentColor"
                  fill="currentColor"
                  stroke-width="0"
                  viewBox="0 0 256 256"
                  height="1em"
                  width="1em"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M232.49,215.51,185,168a92.12,92.12,0,1,0-17,17l47.53,47.54a12,12,0,0,0,17-17ZM44,112a68,68,0,1,1,68,68A68.07,68.07,0,0,1,44,112Z"
                  ></path>
                </svg>
              </button>
            </div>
          </div>
        </div>
      </div>
    </header>
    <script>
      const searchInput = document.getElementById("searchValue");

      function search() {
        let searchValue = searchInput.value;
        if (searchValue.trim() === "") {
          alert("Vui lòng nhập từ khóa tìm kiếm!");
        } else {
          window.parent.location.href = "<%= path %>/articles?search=" + searchValue;
        }
      }

      searchInput.addEventListener("keyup", function (event) {
        if (event.key === "Enter") {
          search();
        }
      });
    </script>
  </body>
</html>
