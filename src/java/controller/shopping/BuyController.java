/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shopping;

import DAL.DAO;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Cart;
import model.Product;

/**
 *
 * @author Admin
 */
public class BuyController extends HttpServlet {

    String user;
    String pass;
    DAO dao;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
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
        Cookie[] cookies = request.getCookies();
        String raw_cart = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("c_cart")) {
                    raw_cart += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
                if (c.getName().equals("c_cartsize")) {
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }

        int quantity = Utility.parseIntParameter(request.getParameter("quantity"), 1);
        int pid = Utility.parseIntParameter(request.getParameter("pid"), -1);
        raw_cart += (raw_cart.isEmpty() ? "" : "-") + (pid + ":" + quantity);

        ArrayList<Product> pList = dao.getProducts();
        Cart cart = new Cart(raw_cart, pList);

        Cookie c = new Cookie("c_cart", raw_cart);
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        Cookie c_cartsize = new Cookie("c_cartsize", String.valueOf(cart.getCart().size()));
        c_cartsize.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c_cartsize);
        response.sendRedirect("cua-hang");
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
        Cookie[] cookies = request.getCookies();
        String raw_cart = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("c_cart")) {
                    raw_cart += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
                if (c.getName().equals("c_cartsize")) {
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }

        int quantity = Utility.parseIntParameter(request.getParameter("quantity"), 1);
        int pid = Utility.parseIntParameter(request.getParameter("pid"), -1);
        raw_cart += (raw_cart.isEmpty() ? "" : "-") + (pid + ":" + quantity);

        ArrayList<Product> pList = dao.getProducts();
        Cart cart = new Cart(raw_cart, pList);

        Cookie c = new Cookie("c_cart", raw_cart);
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        Cookie c_cartsize = new Cookie("c_cartsize", String.valueOf(cart.getCart().size()));
        c_cartsize.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c_cartsize);
        response.sendRedirect("product?pid="+pid);
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
