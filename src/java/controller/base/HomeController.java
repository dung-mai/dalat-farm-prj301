/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.base;

import DAL.DAO;
import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
public class HomeController extends HttpServlet {

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
        DAO dao = new DAO();
        request.setAttribute("dao", dao);
        User user = Utility.getLoginAccount(request, response);
        request.setAttribute("user", user);
        ArrayList<Product> pList = dao.getProducts();
        
        request.getRequestDispatcher("view/index.jsp").forward(request, response);
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
        processRequest(request, response);
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

//    private User getLoginAccount(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        UserDAO userDao = new UserDAO();
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        String u_email = null;
//        String u_pass = null;
//        if (user == null) { // check if not in Session
//            Cookie[] cookies = request.getCookies();
//            if (cookies != null)//not login, some cookies
//            {
//                for (Cookie cooky : cookies) {
//                    if (cooky.getName().equals("c_email")) {
//                        u_email = cooky.getValue();
//                    }
//                    if (cooky.getName().equals("c_pass")) {
//                        u_pass = cooky.getValue();
//                    }
//                }
//                user = userDao.getUser(u_email, u_pass);
//            }
//        }
//        return user;
//    }
    
    private ArrayList<Product> getHotList(ArrayList<Product> allList){
        ArrayList<Product> hotList = new ArrayList<Product>();
        for(Product p : allList){
            if(p.getHot() != null){
                if(p.getHot().after(new Date(System.currentTimeMillis()))){
                    hotList.add(p);
                }
            }
        }
        return hotList;
    }

}
