/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Token;

/**
 *
 * @author Admin
 */
public class ForgotPasswordController extends HttpServlet {

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
        request.getRequestDispatcher("../view/auth/reset-password.jsp").forward(request, response);
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

        String email = request.getParameter("authEmail");
        if (email == null) {  // Neu nguoi dung KHONG INPUT EMAIL 
            request.getRequestDispatcher("../view/auth/reset-password.jsp").forward(request, response);
        } else {
            if (userDAO.getUserByEmail(email) == null) { // CHECK EMAIL HAS EXIST?
                request.setAttribute("mess", "Email không tồn tại");
                request.getRequestDispatcher("../view/auth/reset-password.jsp").forward(request, response);
            } else {
                Token token = userDAO.getTokenByEmail(email);
                if (token == null) {
                    userDAO.createToken(email, SendMail.getRandom());
                    token = userDAO.getTokenByEmail(email);
                }
                long existTime = System.currentTimeMillis() - token.getCreated_date().getTime();
                if (existTime > 60 * 60 * 24 * 1000) {
                    String new_token = SendMail.getRandom();
                    token.setToken_string(new_token);
                    token.setCreated_date(new Timestamp(System.currentTimeMillis()));
                    userDAO.updateToken(token);
                }
                try {
                    SendMail.sendEmail(email, token.getToken_string());
                } catch (MessagingException ex) {
                    Logger.getLogger(VerificationController.class.getName()).log(Level.SEVERE, null, ex);
                }
                 request.getSession().setAttribute("changeEmail", email);
                response.sendRedirect(request.getContextPath() + "/account/forgot-password/otp");
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
