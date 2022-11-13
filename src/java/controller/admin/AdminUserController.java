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
public class AdminUserController extends HttpServlet {

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
        User loggedInUser = Utility.getLoginAccount(request, response);

        //ORDERY BY
        //PAGING
        String nrppContext = "10, 20, 50";
        int[] nrppArr = Utility.parseStringArray(nrppContext, ",");
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = Utility.parseIntParameter(request.getParameter("pagesize"), 10);
        int pageindex = Utility.parseIntParameter(request.getParameter("page"), 1, 1);
        int totalrecords = userDAO.getAllUser().size();  // total record of curent order status
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalrecords", totalrecords);

        ArrayList<User> userList = userDAO.getAllUser(pageindex, pagesize, "", -1);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("../view/admin/admin-user.jsp").forward(request, response);

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

        //loc tim kiem
        String search = request.getParameter("search");
        search = search != null ? search : "";
        request.setAttribute("search", search);

        //PAGING
        String nrppContext = "10, 20, 50";
        int[] nrppArr = Utility.parseStringArray(nrppContext, ",");
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = Utility.parseIntParameter(request.getParameter("pagesize"), 10);
        int pageindex = Utility.parseIntParameter(request.getParameter("page"), 1, 1);
        int totalrecords = userDAO.getAllUser(search, status).size();  // total record of curent order status
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalrecords", totalrecords);

        ArrayList<User> userList = userDAO.getAllUser(pageindex, pagesize, search, status);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("../view/admin/admin-user.jsp").forward(request, response);
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
