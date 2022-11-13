/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.DAO;
import DAL.OrderDAO;
import DAL.UserDAO;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.User;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class AdminOrderUpdate extends HttpServlet {

    String user;
    String pass;
    DAO dao;
    OrderDAO orderDAO;
    UserDAO userDAO;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
        dao = new DAO(user, pass);
        userDAO = new UserDAO(user, pass);
        orderDAO = new OrderDAO(user, pass);
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
        User loggedInUser = Utility.getLoginAccount(request, response);

        int o_id = Utility.parseIntParameter(request.getParameter("id"), 0);
        Order order = orderDAO.getOrderById(o_id);
        if (order != null) {
            UserAddress add = new UserAddress(-1, order.getUser_id(), order.getFullname(), order.getAddress(), order.getPhone_number(), true);
            request.setAttribute("address", add);
        }
        request.setAttribute("order", orderDAO.getOrderById(o_id));
        request.getRequestDispatcher("../../view/admin/order-update.jsp").forward(request, response);
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
        int o_id = Utility.parseIntParameter(request.getParameter("id"), 0);
        String customer_name = request.getParameter("fullName");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String detail_address = request.getParameter("detail_address");
        String paymentMethod = request.getParameter("paymentMethod");
        int order_status = Utility.parseIntParameter(request.getParameter("order_status"), 1);
        if (customer_name == null || customer_name.length() == 0) {
            orderDAO.updateOrderInfo(o_id, order_status);
        } else {
            String address = detail_address + ", " + ward + ", " + district + ", " + city;
            orderDAO.updateOrderInfo(o_id, order_status, customer_name, phone_number, email, address, paymentMethod);
        }
        response.sendRedirect(request.getContextPath() + "/admin/order/detail?id=" + o_id);

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
