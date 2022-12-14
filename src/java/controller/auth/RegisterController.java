/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import controller.base.Utility;
import DAL.UserDAO;
import controller.base.AccountUtility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String phone = request.getParameter("phone");

        if (!AccountUtility.validateString(email, "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("mess", "Email kh??ng h???p l???");
            request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
        } else if (userDao.checkExistAccount(email)) {
            request.setAttribute("mess", "Email n??y ???? ???????c ????ng k??");
            request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
        } else if (!AccountUtility.isValidPassword(password, "^.*(?=.{6,30})(?=..*[0-9])(?=.*[a-zA-Z]).*$")) {
            request.setAttribute("mess", "M???t kh???u ph???i ch???a c??? ch??? v?? s???, ????? d??i 6-30 k?? t???");
            request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
        } else if (firstname.length() > 25 || firstname.length() > 25) {
            request.setAttribute("mess", "T??n v?????t qu?? ????? d??i t???i ??a");
            request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
        } else if (!AccountUtility.validateString(phone, "(84|0[3|5|7|8|9])+([0-9]{8})")) {
            request.setAttribute("mess", "S??? ??i???n tho???i kh??ng h???p l???");
            request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
        } else if (!password.equals(confirm_password)) {
            request.setAttribute("mess", "M???t kh???u x??c nh???n ch??a ch??nh x??c");
            request.getRequestDispatcher("view/auth/Register.jsp").forward(request, response);
        } else {
            password = Utility.sha256(password);
            userDao.registration(email, password, firstname, lastname, phone);
            request.getSession().setAttribute("unverifiedEmail", email);
            String new_token = SendMail.getRandom();
            UserDAO userDAO = new UserDAO();
            userDAO.createToken(email, new_token);
            response.sendRedirect("account/verify");
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
