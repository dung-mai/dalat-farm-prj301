/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import DAL.DAO;
import DAL.UserDAO;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class CustomerAddressCreate extends HttpServlet {

    String user;
    String pass;
    DAO dao;
    UserDAO userDAO;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
        dao = new DAO(user, pass);
        userDAO = new UserDAO(user, pass);
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
        Utility.getLoginAccount(request, response);
        request.getRequestDispatcher("../../view/customer/create-address.jsp").forward(request, response);
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
        String fullName = request.getParameter("fullName");
        String phone_number = request.getParameter("phone_number");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String detail_address = request.getParameter("detail_address");
        String raw_default_address = request.getParameter("default_address");

        String fullAddress = detail_address + ", " + ward + ", " + district + ", " + city;
        boolean default_address = raw_default_address != null;

        User current_user = Utility.getLoginAccount(request, response);

        //reset default address
        if (default_address) {
            userDAO.resetDefaultAddress(current_user.getUser_id());
        }
        //insert address
        if (!userDAO.addAddress(current_user.getUser_id(), fullName, fullAddress, phone_number, default_address)) {
            request.setAttribute("mess", "Thêm thất bại. Vui lòng kiểm tra lại địa chỉ");
            request.getRequestDispatcher("../../view/customer/create-address.jsp").forward(request, response);
        }
        response.sendRedirect("../address");
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
