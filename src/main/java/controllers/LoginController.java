package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.bean.User;
import models.bo.UserBO;

@WebServlet("/login")
public class LoginController extends HttpServlet {
  private UserBO userBO;

  public LoginController() {
    userBO = new UserBO();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String redirectUrl = request.getParameter("redirect");

    User user = userBO.checkLogin(username, password);

    if (user != null) {
      HttpSession session = request.getSession();
      session.setAttribute("user", user);
      session.setMaxInactiveInterval(1800); // Session expires after 30 minutes

      if (user.getUserRole() == User.Role.admin) {
        response.sendRedirect(request.getContextPath() + "/manage");
      } else {
        response.sendRedirect(redirectUrl);
      }
    } else {
      request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không chính xác.");
      request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }
  }
}