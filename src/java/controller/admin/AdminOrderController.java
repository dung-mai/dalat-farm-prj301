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
import java.util.ArrayList;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class AdminOrderController extends HttpServlet {

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
        User loggedInUser = Utility.getLoginAccount(request, response);

        //Status
        int status = -1;
        request.setAttribute("status", status);

        //ORDERY BY
        //PAGING
        String nrppContext = "10, 20, 50";
        int[] nrppArr = Utility.parseStringArray(nrppContext, ",");
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = 20;
        int pageindex = 1;
        int totalrecords = orderDAO.getOrderFilter(status, "", "", "").size();  // total record of curent order status
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalrecords", totalrecords);

        ArrayList<Order> orders = orderDAO.getOrderFilter(status, pageindex, pagesize, "order_date DESC", "", "", "");
        request.setAttribute("orderList", orders);
        request.getRequestDispatcher("../view/admin/admin-order.jsp").forward(request, response);

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
        User loggedInUser = Utility.getLoginAccount(request, response);

        //Status
        int status = Utility.parseIntParameter(request.getParameter("status"), -1);
        request.setAttribute("status", status);

        //ORDERY BY
        String[] orderByArr = {"order_date DESC", "total ASC", "total DESC"};
        int orderBy = Utility.parseIntParameter(request.getParameter("orderBy"), 0, 0);
        request.setAttribute("orderBy", orderBy);

        //loc tim kiem
        String order_id = request.getParameter("order_id");
        String customer_name = request.getParameter("customer_name");
        String phone_email = request.getParameter("phone_email");
        order_id = order_id != null ? order_id : "";
        customer_name = customer_name != null ? customer_name : "";
        phone_email = phone_email != null ? phone_email : "";
        request.setAttribute("order_id", order_id);
        request.setAttribute("customer_name", customer_name);
        request.setAttribute("phone_email", phone_email);

        //PAGING
        String nrppContext = "10, 20, 50";
        int[] nrppArr = Utility.parseStringArray(nrppContext, ",");
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = Utility.parseIntParameter(request.getParameter("pagesize"), 20);
        int pageindex = Utility.parseIntParameter(request.getParameter("page"), 1, 1);

        int totalrecords = orderDAO.getOrderFilter(status, order_id, customer_name, phone_email).size();  // total record of curent order status
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalrecords", totalrecords);

        ArrayList<Order> orders = orderDAO.getOrderFilter(status, pageindex, pagesize, orderByArr[orderBy], order_id, customer_name, phone_email);
        request.setAttribute("orderList", orders);
        request.getRequestDispatcher("../view/admin/admin-order.jsp").forward(request, response);
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
