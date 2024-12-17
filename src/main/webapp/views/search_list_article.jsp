<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="models.bean.Article"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy, HH:mm", new java.util.Locale("vi", "VN"));
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	String searchValue = (String) request.getParameter("search");
	int pageNumber = 1;
	try {
		pageNumber = Integer.parseInt((String) request.getAttribute("pageNumber"));
	} catch (Exception e) {
		pageNumber = 1;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Kết quả tìm kiếm cho: "<%=searchValue%>"
</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap"
	rel="stylesheet" />
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
	<iframe class="w-full h-[110px]" src="<%=path%>/views/header.jsp"></iframe>
	<iframe class="w-full h-8 sticky top-[-1px] z-10"
		src="<%=path%>/views/navigation.jsp"></iframe>
	<main class="py-6">
		<div class="main-wrapper flex gap-4">
			<section id="home-articles" class="flex-1">
				<div
					class="w-full h-9 bg-gray-100 flex items-center justify-between px-4">
					<h1 class="uppercase font-semibold text-[#d21d21] line-clamp-1">
						Kết quả tìm kiếm cho <i>"<%=searchValue%>"</i>
					</h1>
					<span class="text-sm text-gray-600"> Trang <%=pageNumber%></span>
				</div>
				<div class="w-full flex flex-col gap-4 mt-2">
					<%
					if (articles == null || articles.size() < 1) {
					%>
					<div
						class="flex-center gap-4 border border-gray-200 bg-slate-50 px-4 py-20">
						<h2
							class="font-semibold text-lg leading-6 line-clamp-2 mb-1 text-gray-600 text-center">
							Không có bài viết nào</h2>
					</div>
					<%
					} else {
					%>
					<%
					for (Article article : articles) {
					%>
					<div class="flex gap-4 border border-gray-200 bg-slate-50 p-4">
						<img class="h-[140px] aspect-[4/3] object-cover"
							src="<%=article.getThumbnail()%>" alt="banner" />
						<div class="flex-1 h-[140px] overflow-hidden">
							<span class="text-sm text-gray-500"><%=article.getSubject()%>|
								<%=sdf.format(article.getCreatedAt())%> </span>
							<h2 class="font-semibold text-lg leading-6 line-clamp-2 mb-1">
								<a href="<%=path%>/article/<%=article.getId()%>"><%=article.getTitle()%></a>
							</h2>
							<p class="text-sm text-gray-500 line-clamp-3">
								<%=article.getIntroduce()%>
							</p>
						</div>
					</div>
					<% } } %>
					<% if (articles != null && articles.size() == 10) { %>
					<div class="flex-center px-4 py-4">
						<a
							href="<%=path%>/articles?search=<%=searchValue%>&page=<%=pageNumber + 1%>"
							class="font-semibold bg-[#d21d21]/90 hover:bg-[#d21d21] text-white px-4 py-1.5 transition-colors">
							Xem thêm
						</a>
					</div>
					<%}%>
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

