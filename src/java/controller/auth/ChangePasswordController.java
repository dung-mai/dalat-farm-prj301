/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import DAL.UserDAO;
import controller.base.AccountUtility;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class ChangePasswordController extends HttpServlet {

    String user;
    String pass;
    UserDAO userDAO;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
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
        if (request.getSession().getAttribute("changeEmail") != null && request.getSession().getAttribute("acceptchange") != null) {
            request.getRequestDispatcher("../view/auth/new-password.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/home");
        }
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
        String changeEmail = (String) request.getSession().getAttribute("changeEmail");
//        boolean acceptchange = (boolean) request.getSession().getAttribute("acceptchange");

        String new_password = request.getParameter("new_password");
        String new_confirm_password = request.getParameter("new_confirm_password");

        if (!AccountUtility.isValidPassword(new_password, "^.*(?=.{6,30})(?=..*[0-9])(?=.*[a-zA-Z]).*$")) {
            request.setAttribute("mess", "Mật khẩu phải chứa cả chữ và số, độ dài 6-30 ký tự");
            request.setAttribute("check", false);
            request.getRequestDispatcher("../view/auth/new-password.jsp").forward(request, response);
        } // check confirm password
        else if (!new_password.equals(new_confirm_password)) {
            request.setAttribute("mess", "Mật khẩu xác nhận chưa chính xác");
            request.setAttribute("check", false);
            request.getRequestDispatcher("../view/auth/new-password.jsp").forward(request, response);
        } else {
            new_password = Utility.sha256(new_password);
            userDAO.changePassword(changeEmail, new_password);
            User currentUser = userDAO.getUserByEmail(changeEmail);
            if (!currentUser.isVerified()) {
                request.getSession().setAttribute("unverifiedEmail", changeEmail);
                response.sendRedirect("account/verify");
            } else {
                request.getSession().setAttribute("user", currentUser);
                //Redirect
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }

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
