/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shopping;

import DAL.DAO;
import DAL.UserDAO;
import controller.base.Utility;
import controller.auth.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import javax.swing.text.Utilities;
import model.Cart;
import model.Product;
import model.User;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class CheckoutFinish extends HttpServlet {

    String user;
    String pass;
    DAO dao;
    UserDAO userDAO;
    ArrayList<Product> pList;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
        dao = new DAO(user, pass);
        userDAO = new UserDAO(user, pass);
        pList = dao.getProducts();
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
        if (request.getSession().getAttribute("purchase_cart") == null) {
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
        String paymentMethod = request.getParameter("paymentMethod");
        Cart cart = (Cart) request.getSession().getAttribute("purchase_cart");
        User loggedInUser = Utility.getLoginAccount(request, response);
        UserAddress user_add;
        String email;
        if (loggedInUser == null || userDAO.getDefaultAddress(loggedInUser.getUser_id()) == null) {
            String customer_name = request.getParameter("fullName");
            String phone_number = request.getParameter("phone_number");
            email = request.getParameter("email");
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String ward = request.getParameter("ward");
            String detail_address = request.getParameter("detail_address");
            if (loggedInUser == null) {
                user_add = new UserAddress(-1, -1, customer_name, detail_address, city, district, ward, phone_number, true);
            } else {
                user_add = new UserAddress(-1, loggedInUser.getUser_id(), customer_name, detail_address, city, district, ward, phone_number, true);
                String fullAddress = detail_address + ", " + ward + ", " + district + ", " + city;
                userDAO.addAddress(loggedInUser.getUser_id(), customer_name, fullAddress, phone_number, true);
                email = loggedInUser.getEmail();
            }
        } else {
            //set User_add form session
            user_add = (UserAddress) request.getSession().getAttribute("c_Add");
            if (user_add == null) {
                user_add = userDAO.getDefaultAddress(loggedInUser.getUser_id());
            }
            //set email
            email = loggedInUser.getEmail();
        }

        if (cart == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
        } else {

            //Update in database
            String order_code = Utility.getRandomCode();
            dao.addOrder(order_code, email, user_add, cart, paymentMethod);

            //update Cookie For Cart
            Cart current_cart = new Cart(Utility.getStringFromCookie(request, "c_cart"), pList);
            current_cart.removeBuyedItem(cart);
            deleteCookieCart(request, response);  // delete current 

            Cookie c_cart = new Cookie("c_cart", current_cart.cartToStringCookie());  // add new cookie
            c_cart.setPath("/PROJECT_PRJ301");
            c_cart.setMaxAge(30 * 24 * 60 * 60);
            response.addCookie(c_cart);
            Cookie c_cartsize = new Cookie("c_cartsize", String.valueOf(current_cart.getCart().size()));
            c_cartsize.setPath("/PROJECT_PRJ301");
            c_cartsize.setMaxAge(30 * 24 * 60 * 60);
            response.addCookie(c_cartsize);

            //REmove session for Order
            request.getSession().removeAttribute("c_Add");
            request.getSession().removeAttribute("purchase_cart");
            request.setAttribute("order_code", order_code);

            //send email for user
//            SendMail.sendEmail(email, user);
            //go to jsp file
            request.getRequestDispatcher("../view/shopping/order-success.jsp").forward(request, response);
        }

    }

    private void deleteCookieCart(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("c_cart")) {
                    c.setPath("/");
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
                if (c.getName().equals("c_cartsize")) {
                    c.setPath("/");
                    c.setMaxAge(0);
                    response.addCookie(c);
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
