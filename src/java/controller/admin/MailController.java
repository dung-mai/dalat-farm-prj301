/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAL.DAO;
import DAL.UserDAO;
import controller.auth.SendMail;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import model.Mail;

/**
 *
 * @author Admin
 */
public class MailController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MailController at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("templateList", userDAO.getListEmail());

        request.getRequestDispatcher("../view/admin/admin-send-email.jsp").forward(request, response);
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

        //If send email immediately
        String sendemail = request.getParameter("sendemail");
        if (sendemail != null && sendemail.equals("true")) {
            int e_id = Utility.parseIntParameter(request.getParameter("tid"), 0);
            Mail mail = userDAO.getTemplateByIds(e_id);
            request.setAttribute("mail", mail);
            request.setAttribute("sendemail", "true");
        }

        //if delelte
        String delete = request.getParameter("delete");
        if (delete != null && delete.equals("true")) {
            int e_id = Utility.parseIntParameter(request.getParameter("tid"), 0);
            userDAO.deleteMailTemplate(e_id);
        }

        //SEND EMAIL
        String toaddress = request.getParameter("toaddress");
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        String toalladdress = request.getParameter("toalladdress");
        if (toalladdress != null) {
            String[] emailList = userDAO.getAllUserEmail();
            try {
                SendMail.sendEmailMultiple(emailList, title, message);
                request.setAttribute("mess", "Đã gửi thành công");
            } catch (MessagingException ex) {
                Logger.getLogger(MailController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            if (toaddress != null && toaddress.length() != 0) {
                try {
                    SendMail.sendEmail(toaddress, title, message);
                    request.setAttribute("mess", "Đã gửi thành công");
                } catch (MessagingException ex) {
                    Logger.getLogger(MailController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        request.setAttribute("templateList", userDAO.getListEmail());
        request.getRequestDispatcher("../view/admin/admin-send-email.jsp").forward(request, response);
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
