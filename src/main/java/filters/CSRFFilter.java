package filters;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter("/*")
public class CSRFFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(true);

        // Generate CSRF token if not present
        if (session.getAttribute("csrfToken") == null) {
            String csrfToken = UUID.randomUUID().toString();
            session.setAttribute("csrfToken", csrfToken);
            System.out.println("Generated CSRF Token: " + csrfToken);
        }

        if ("POST".equalsIgnoreCase(httpRequest.getMethod())) {
            String csrfToken = httpRequest.getParameter("csrfToken");
            String sessionToken = (String) session.getAttribute("csrfToken");
            System.out.println("Session CSRF Token: " + sessionToken);
            System.out.println("Request CSRF Token: " + csrfToken);

            if (sessionToken == null || !sessionToken.equals(csrfToken)) {
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF token");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}