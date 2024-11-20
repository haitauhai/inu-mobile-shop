/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.CartDAO;
import dal.OrderDAO;
import dal.PhoneProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.User;

/**
 *
 * @author nguye
 */
@WebServlet(name = "processOrderServlet", urlPatterns = {"/processOrder"})
public class processOrderServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet processOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet processOrderServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        long amount = Long.parseLong(request.getParameter("amount"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        String phoneNumber = request.getParameter("phone");
        String note = request.getParameter("note");
        String address = request.getParameter("fullAddress");
        System.out.println(address);
        List<Product> products = new ArrayList<>();
        
        int index = 0;
        while (true) {
            String idProduct = request.getParameter("idproduct" + index);
            if (idProduct == null) {
                break;
            }
            String quantity = request.getParameter("quantity" + index);
            String nameProduct = request.getParameter("nameProduct" + index);
            System.out.println(nameProduct);
            String price = request.getParameter("price" + index);

            products.add(new Product(Integer.parseInt(idProduct), Integer.parseInt(quantity), nameProduct,Double.parseDouble(price)));
            index++;
        }
        PhoneProductDAO pdd = new PhoneProductDAO();
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+8"));
        Date date = cld.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(date.getTime());
        CartDAO cartd = new CartDAO();
            // Save order details to database
            OrderDAO orderDAO = new OrderDAO();
            for (Product product : products) {
                orderDAO.saveOrder(username, String.valueOf(product.getIdProduct()), String.valueOf(product.getQuantity()), "1", product.getName(), address, phoneNumber, note, (long) product.getPrice(), "Chưa thanh toán", sqlTimestamp);
                cartd.removecart(username, product.getIdProduct());
                pdd.updateStockProductByBuy(product.getIdProduct());
            }
            
            response.sendRedirect("home");
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
