/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Base64;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author nguye
 */
@WebServlet(name = "LoginSevlet", urlPatterns = {"/login"})
public class LoginSevlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginSevlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginSevlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cpass".equals(cookie.getName())) {
                    String encryptedValue = cookie.getValue();
                    try {
                        String decryptedValue = decrypt(encryptedValue);
                        Cookie cenpass = new Cookie("cenpass", decryptedValue);
                        cenpass.setMaxAge(2);
                        response.addCookie(cenpass);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        UserDAO ldao = new UserDAO();
        if (!ldao.checkAccount(username, password)) {
            request.setAttribute("error", "Account or Password Invalid!!!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            User user = ldao.getUserByUsername(username);
            Cookie cuser = new Cookie("cuser", username);
            Cookie cpass = new Cookie("cpass", encrypt(password));
            Cookie crem = new Cookie("crem", remember);
            if (remember == null) {
                cuser.setMaxAge(0);
                cpass.setMaxAge(0);
                crem.setMaxAge(0);
            } else {
                cuser.setMaxAge(60 * 60 * 24 * 30);
                cpass.setMaxAge(60 * 60 * 24 * 30);
                crem.setMaxAge(60 * 60 * 24 * 30);
            }
            session.setAttribute("user", user);
            response.addCookie(cuser);
            response.addCookie(cpass);
            response.addCookie(crem);
            response.sendRedirect("home");

        }
    }

    private static final String SECRET_KEY = "HaiTauHai-Key123";

    // Hàm mã hóa
    public static String encrypt(String plainText) {
        try {
            SecretKey secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
            return Base64.getEncoder().encodeToString(encryptedBytes);
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // Hàm giải mã
    public static String decrypt(String encryptedText) {
        try {
            SecretKey secretKey = new SecretKeySpec(SECRET_KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance("AES");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            byte[] encryptedBytes = Base64.getDecoder().decode(encryptedText);
            byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
            return new String(decryptedBytes);
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
