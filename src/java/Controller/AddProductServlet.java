/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.PhoneProductDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.PhoneProduct;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddProductServlet", urlPatterns = {"/addproduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddProductServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("addproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Validate and read parameters
            int id = getValidatedIntParameter(request, "id", "Invalid id");
            String name = getValidatedParameter(request, "name", "Product name is required");
            int price = getValidatedIntParameter(request, "price", "Invalid price");
            String display = request.getParameter("display");
            String f_camera = request.getParameter("f_camera");
            String r_camera = request.getParameter("r_camera");
            String chip = request.getParameter("chip");
            int ram = getValidatedIntParameter(request, "ram", "Invalid RAM");
            int rom = getValidatedIntParameter(request, "rom", "Invalid ROM");
            String describe = request.getParameter("describe");
            int pcid = getValidatedIntParameter(request, "pcid", "Invalid category ID");
            int stock = getValidatedIntParameter(request, "stock", "Invalid Stock");
            // Handle file upload
            Part filePart = request.getPart("image");
            String imageUrl = "";
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = getFileName(filePart);
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                imageUrl = "images" + File.separator + fileName;
            } else {
                throw new ServletException("Image file is required");
            }

            // Create PhoneProduct object
            PhoneProduct p = new PhoneProduct(id, name, imageUrl, price, display, f_camera, r_camera, chip, ram, rom, describe, pcid, stock);
            PhoneProductDAO pd = new PhoneProductDAO();
            pd.addProduct(p);

            response.sendRedirect("admin#product");
        } catch (ServletException e) {
            log("ServletException in AddProductServlet: ", e);
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("addproduct.jsp").forward(request, response);
        } catch (Exception e) {
            log("Exception in AddProductServlet: ", e);
            response.sendRedirect("error.jsp");
        }
    }

    private String getValidatedParameter(HttpServletRequest request, String paramName, String errorMessage) throws ServletException {
        String value = request.getParameter(paramName);
        if (value == null || value.trim().isEmpty()) {
            throw new ServletException(errorMessage);
        }
        return value.trim();
    }

    private int getValidatedIntParameter(HttpServletRequest request, String paramName, String errorMessage) throws ServletException {
        String value = getValidatedParameter(request, paramName, errorMessage);
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            throw new ServletException(errorMessage);
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
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
