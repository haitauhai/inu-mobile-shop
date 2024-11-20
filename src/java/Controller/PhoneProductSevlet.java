/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.PhoneProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.CartView;
import model.Category;
import model.PhoneProduct;
import model.User;


/**
 *
 * @author nguye
 */
@WebServlet(name = "PhoneProduct", urlPatterns = {"/phoneproduct"})
public class PhoneProductSevlet extends HttpServlet {

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
            out.println("<title>Servlet PhoneProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PhoneProduct at " + request.getContextPath() + "</h1>");
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
        
        CategoryDAO c = new CategoryDAO();
        List<Category> list = c.getAll();
        request.setAttribute("data", list);
        HttpSession sesion = request.getSession();
        User user = (User) sesion.getAttribute("user");
        if(user!=null){
        System.out.println(user.getUsername());
        CartDAO cad = new CartDAO();
        List<CartView> lcv = cad.getCartViewByUsername(user.getUsername());
        sesion.setAttribute("number", lcv.size());
        }
        PhoneProductDAO p = new PhoneProductDAO();
        List<PhoneProduct> lp = p.getAll();
        request.setAttribute("listProduct", lp);
        String id_raw = request.getParameter("id");
        try{
            int id = Integer.parseInt(id_raw);
            PhoneProduct itemphone = p.getProductByID(id);
            request.setAttribute("itemphone", itemphone);
        }catch(Exception e){
            System.out.println(e);
        }
        request.getRequestDispatcher("phoneproduct.jsp").forward(request, response);
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
        processRequest(request, response);
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
