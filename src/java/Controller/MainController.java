/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nguye
 */

@WebServlet(name = "MainController", urlPatterns = {"/Maincontroller"})
public class MainController extends HttpServlet {
    private static final String ERROR_URL = "error.jsp";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "login";
    private static final String REGISTER = "Register";
    private static final String REGISTER_CONTROLLER = "register";
    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "phone";
    private static final String ADD_PRODUCT = "Addproduct";
    private static final String ADD_PRODUCT_CONTROLLER = "addproduct";
    private static final String CART = "Cart";
    private static final String USER = "ChangeUserInfo";
    private static final String USER_CONTROLLER = "user";
    private static final String DELETE = "Deleteuser";
    private static final String DELETE_CONTROLLER = "deleteuser";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "logout";
    private static final String SEARCH_BY_NAME = "Search";
    private static final String SEARCH_BY_NAME_CONTROLLER = "search";
    private static final String UPDATE = "Updateuser";
    private static final String UPDATE_CONTROLLER = "updateuser";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "update-cart-quantity";
    private static final String UPDATE_PRODUCT = "UpdateOrAddProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "product-details";
    private static final String ERROR = "Error";
    private static final String ERROR_CONTROLLER = "error";
    private static final String PROFILE="Profile";
    private static final String PROFILE_CONTROLLER="profile";
    private static final String EDITPRODUCT="Editproduct";
    private static final String EDITPRODUCT_CONTROLLER="editproduct";
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
            String action = request.getParameter("action");
            String URL= ERROR_CONTROLLER;
            if(action == null ? LOGIN == null : action.equals(LOGIN)){
                URL = LOGIN_CONTROLLER;
            } else if(action.equals(REGISTER)){
                URL = REGISTER_CONTROLLER;
            }else if(action.equals(SEARCH_PRODUCT)){
                URL = SEARCH_PRODUCT_CONTROLLER;
            }else if(action.equals(ADD_PRODUCT)){
                URL = ADD_PRODUCT_CONTROLLER;
            } else if (UPDATE_PRODUCT.equals(action)) {
                URL = UPDATE_PRODUCT_CONTROLLER;
            }else if(action.equals(REGISTER)){
                URL = REGISTER_CONTROLLER;
            }else if (SEARCH_BY_NAME.equals(action)) {
                URL = SEARCH_BY_NAME_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                URL = UPDATE_CONTROLLER;
            } else if (UPDATE_CART.equals(action)) {
                URL = UPDATE_CART_CONTROLLER;
            } else if (USER.equals(action)) {
                URL = USER_CONTROLLER;
            } else if (DELETE.equals(action)) {
                URL = DELETE_CONTROLLER;
            } else if (PROFILE.equals(action)){
                URL = PROFILE_CONTROLLER;
            } else if (EDITPRODUCT.equals(action)){
                URL = EDITPRODUCT_CONTROLLER;
            }
            request.getRequestDispatcher(URL).forward(request, response);
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
        processRequest(request, response);
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
