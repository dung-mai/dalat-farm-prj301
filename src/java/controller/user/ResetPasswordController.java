/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import DAL.DAO;
import DAL.UserDAO;
import controller.base.AccountUtility;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class ResetPasswordController extends HttpServlet {

    String user;
    String pass;
    UserDAO userDAO;
    DAO dao;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
        userDAO = new UserDAO(user, pass);
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
        if (loggedInUser != null) {
            if (!userDAO.isAdmin(loggedInUser.getEmail())) {
                request.getRequestDispatcher("../../view/customer/edit-pass.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("../../view/admin/edit-admin-pass.jsp").forward(request, response);
            }
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
        request.setAttribute("dao", dao);
        String current_password = request.getParameter("current_password");
        String new_password = request.getParameter("new_password");
        String new_confirm_password = request.getParameter("new_confirm_password");

        User loggedInUser = (User) request.getSession().getAttribute("user");
        boolean check = false;
        if (user != null) {
            current_password = Utility.sha256(current_password);
            check = userDAO.getUser(loggedInUser.getEmail(), current_password) != null;
        }

        if (!check) {
            request.setAttribute("mess", "Vui l??ng ki???m tra l???i m???t kh???u");
            request.setAttribute("check", check);
            request.getRequestDispatcher("../../view/customer/edit-pass.jsp").forward(request, response);
        } // Check valid password
        else if (!AccountUtility.isValidPassword(new_password, "^.*(?=.{6,30})(?=..*[0-9])(?=.*[a-zA-Z]).*$")) {
            request.setAttribute("mess", "M???t kh???u ph???i ch???a c??? ch??? v?? s???, ????? d??i 6-30 k?? t???");
            request.setAttribute("check", false);
            request.getRequestDispatcher("../../view/customer/edit-pass.jsp").forward(request, response);
        } // check confirm password
        else if (!new_password.equals(new_confirm_password)) {
            request.setAttribute("mess", "M???t kh???u x??c nh???n ch??a ch??nh x??c");
            request.setAttribute("check", false);
            request.getRequestDispatcher("../../view/customer/edit-pass.jsp").forward(request, response);
        } else {
            new_password = Utility.sha256(new_password);
            userDAO.changePassword(loggedInUser.getEmail(), new_password);
            request.getSession().setAttribute("user", loggedInUser);
            request.setAttribute("mess", "Thay ?????i m???t kh???u th??nh c??ng");
            request.setAttribute("check", check);

            //Update COOKIE
            updateCookie(request, response, new_password);

            //Redirect
            if (!userDAO.isAdmin(loggedInUser.getEmail())) {
                response.sendRedirect("../../customer/account");
            } else {
                response.sendRedirect("../../admin/account");
            }
        }
    }

    private void updateCookie(HttpServletRequest request, HttpServletResponse response, String newPass)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null)//not login, some cookies
        {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("c_pass")) {
                    cooky.setMaxAge(0);
                    response.addCookie(cooky);
                }
            }
        }
        Cookie password = new Cookie("c_pass", newPass);
        password.setMaxAge(60 * 60 * 24 * 2);
        response.addCookie(password);
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
