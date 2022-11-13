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
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class Dashboard extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Dashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Dashboard at " + request.getContextPath() + "</h1>");
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
        User loggedInUser = Utility.getLoginAccount(request, response);
        ArrayList<Order> oList = orderDAO.getAllOrder();
        int[] status = new int[4];
        for (int i = 0; i < 4; i++) {
            status[i] = orderDAO.countOrderByStatus(i + 1, oList);
        }

        long doanhthu = 0;
        long[] totals = new long[7];
        Timestamp currenttime = new Timestamp(System.currentTimeMillis());
        Timestamp time = new Timestamp(currenttime.getYear(), currenttime.getMonth(), currenttime.getDate(), 0, 0, 0, 0);
        for (int i = 0; i <= 6; i++) {
            totals[i] = orderDAO.getTotalMoneyByDate(oList, new Timestamp(time.getTime() - 60 * 60 * 1000 * 24 * (i)), new Timestamp(time.getTime() - 60 * 60 * 1000 * 24 * (i - 1)));
            doanhthu += totals[i];
        }
        for (int i = 0; i < 3; i++) {
            long temp = totals[i];
            totals[i] = totals[6 - i];
            totals[6 - i] = temp;
        }

        int[] sales = new int[7];
        for (int i = 0; i <= 6; i++) {
            sales[i] = orderDAO.countOrderByDay(oList, new Timestamp(time.getTime() - 60 * 60 * 1000 * 24 * (i)), new Timestamp(time.getTime() - 60 * 60 * 1000 * 24 * (i - 1)));
        }
        for (int i = 0; i < 3; i++) {
            int temp = sales[i];
            sales[i] = sales[6 - i];
            sales[6 - i] = temp;
        }

        request.setAttribute("doanhthu", doanhthu);
        request.setAttribute("totals", totals);
        request.setAttribute("sales", sales);
        request.setAttribute("statusList", status);
        request.getRequestDispatcher("../view/admin/dashboard.jsp").forward(request, response);
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
