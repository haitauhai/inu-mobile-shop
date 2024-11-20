package Filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebFilter(filterName = "AdminFilter", urlPatterns = {"/updateuser", "/deleteuser", "/admin", "/addproduct","/deleteproduct","/updateproduct","/orderview", "/viewproduct"})
public class AdminFilter implements Filter {
    
    private static final boolean debug = true;

    private FilterConfig filterConfig = null;
    
    public AdminFilter() {}
    
    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AdminFilter:DoBeforeProcessing");
        }
    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AdminFilter:DoAfterProcessing");
        }
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        if (session == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null || user.getRole() != 1) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
        } else {
            chain.doFilter(request, response);
        }
    }

    public FilterConfig getFilterConfig() {
        return this.filterConfig;
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void destroy() {}

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AdminFilter:Initializing filter");
            }
        }
    }

    @Override
    public String toString() {
        if (filterConfig == null) {
            return "AdminFilter()";
        }
        return "AdminFilter(" + filterConfig + ")";
    }
    
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n");
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");                
                pw.print(stackTrace);                
                pw.print("</pre></body>\n</html>");
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
                // Log the exception
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
                // Log the exception
            }
        }
    }
    
    public static String getStackTrace(Throwable t) {
        try (StringWriter sw = new StringWriter();
             PrintWriter pw = new PrintWriter(sw)) {
            t.printStackTrace(pw);
            return sw.toString();
        } catch (Exception ex) {
            return null;
        }
    }
    
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}
