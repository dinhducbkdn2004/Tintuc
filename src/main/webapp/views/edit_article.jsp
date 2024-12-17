<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="models.bean.Article, models.bean.Subject" %>
<%@ page import="java.util.ArrayList" %>
<%
    String path = request.getContextPath();
    Article article = (Article) request.getAttribute("article");
    ArrayList<Subject> subjects = (ArrayList<Subject>) request.getAttribute("subjects");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chỉnh sửa bài viết</title>
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
      href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css"
      rel="stylesheet"
    />
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      body {
        font-family: "Open Sans", sans-serif;
      }
      .ql-editor {
        font-family: "Open Sans", sans-serif !important;
        font-size: 14px !important;
        font-weight: 500;
        line-height: 20px;
      }
      .ql-editor h1 {
        font-size: 18px !important;
        font-weight: 600;
        line-height: 24px;
        margin: 4px 0 8px;
      }
      .ql-editor h2 {
        font-size: 17px !important;
        font-weight: 600;
        line-height: 20px;
        margin: 4px 0 6px;
      }
      .ql-editor h3 {
        font-size: 16px !important;
        font-weight: 500;
        line-height: 18px;
        margin: 4px 0 6px;
      }
      .ql-editor p {
        font-size: 14px !important;
        font-weight: 500;
        line-height: 20px;
        margin: 2px 0;
      }
      .ql-editor img {
        max-width: 60% !important;
        width: auto;
        height: auto;
        margin: 12px auto;
        object-fit: scale-down;
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
      <form 
      action="<%= path %>/manage/article/edit"
      method="post"
      class="main-wrapper block"
      onsubmit="submitForm(event)">
        <input type="hidden" name="id" value="<%= article.getId() %>">
        <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
        <div
          class="w-full h-11 bg-gray-100 flex items-center justify-between px-4 pt-1 mb-4"
        >
          <h1 class="uppercase font-semibold text-[#d21d21] text-lg">
            Chỉnh sửa bài viết
          </h1>
          <button
            type="button"
            class="flex-center"
            onclick="window.history.back()"
          >
            <i class="ph-bold ph-x text-gray-800 hover:text-[#d21d21]"></i>
          </button>
        </div>
        <div class="w-full flex gap-4 items-center mb-4">
          <label for="title" class="w-[120px] font-semibold">
            Tiêu đề:
          </label>
          <input
            type="text"
            id="title"
            name="title"
            class="flex-1 border border-gray-300 px-3 py-1.5 text-sm focus:outline-none"
            placeholder="Nhập tiêu đề bài viết..."
            value="<%= article.getTitle() %>"
            required
          />
        </div>
        <div class="w-full flex gap-4 items-center mb-4">
          <label for="subject" class="w-[120px] font-semibold">
            Chuyên mục:
          </label>
          <select
            id="subject"
            name="subject"
            class="flex-1 border border-gray-300 px-3 py-1.5 text-sm focus:outline-none"
            required
          >
            <option value="" disabled hidden>
              Chọn chuyên mục...
            </option>
            <% for (Subject subject : subjects) { %>
              <option value="<%= subject.getId() %>" <%= subject.getId().equals(article.getSubjectId()) ? "selected" : "" %>>
                <%= subject.getName() %>
              </option>
            <% } %>
          </select>
          <label for="thumbnail" class="ml-10 w-[80px] font-semibold">
            Ảnh bìa :
          </label>
          <input
            type="text"
            id="thumbnail"
            name="thumbnail"
            class="flex-1 border border-gray-300 px-3 py-1.5 text-sm focus:outline-none"
            value="<%= article.getThumbnail() %>"
            placeholder="Nhập đường dẫn ảnh bìa..."
            required
          />
          <%-- <input
            type="file"
            id="thumbnail"
            name="thumbnail"
            class="flex-1 border border-gray-300 px-3 py-1.5 text-sm focus:outline-none"
            accept="image/*"
          /> --%>
        </div>
        <div class="w-full flex gap-4 mb-4">
          <label for="introduction" class="w-[120px] font-semibold mt-1">
            Giới thiệu:
          </label>
          <textarea
            class="flex-1 border border-gray-300 p-3 text-sm focus:outline-none resize-none"
            id="introduction"
            name="introduction"
            rows="3"
            placeholder="Nhập giới thiệu bài viết..."
            required
          ><%= article.getIntroduce() %></textarea>
        </div>
        <div class="w-full flex gap-4 mb-4 min-h-[50vh] pb-[38.5px]">
          <label for="content" class="w-[120px] font-semibold mt-1">
            Nội dung: 
          </label>
          <div class="flex-1 ">
            <div class="w-full" id="editor"><%= article.getContent() %></div>
          </div>
        </div>
        <div class="w-full flex gap-4 items-center mt-6 justify-end">
          <button
            type="submit"
            class="w-[120px] h-9 bg-[#d21d21] text-white text-sm font-bold rounded-sm hover:bg-[#ed1b24] transition-colors"
          >
            Cập nhật
          </button>
        </div>
      </form>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.js"></script>
    <script>
      const quill = new Quill("#editor", {
        theme: "snow",
        placeholder: "Nhập nội dung bài viết vào đây...",
      });

      function submitForm(event) {
        event.preventDefault();
        const form = event.target;
        const content = document.createElement("input");
        content.setAttribute("type", "hidden");
        content.setAttribute("name", "content");
        content.value = quill.root.innerHTML;
        form.appendChild(content);
        form.submit();
      }
    </script>
  </body>
</html>
