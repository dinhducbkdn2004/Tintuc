package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.bean.User;
import models.bo.UserBO;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserBO userBO;

	public RegisterController() {
		userBO = new UserBO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// Kiểm tra CSRF token
		HttpSession session = request.getSession();
		String sessionToken = (String) session.getAttribute("csrfToken");
		String csrfToken = request.getParameter("csrfToken");
		if (sessionToken == null || !sessionToken.equals(csrfToken)) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF token");
			return;
		}

		// Xử lý đăng ký
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");

		// Kiểm tra nếu người dùng đã tồn tại
		if (userBO.isUserExist(username)) {
			request.setAttribute("usernameError", "Tên đăng nhập đã tồn tại");
			request.getRequestDispatcher("/views/register.jsp").forward(request, response);
			return;
		}

		User user = new User(username, password, name);
		boolean success = userBO.registerUser(user);

		if (success) {
			response.sendRedirect(request.getContextPath() + "/login");
		} else {
			request.setAttribute("errorMessage", "Đăng ký thất bại");
			request.getRequestDispatcher("/views/register.jsp").forward(request, response);
		}
	}
}