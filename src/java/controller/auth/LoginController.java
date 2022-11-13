/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import controller.base.Utility;
import DAL.UserDAO;
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
public class LoginController extends HttpServlet {

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
        request.getRequestDispatcher("view/auth/Login.jsp").forward(request, response);
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
        UserDAO userDao = new UserDAO();
        String u_email;
        String u_pass;
        User user;

        // GET email, pass and check
        u_email = request.getParameter("email");
        u_pass = request.getParameter("password");
        u_pass = Utility.sha256(u_pass);
        user = userDao.getUser(u_email, u_pass);
        if (user == null) {
            request.setAttribute("status", "invalidAccount");
            request.getRequestDispatcher("view/auth/Login.jsp").forward(request, response);
        } else {
            if (!user.isActive()) {
                request.setAttribute("status", "nolongerExist");
                request.getRequestDispatcher("view/auth/Login.jsp").forward(request, response);
            } else if (!user.isVerified()) {
                request.getSession().setAttribute("unverifiedEmail", u_email);
                response.sendRedirect("account/verify");
            } else {
                
                
                //SET Cookie
                Cookie c_email = new Cookie("c_email", u_email);
                Cookie c_pass = new Cookie("c_pass", u_pass);

                if (request.getParameter("rememberMe") != null) {
                    c_email.setMaxAge(24 * 60 * 60 * 2);
                    c_pass.setMaxAge(24 * 60 * 60 * 2);
                } else {
                    c_email.setMaxAge(0);
                    c_pass.setMaxAge(0);
                }
                response.addCookie(c_email);
                response.addCookie(c_pass);

                //SET Session
                request.getSession().setAttribute("user", user);
                if (userDao.isAdmin(u_email)) {
                    response.sendRedirect("admin/dashboard");
                } else {
                    response.sendRedirect("home");
                }
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
