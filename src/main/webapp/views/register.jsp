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
    <title>Đăng ký tài khoản</title>
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

      .card {
        background-image: url("./nnnoise.svg");
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
      src="./header.jsp"
      frameborder="0"
      loading="eager"
    ></iframe>
    <iframe
      class="w-full h-8 sticky top-[-1px] z-10"
      src="./navigation.jsp"
      frameborder="0"
      loading="eager"
    ></iframe>
    <main class="h-[calc(100vh-150px)]">
      <div class="main-wrapper flex-center h-full">
        <div
          class="card w-[400px] max-h-[90%] max-w-[95vw] sm:max-w-[70vw] bg-white shadow-lg border border-gray-100 rounded py-6 px-8"
        >
          <h1
            class="text-2xl font-extrabold font-playfair text-center text-[#ed1b24]"
          >
            Tạo tài khoản mới
          </h1>

          <form
            class="block w-full space-y-3 mt-4"
            action="LoginServlet"
            method="post"
          >
            <div class="space-y-1">
              <label for="name" class="text-sm font-semibold text-gray-700"
                >Họ và tên
                <span class="text-[#ed1b24]">*</span>
              </label>
              <input
                id="name"
                name="name"
                type="text"
                class="w-full border border-gray-200 rounded p-2 text-sm"
                placeholder="Nhập tên của bạn"
                required
              />
            </div>
            <div class="space-y-1">
              <label for="username" class="text-sm font-semibold text-gray-700"
                >Tên đăng nhập <span class="text-[#ed1b24]">*</span>
              </label>
              <input
                id="username"
                name="username"
                type="text"
                class="w-full border border-gray-200 rounded p-2 text-sm"
                placeholder="Nhập tên đăng nhập"
                required
              />
              <p class="hidden text-xs text-[#ed1b24]">
                Tên đăng nhập đã tồn tại
              </p>
            </div>
            <div class="space-y-1">
              <label for="password" class="text-sm font-semibold text-gray-700"
                >Mật khẩu <span class="text-[#ed1b24]">*</span>
              </label>
              <input
                id="password"
                name="password"
                type="password"
                class="w-full border border-gray-200 rounded p-2 text-sm"
                placeholder="Nhập mật khẩu"
                required
              />
              <p class="hidden text-xs text-[#ed1b24]">
                Mật khẩu ít nhất phải dài 6 ký tự
              </p>
            </div>
            <div class="space-y-1">
              <label
                for="re-password"
                class="text-sm font-semibold text-gray-700"
                >Xác nhận mật khẩu <span class="text-[#ed1b24]">*</span>
              </label>
              <input
                id="re-password"
                name="re-password"
                type="password"
                class="w-full border border-gray-200 rounded p-2 text-sm"
                placeholder="Nhập lại mật khẩu"
                required
              />
              <p class="hidden text-xs text-[#ed1b24]">Mật khẩu không khớp</p>
            </div>
            <button
              type="submit"
              class="w-full bg-[#ed1b24] hover:bg-[#c9131c] text-white font-semibold text-sm py-2 rounded disabled:bg-[#ed1b24]/70 transition-colors"
            >
              Đăng nhập
            </button>
          </form>
          <div class="flex items-center justify-center mt-3">
            <span class="text-sm text-gray-700">Đã có tài khoản?</span>
            <a
              href="<%= path %>/views/login.jsp"
              class="text-[#ed1b24] font-semibold text-sm ml-1 hover:underline"
              >Đăng nhập ngay.</a
            >
          </div>
          <!-- <p
            class="error text-[13px] text-red-500 text-center px-2 mt-4 leading-4"
          >
            Tên đăng nhập hoặc mật khẩu không chính xác
          </p> -->
        </div>
      </div>
    </main>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const form = document.querySelector("form")
        const submitButton = form.querySelector("button[type='submit']")
        const inputs = form.querySelectorAll("input[required]")
        const passwordInput = form.querySelector("#password")
        const rePasswordInput = form.querySelector("#re-password")
        const usernameInput = form.querySelector("#username")
        const usernameError = usernameInput.nextElementSibling
        const passwordError = passwordInput.nextElementSibling
        const rePasswordError = rePasswordInput.nextElementSibling

        function checkFormValidity() {
          let isValid = true
          inputs.forEach((input) => {
            if (!input.value.trim()) {
              isValid = false
            }
          })
          if (
            passwordError.style.display === "block" ||
            rePasswordError.style.display === "block"
          ) {
            isValid = false
          }
          submitButton.disabled = !isValid
        }

        function validatePassword() {
          const password = passwordInput.value.trim()
          if (password.length < 6) {
            passwordError.style.display = "block"
          } else {
            passwordError.style.display = "none"
          }
          checkFormValidity()
        }

        function validateRePassword() {
          const password = passwordInput.value.trim()
          const rePassword = rePasswordInput.value.trim()
          if (password !== rePassword) {
            rePasswordError.style.display = "block"
          } else {
            rePasswordError.style.display = "none"
          }
          checkFormValidity()
        }

        inputs.forEach((input) => {
          input.addEventListener("input", checkFormValidity)
          input.addEventListener("focus", () => {
            const errorElement = input.nextElementSibling
            if (errorElement && errorElement.tagName === "P") {
              errorElement.style.display = "none"
            }
          })
        })

        passwordInput.addEventListener("blur", validatePassword)
        rePasswordInput.addEventListener("blur", validateRePassword)

        checkFormValidity()
      })
    </script>
  </body>
</html>
