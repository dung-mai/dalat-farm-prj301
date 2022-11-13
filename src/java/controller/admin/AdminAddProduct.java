/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.DAO;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import model.Product;

/**
 *
 * @author Admin
 */
public class AdminAddProduct extends HttpServlet {

    String user;
    String pass;
    DAO dao;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
        dao = new DAO(user, pass);
    }

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

        //create and set DAO
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
        request.setAttribute("dao", dao);
        request.getRequestDispatcher("../../view/admin/add-product.jsp").forward(request, response);
//        processRequest(request, response);
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
        request.setAttribute("dao", dao);
        String raw_name = request.getParameter("name");
        String raw_description = request.getParameter("description");
        String raw_thumbnail = request.getParameter("thumbnail");
        String raw_images = request.getParameter("images");
        String raw_tags = request.getParameter("tags");
        String raw_supplier = request.getParameter("supplier");
        String raw_category = request.getParameter("category");
        String raw_unit = request.getParameter("unit");
        String raw_unitprice = request.getParameter("unitprice");
        String raw_quantity = request.getParameter("quantity");
        String raw_promotion_price = request.getParameter("promotion_price");
        String raw_hot = request.getParameter("hot");

        int unitprice = Utility.parseIntParameter(raw_unitprice, 0, 0);
        int promotion_price = Utility.parseIntParameter(raw_promotion_price, unitprice, 0);
        int supplier = Utility.parseIntParameter(raw_supplier, 0, 0);
        int category = Utility.parseIntParameter(raw_category, 0, 0);
        int quantity = Utility.parseIntParameter(raw_quantity, 0, 0);
        String[] images = new String[1];
        if (raw_thumbnail != null && !raw_thumbnail.equals("")) {
            raw_thumbnail = "images/" + raw_thumbnail;
        }

        boolean check = dao.insertProduct(raw_name, quantity, raw_unit, unitprice, promotion_price, raw_thumbnail, raw_description, raw_tags, raw_hot, category, supplier);
        if (check == true) {
            request.setAttribute("successMess", "Bạn đã thêm thành công sản phẩm");
        }
        request.getRequestDispatcher("../../view/admin/add-product.jsp").forward(request, response);
//        String name = request.getParameter("name");
//        processRequest(request, response);
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
