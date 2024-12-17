<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="models.bean.Article" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    List<Article> articles = (List<Article>) request.getAttribute("featuredArticles");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Trang chủ</title>
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
      <div class="main-wrapper flex gap-4">
        <section id="home-articles" class="flex-1">
          <div
            class="w-full h-9 bg-gray-100 flex items-center justify-between px-4"
          >
            <h1 class="uppercase font-semibold text-[#d21d21]">Tin nổi bật</h1>
            <button class="flex-center">
              <i
                class="ph-caret-right ph-bold hover:text-[#d21d21] transition-colors"
              ></i>
            </button>
          </div>
          <div class="w-full flex gap-4 mt-2">
            <div
              class="w-[280px] bg-gray-100 px-3 [&>div]:py-3 [&>div]:flex [&>div]:gap-3"
            >
              <% if (articles != null && !articles.isEmpty()) { %>
                <% for (int i = 1; i < articles.size(); i++) { %>
                  <div class="border-b border-gray-200">
                    <img
                      class="w-[120px] object-cover aspect-[4/3]"
                      src="<%= articles.get(i).getThumbnail() %>"
                      alt="<%= articles.get(i).getTitle() %>"
                    />
                    <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                      <a href="<%= path %>/views/article.jsp?id=<%= articles.get(i).getId() %>">
                        <%= articles.get(i).getTitle() %>
                      </a>
                    </h2>
                  </div>
                <% } %>
              <% } else { %>
                <p>Không có bài viết nổi bật nào.</p>
              <% } %>
            </div>
            <% if (articles != null && !articles.isEmpty()) { %>
              <div class="flex-1 h-10 space-y-2">
                <img
                  class="w-full object-cover aspect-[5/3]"
                  src="<%= articles.get(0).getThumbnail() %>"
                  alt="<%= articles.get(0).getTitle() %>"
                />
                <h2 class="font-playfair text-2xl font-bold">
                  <a href="<%= path %>/views/article.jsp?id=<%= articles.get(0).getId() %>">
                    <%= articles.get(0).getTitle() %>
                  </a>
                </h2>
                <p class="text-sm text-gray-600">
                  <%= articles.get(0).getIntroduce() %>
                </p>
              </div>
            <% } %>
          </div>
        </section>
        <div class="w-[280px] [&>img]:object-cover space-y-3">
          <img
            src="https://cdnmedia.baotintuc.vn/Upload/QKrAM3u3JmfSk084HTqfEg/files/2020/12/docbaogiay-DHD.jpg"
            alt="banner-1"
          />
          <img
            src="https://dut.udn.vn/portals/_default/skins/dhbk/img/front/logo.png"
            alt="banner-2"
          />
          <img
            src="https://dut.udn.vn/Images/Slides/Slider_KhoaCNTT_KN45nam.jpg"
            alt="banner-3"
          />
          <img
            src="https://baomoi-static.bmcdn.me/events/banner_hcm_02-min.png"
            alt="banner-4"
          />
        </div>
      </div>
    </main>
  </body>
</html>

