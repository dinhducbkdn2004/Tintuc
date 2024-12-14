<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%
    String path = request.getContextPath();
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
            Thủ tướng Chính phủ yêu cầu kịp thời chấn chỉnh công tác đấu giá
            quyền sử dụng đất
          </h1>
          <div
            class="py-4 flex items-center justify-between border-y border-gray-200 mb-4"
          >
            <div class="[&>span]:text-sm [&>span]:text-gray-700">
              <span id="createdAt" class="">Thứ tư, 15/12/2024, 10:00</span>
              <span> | </span>
              <span id="subject" class="">Thời sự</span>
            </div>
          </div>
          <p id="introduction" class="w-full font-bold">
            Thủ tướng Chính phủ Phạm Minh Chính vừa ký ban hành Công điện
            134/CĐ-TTg ngày 14/12/2024 yêu cầu các bộ liên quan, các địa phương
            kịp thời chấn chỉnh công tác đấu giá quyền sử dụng đất.
          </p>
          <div
            id="content"
            class="mt-6 pl-24 space-y-4 [&>p]:text-justify font-medium"
          >
            <img
              class="w-fit mx-10 object-cover pb-2"
              src="https://cdnmedia.baotintuc.vn/Upload/DMDnZyELa7xUDTdLsa19w/files/2024/12/1412/dau-gia-141224.jpg"
              alt="Đấu giá đất tại huyện Mê Linh (Hà Nội). Ảnh: Minh Nghĩa/TTXVN"
            />
            <p>
              Công điện gửi Bộ trưởng các Bộ: Tài nguyên và Môi trường, Xây
              dựng, Tài chính, Tư pháp, Công an; Chủ tịch Ủy ban nhân dân các
              tỉnh, thành phố trực thuộc Trung ương.
            </p>
            <p>
              Công điện nêu: Ngày 21/8/2024, Thủ tướng Chính phủ đã có Công điện
              số 82/CĐ-TTg chỉ đạo các địa phương kịp thời chấn chỉnh công tác
              đấu giá quyền sử dụng đất và đã đạt kết quả nhất định, từng bước
              đưa công tác đấu giá quyền sử dụng đất đi vào nề nếp, góp phần bổ
              sung nguồn thu cho ngân sách địa phương. Tuy nhiên, công tác tổ
              chức đấu giá quyền sử dụng đất tại một số địa phương vẫn còn những
              tồn tại, hạn chế nhất định như hiện tượng người tham gia đấu giá
              trả giá cao bất thường, có dấu hiệu thổi giá, hoặc thông đồng, cấu
              kết thao túng giá để trục lợi, gây nhiễu loạn thị trường, ảnh
              hưởng đến sự phát triển lành mạnh của thị trường bất động sản.
              Tình trạng này đang thu hút sự quan tâm của dư luận xã hội, có thể
              tác động tiêu cực đến phát triển kinh tế - xã hội, môi trường đầu
              tư, kinh doanh và thị trường bất động sản.
            </p>
            <p>
              Để nâng cao hiệu lực, hiệu quả công tác đấu giá quyền sử dụng đất,
              góp phần lành mạnh hóa thị trường bất động sản, cải thiện môi
              trường đầu tư, kinh doanh, thúc đẩy phát triển kinh tế - xã hội,
              Thủ tướng Chính phủ yêu cầu Chủ tịch Ủy ban nhân dân các tỉnh,
              thành phố trực thuộc Trung ương chỉ đạo các cơ quan, đơn vị chức
              năng rà soát công tác tổ chức đấu giá quyền sử dụng đất trên địa
              bàn đảm bảo đúng pháp luật, công khai, minh bạch; kịp thời phát
              hiện, xử lý nghiêm các trường hợp vi phạm các quy định của pháp
              luật trong đấu giá quyền sử dụng đất, ngăn chặn hành vi lợi dụng
              đấu giá quyền sử dụng đất để trục lợi, gây nhiễu loạn thị trường.
            </p>
            <p>
              Trong đó tập trung thực hiện các giải pháp sau: Tổ chức công khai
              quy hoạch, kế hoạch sử dụng đất, quy hoạch xây dựng, quy hoạch đô
              thị khu vực tổ chức đấu giá quyền sử dụng đất và các khu vực lân
              cận; có biện pháp bảo đảm nguồn cung bất động sản nhà ở, đất ở phù
              hợp với khả năng tiếp cận và thanh toán của đại đa số người dân có
              nhu cầu, khắc phục tình trạng mất cân đối cung - cầu trên thị
              trường bất động sản.
            </p>
            <p>
              Trước khi xác định giá khởi điểm theo bảng giá đất phục vụ công
              tác đấu giá quyền sử dụng đất phải tiến hành rà soát, điều chỉnh,
              bổ sung giá đất tương ứng trong bảng giá đất tại khu vực, vị trí
              tổ chức đấu giá theo quy định của pháp luật về đất đai, bảo đảm
              giá khởi điểm đưa ra đấu giá phải phù hợp với điều kiện cơ sở hạ
              tầng đã đầu tư và mặt bằng giá đất thực tế tại khu vực tổ chức đấu
              giá.
            </p>
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
              <div class="border-b border-gray-200">
                <img
                  class="w-[120px] object-cover aspect-[4/3]"
                  src="https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/YZmStSDTjb0M07hFJ2gA/files/2024/12/01/mao-gai-131224-1.jpg"
                  alt="Pháp: Thánh tích Mão gai của Chúa Jesus trở về Nhà thờ Đức Bà"
                />
                <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                  <a href="#"
                    >Pháp: Thánh tích Mão gai của Chúa Jesus trở về Nhà thờ Đức
                    Bà Nhà</a
                  >
                </h2>
              </div>
              <div class="border-b border-gray-200">
                <img
                  class="w-[120px] object-cover aspect-[4/3]"
                  src="https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/2014/01/02/19/21/1saobang.jpg"
                  alt="Cơ hội chiêm ngưỡng mưa sao băng Geminids vào rạng sáng 14/12"
                />
                <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                  <a href="#"
                    >Cơ hội chiêm ngưỡng mưa sao băng Geminids vào rạng sáng
                    14/12</a
                  >
                </h2>
              </div>
              <div class="border-b border-gray-200">
                <img
                  class="w-[120px] object-cover aspect-[4/3]"
                  src="https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/rGkvwNpj74Z1EcpzQ6ltA/files/2024/12/tuan5/ket-xe-131224.jpg"
                  alt="Bình Định: Liên tiếp xảy ra tình trạng kẹt xe trên đèo An
                  Khê do mưa lớn"
                />
                <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                  <a href="#"
                    >Bình Định: Liên tiếp xảy ra tình trạng kẹt xe trên đèo An
                    Khê do mưa lớn</a
                  >
                </h2>
              </div>
              <div class="">
                <img
                  class="w-[120px] object-cover aspect-[4/3]"
                  src="https://cdnthumb.baotintuc.vn/ha_w/300/https@@$$media.baotintuc.vn/Upload/rGkvwNpj74Z1EcpzQ6ltA/files/2024/12/tuan5/bi1-131224.jpg"
                  alt="Triển vọng mới cho hợp tác quốc phòng Việt Nam - Bỉ - EU"
                />
                <h2 class="text-sm leading-[18px] font-semibold line-clamp-5">
                  <a href="#"
                    >Triển vọng mới cho hợp tác quốc phòng Việt Nam - Bỉ - EU</a
                  >
                </h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
