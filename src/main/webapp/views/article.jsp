<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="models.bean.Article, models.bean.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path = request.getContextPath();
    SimpleDateFormat sdf = new SimpleDateFormat("EEEE, dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
    SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
    // Temporary data for testing
    Article article = new Article("1", "Thủ tướng Chính phủ yêu cầu kịp thời chấn chỉnh công tác đấu giá quyền sử dụng đất", "Thời sự", "https://cdnmedia.baotintuc.vn/Upload/DMDnZyELa7xUDTdLsa19w/files/2024/12/1412/dau-gia-141224.jpg", "<p>Công điện gửi Bộ trưởng các Bộ: Tài nguyên và Môi trường, Xây dựng, Tài chính, Tư pháp, Công an; Chủ tịch Ủy ban nhân dân các tỉnh, thành phố trực thuộc Trung ương.</p><p>Công điện nêu: Ngày 21/8/2024, Thủ tướng Chính phủ đã có Công điện số 82/CĐ-TTg chỉ đạo các địa phương kịp thời chấn chỉnh công tác đấu giá quyền sử dụng đất và đã đạt kết quả nhất định, từng bước đưa công tác đấu giá quyền sử dụng đất đi vào nề nếp, góp phần bổ sung nguồn thu cho ngân sách địa phương. Tuy nhiên, công tác tổ chức đấu giá quyền sử dụng đất tại một số địa phương vẫn còn những tồn tại, hạn chế nhất định như hiện tượng người tham gia đấu giá trả giá cao bất thường, có dấu hiệu thổi giá, hoặc thông đồng, cấu kết thao túng giá để trục lợi, gây nhiễu loạn thị trường, ảnh hưởng đến sự phát triển lành mạnh của thị trường bất động sản. Tình trạng này đang thu hút sự quan tâm của dư luận xã hội, có thể tác động tiêu cực đến phát triển kinh tế - xã hội, môi trường đầu tư, kinh doanh và thị trường bất động sản.</p>", new java.util.Date(), "Thủ tướng Chính phủ Phạm Minh Chính vừa ký ban hành Công điện 134/CĐ-TTg ngày 14/12/2024 yêu cầu các bộ liên quan, các địa phương kịp thời chấn chỉnh công tác đấu giá quyền sử dụng đất.");
    ArrayList<Comment> comments = new ArrayList<>();
    comments.add(new Comment("1", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis quod, voluptates, quae, quos quidem quia quibusdam dolorum doloremque nemo voluptatem.", "1", "Tên người dùng", new java.util.Date()));
    comments.add(new Comment("2", "Lorem ipsum dolor sit amet consectetur adipisicing elit.", "1", "Peter Parker", new java.util.Date()));
    comments.add(new Comment("3", "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint similique necessitatibus, et excepturi odio neque minima! Nemo fugiat commodi nulla libero tenetur illo laudantium repellat placeat debitis, in, velit laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, odit aperiam tenetur, doloremque ad corrupti dicta repellat molestias id laborum voluptas, natus nostrum? Repudiandae error pariatur deserunt, repellendus assumenda est?", "1", "John Doe 123", new java.util.Date()));
    ArrayList<Article> relatedArticles = new ArrayList<>();
    relatedArticles.add(new Article("2", "Pháp: Thánh tích Mão gai của Chúa Jesus trở về Nhà thờ Đức Bà", "", "https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/YZmStSDTjb0M07hFJ2gA/files/2024/12/01/mao-gai-131224-1.jpg", "", null, ""));
    relatedArticles.add(new Article("3", "Cơ hội chiêm ngưỡng mưa sao băng Geminids vào rạng sáng 14/12", "", "https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/2014/01/02/19/21/1saobang.jpg", "", null, ""));
    relatedArticles.add(new Article("4", "Bình Định: Liên tiếp xảy ra tình trạng kẹt xe trên đèo An Khê do mưa lớn", "", "https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/rGkvwNpj74Z1EcpzQ6ltA/files/2024/12/tuan5/ket-xe-131224.jpg", "", null, ""));
    relatedArticles.add(new Article("5", "Triển vọng mới cho hợp tác quốc phòng Việt Nam - Bỉ - EU", "", "https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/rGkvwNpj74Z1EcpzQ6ltA/files/2024/12/tuan5/bi1-131224.jpg", "", null, ""));
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
          <h1 id="title" class="w-full text-4xl font-bold font-playfair mb-4">
            <%= article.getTitle() %>
          </h1>
          <div
            class="py-4 flex items-center justify-between border-y border-gray-200 mb-4"
          >
            <div class="[&>span]:text-sm [&>span]:text-gray-700">
              <span id="createdAt" class=""><%= sdf.format(article.getCreatedAt()) %></span>
              <span> | </span>
              <span id="subject" class=""><%= article.getSubjectId() %></span>
            </div>
          </div>
          <p id="introduction" class="w-full font-bold">
            <%= article.getIntroduce() %>
          </p>
          <div
            id="content"
            class="mt-6 pl-24 space-y-4 [&>p]:text-justify font-medium"
          >
            <img
              class="w-fit mx-10 object-cover pb-2"
              src="<%= article.getThumbnail() %>"
              alt="Article Thumbnail"
            />
            <div id="articleContent" class="w-full space-y-4">
              <%= article.getContent() %>
            </div>
            <div class="w-full text-right font-semibold text-gray-500">
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
              <% for (Article relatedArticle : relatedArticles) { %>
              <div class="border-b border-gray-200">
                <img
                  class="w-[120px] object-cover aspect-[4/3]"
                  src="<%= relatedArticle.getThumbnail() %>"
                  alt="<%= relatedArticle.getTitle() %>"
                />
                <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                  <a href="<%= path %>/views/article.jsp?id=<%= relatedArticle.getId() %>">
                    <%= relatedArticle.getTitle() %>
                  </a>
                </h2>
              </div>
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
            <% for (Comment comment : comments) { %>
            <div class="w-full flex gap-4">
              <span
                class="size-9 rounded-full flex-center bg-[#ed1b24] text-xl text-white mt-1"
              >
                <i class="ph-fill ph-user"></i>
              </span>
              <div class="flex-1">
                <div>
                  <span class="font-semibold text-sm"><%= comment.getCreatorId() %></span>
                  <span class="text-gray-500 ml-2 text-[13px] leading-4"><%= sdf2.format(comment.getCreatedAt()) %></span>
                </div>
                <p class="text-sm text-gray-700 text-[13px] leading-[18px]">
                  <%= comment.getContent() %>
                </p>
              </div>
            </div>
            <% } %>
          </div>
        </div>
        <div class="w-[320px] space-y-2">
          <div
            class="h-9 w-full bg-gray-100 border-b-[2px] border-gray-300 flex px-4 items-center uppercase pt-0.5 font-semibold text-[#d21d21] text-sm"
          >
            Gửi bình luận của bạn
          </div>
          <form
            class="flex flex-col gap-3 items-end p-4 pb-3 w-full bg-gray-100"
            action="<%= path %>/sendComment"
            method="POST"
          >
            <textarea
              class="w-full focus:outline-none focus:ring-0 p-2 rounded-sm border focus:border-[#ed1b24]/40 text-sm text-gray-600 resize-none"
              name="comment"
              id="comment"
              placeholder="Nhập bình luận của bạn tại đây..."
              rows="6"
              required
            ></textarea>
            <button
              class="h-7 px-4 bg-[#ed1b24]/80 hover:bg-[#ed1b24]/100 disabled:bg-[#ed1b24]/60 text-sm text-white rounded-sm font-semibold transition-colors"
              type="submit"
            >
              Gửi đi
            </button>
          </form>
        </div>
      </div>
    </main>
  </body>
</html>
