/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.CartDAO;
import dal.CategoryDAO;
import dal.PhoneCategoriesDAO;
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
import model.PhoneCategories;
import model.PhoneProduct;
import model.User;

/**
 *
 * @author nguye
 */
@WebServlet(name = "phoneSevlet", urlPatterns = {"/phone"})
public class phoneSevlet extends HttpServlet {

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
            out.println("<title>Servlet phoneSevlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet phoneSevlet at " + request.getContextPath() + "</h1>");
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
        HttpSession sesion = request.getSession();
        User user = (User) sesion.getAttribute("user");
        CartDAO cad = new CartDAO();
        if(user!=null){
        List<CartView> lcv = cad.getCartViewByUsername(user.getUsername());
        sesion.setAttribute("number", lcv.size());
        }
        CategoryDAO c = new CategoryDAO();
        List<Category> list = c.getAll();
        PhoneCategoriesDAO p = new PhoneCategoriesDAO();
        List<PhoneCategories> listc = p.getAll();
        PhoneProductDAO phoneDAO = new PhoneProductDAO();
        String rawid = request.getParameter("brandId");
        if (rawid == null) {
            List<PhoneProduct> listphone = phoneDAO.getAll();
            request.setAttribute("size", listphone.size());
            request.setAttribute("listphone", listphone);
        }
        try {
            int id = Integer.parseInt(rawid);
            List<PhoneProduct> listphone = phoneDAO.getProductByCID(id);
            request.setAttribute("size", listphone.size());
            request.setAttribute("listphone", listphone);

        } catch (Exception e) {
            System.out.println(e);
        }
        String cid_raw = request.getParameter("brand");
        String price_raw = request.getParameter("price");
        String ram_raw = request.getParameter("ram");
        String rom_raw = request.getParameter("rom");
        try {
            int cid = Integer.parseInt(cid_raw);
            int ram = Integer.parseInt(ram_raw);
            int rom = Integer.parseInt(rom_raw);
            List<PhoneProduct> listphone = phoneDAO.getProductBySearch(cid, price_raw, ram, rom);
            request.setAttribute("size", listphone.size());
            request.setAttribute("listphone", listphone);
        } catch (Exception e) {
            System.out.println(e);
        }
        request.setAttribute("data", list);
        request.setAttribute("listcate", listc);
        request.getRequestDispatcher("phone.jsp").forward(request, response);

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
