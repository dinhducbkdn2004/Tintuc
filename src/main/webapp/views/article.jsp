<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="models.bean.Article, models.bean.Comment, models.bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path = request.getContextPath();
    String currentUrl = ((HttpServletRequest) request).getRequestURL().toString();
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
    SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
    User user = (User) session.getAttribute("user");
    Article article = (Article) request.getAttribute("article");
    if (article == null) {
        response.sendRedirect(path + "/views/404.jsp");
        return;
    }
   	List<Comment> comments = (List<Comment>) request.getAttribute("comments");
   	List<Article> relatedArticles = (List<Article>) request.getAttribute("relatedArticles");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= article.getTitle() %></title>
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
      .font-playfair {
        font-family: "Playfair Display", serif;
        font-optical-sizing: auto;
        font-style: normal;
      }
      .ql-editor {
        font-family: "Open Sans", sans-serif !important;
        font-size: 16px !important;
        font-weight: 500;
        line-height: 26px;
      }
      .ql-editor h1 {
        font-size: 18px !important;
        font-weight: 600;
        line-height: 28px;
        margin: 4px 0 8px;
      }
      .ql-editor h2 {
        font-size: 18px !important;
        font-weight: 600;
        line-height: 28px;
        margin: 4px 0 6px;
      }
      .ql-editor h3 {
        font-size: 17px !important;
        font-weight: 500;
        line-height: 26px;
        margin: 4px 0 6px;
      }
      .ql-editor p {
        font-size: 16px !important;
        font-weight: 500;
        line-height: 26px;
        margin: 2px 0;
      }
      .ql-editor img, #thumbnail {
        max-width: 85% !important;
        width: auto;
        height: auto;
        margin: 2px auto;
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
    ></iframe>
    <iframe
      class="w-full h-8 sticky top-[-1px] z-10"
      src="<%= path %>/views/navigation.jsp"
    ></iframe>
    <main class="py-4">
      <div class="main-wrapper flex gap-4">
        <section id="home-articles" class="flex-1">
          <h1 id="title" class="w-full text-4xl font-bold font-playfair mb-4">
            <%= article.getTitle() %>
          </h1>
          <div
            class="py-4 flex items-center justify-between border-y border-gray-200 mb-4"
          >
            <div class="[&>span]:text-sm [&>span]:text-gray-700">
              <span id="createdAt" class=""><%= sdf.format(article.getCreatedAt()) %></span>
              <span> | </span>
              <span id="subject" class=""><%= article.getSubject() %></span>
            </div>
            <% if (user != null && user.getUserRole() == User.Role.admin) { %>
                <a
                  href="<%= path %>/manage/article/edit?id=<%= article.getId() %>"
                  class="text-sm text-gray-500 hover:text-[#ed1b24] rounded-full hover:bg-white/70 flex-center transition-colors mr-1"
                  title="Chỉnh sửa bài viết"
                >
                  <i class="ph-fill ph-pencil mr-1"></i>
                  Chỉnh sửa
                </a>
            <% } %>
          </div>
          <p id="introduction" class="w-full font-bold">
            <%= article.getIntroduce() %>
          </p>
          <div
            id="content"
            class="mt-6 pl-24 [&>p]:text-justify font-medium"
          >
            <img
              id="thumbnail"
              src="<%= article.getThumbnail() %>"
              alt="<%= article.getTitle() %>"
            />
            <div id="articleContent" class="w-full space-y-3 ql-editor -mt-6">
              <%= article.getContent() %>
            </div>
            <div class="w-full text-right font-semibold text-gray-500 -mt-12">
              Báo Tin tức
            </div>
            <div class="w-full h-[1.5px] bg-[#ed1b24]"></div>
          </div>
        </section>
        <div class="w-[320px] space-y-3">
          <div class="w-full sticky top-12">
            <div
              class="w-full h-7 bg-[#ed1b24] text-white flex items-center justify-between px-4 mb-2"
            >
              <h1 class="uppercase font-semibold text-sm">Cùng chuyên mục</h1>
              <i class="ph-caret-right ph-bold"></i>
            </div>
            <div
              class="w-full bg-gray-100 px-3 [&>div]:py-3 [&>div]:flex [&>div]:gap-3"
            >
                <% if (relatedArticles != null && relatedArticles.size() > 0) { %>
                  <% for (Article relatedArticle : relatedArticles) { %>
                  <div class="border-b border-gray-200">
                    <img
                    class="w-[120px] object-cover aspect-[4/3]"
                    src="<%= relatedArticle.getThumbnail() %>"
                    alt="article-thumb-<%= relatedArticle.getId() %>"
                    />
                    <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                    <a href="<%= path %>/article/<%= relatedArticle.getId() %>">
                      <%= relatedArticle.getTitle() %>
                    </a>
                    </h2>
                  </div>
                  <% } %>
                <% } else { %>
                  <p class="py-28 text-base text-gray-600 font-semibold text-center">Không có bài viết nào.</p>
                <% } %>
            </div>
          </div>
        </div>
      </div>
      <div class="main-wrapper flex gap-4 mt-6" id="comment-section">
        <div class="w-full space-y-2 flex-1">
          <div
            class="h-9 w-full bg-gray-100 border-b-[2px] border-gray-300 flex px-4 items-center uppercase text-[#d21d21] pt-0.5 font-semibold"
          >
            Ý kiến bạn đọc
          </div>
          <div class="py-5 px-6 w-full bg-gray-100 space-y-6">
            <% if (comments != null && comments.size() > 0) { %>
              <% for (Comment comment : comments) { %>
              <div class="w-full flex gap-4">
                <span
                class="size-9 rounded-full flex-center bg-[#ed1b24] text-xl text-white mt-1"
                >
                  <i class="ph-fill ph-user"></i>
                </span>
                <div class="flex-1">
                  <div class="w-full flex items-center justify-between">
                    <div>
                      <span class="font-semibold text-sm"><%= comment.getCreator() %></span>
                      <span class="text-gray-500 ml-2 text-[13px] leading-4"><%= sdf2.format(comment.getCreatedAt()) %></span>
                  </div>
                  <% if (user != null && (user.getUsername().equals(comment.getCreatorId()) || user.getUserRole() == User.Role.admin)) { %>
                  <button class="size-6 text-gray-500 hover:text-[#ed1b24] rounded-full hover:bg-white/70 flex-center transition-colors translate-x-3"
                  	title="Xóa bình luận"
                    onClick="deleteComment('<%= comment.getCommentID() %>')"
                  >
                    <i class="ph-bold ph-trash"></i>
                  </button>
                  <% } %>
                  </div>
                  <p class="text-sm text-gray-700 text-[13px] leading-[18px]">
                    <%= comment.getContent() %>
                  </p>
                </div>
              </div>
              <% } } else { %>
                  <p class="py-[71px] text-base text-gray-600 font-semibold text-center">Không có bình luận nào.</p>
            <% } %>
          </div>
        </div>
        <div class="w-[320px] space-y-2">
          <div
            class="h-9 w-full bg-gray-100 border-b-[2px] border-gray-300 flex px-4 items-center uppercase pt-0.5 font-semibold text-[#d21d21] text-sm"
          >
            Gửi bình luận của bạn
          </div>
          <% if (user != null) { %>    
            <form
              class="flex flex-col gap-3 items-end p-4 pb-3 w-full bg-gray-100"
              action="<%= path %>/comment"
              method="POST"
            >
              <textarea
                class="w-full focus:outline-none focus:ring-0 p-2 rounded-sm border focus:border-[#ed1b24]/40 text-sm text-gray-600 resize-none"
                name="content"
                id="content"
                placeholder="Nhập bình luận của bạn tại đây..."
                rows="6"
                required
              ></textarea>
              <input type="hidden" name="action" value="add">
              <input type="hidden" name="articleId" value="<%= article.getId() %>">
              <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
              <button
                class="h-7 px-4 bg-[#ed1b24]/80 hover:bg-[#ed1b24]/100 disabled:bg-[#ed1b24]/60 text-sm text-white rounded-sm font-semibold transition-colors"
                type="submit"
              >
                Gửi đi
              </button>
            </form>
          <% } else { %>
            <div class="w-full bg-gray-100 py-[71px] text-center">
              <span class="text-base text-gray-600 font-semibold">
              	<a href="<%= path %>/views/login.jsp?redirect=<%= path + "/article/" + article.getId() %>" class="underline hover:text-[#ed1b24] mr-0.5">Đăng nhập</a>
                <p class="inline">để bình luận</p>
              </span>
            </div>
          <% } %>
        </div>
      </div>
    </main>
    <script>
      function deleteComment(commentId) {
        if (confirm("Bạn có chắc chắn muốn xóa bình luận này không?")) {
          const form = document.createElement('form');
          form.method = 'POST';
          form.action = '<%= path %>/comment';

          const actionInput = document.createElement('input');
          actionInput.type = 'hidden';
          actionInput.name = 'action';
          actionInput.value = 'delete';
          form.appendChild(actionInput);

          const commentIdInput = document.createElement('input');
          commentIdInput.type = 'hidden';
          commentIdInput.name = 'commentID';
          commentIdInput.value = commentId;
          form.appendChild(commentIdInput);

          const articleIdInput = document.createElement('input');
          articleIdInput.type = 'hidden';
          articleIdInput.name = 'articleId';
          articleIdInput.value = '<%= article.getId()%>' ;
          form.appendChild(articleIdInput);

          const csrfTokenInput = document.createElement('input');
          csrfTokenInput.type = 'hidden';
          csrfTokenInput.name = 'csrfToken';
          csrfTokenInput.value = '<%= (String) session.getAttribute("csrfToken") %>';
          form.appendChild(csrfTokenInput);

          document.body.appendChild(form);
          form.submit();
        }
      }
    </script>
  </body>
</html>
