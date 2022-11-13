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
import model.*;

/**
 *
 * @author Admin
 */
public class ProcessCart extends HttpServlet {

    String user;
    String pass;
    DAO dao;
    ArrayList<Product> pList;

    @Override
    public void init() {
        user = getServletContext().getInitParameter("userContext");
        pass = getServletContext().getInitParameter("passContext");
        dao = new DAO(user, pass);
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
        int change_pid = Utility.parseIntParameter(request.getParameter("change_pid"), -1);
        int num = Utility.parseIntParameter(request.getParameter("num"), 0, -1, 1);

        Cart cart = getCartFromCookie(request);

        //Handle change quantity of item
        Product p = cart.getProductById(change_pid, pList);
        if (num == -1 && cart.getQuantityById(change_pid) <= 1) {
            cart.removeItem(change_pid);
        } else if (num == 1) {
            if (cart.getQuantityById(change_pid) >= p.getQuantity()) {
                num = 0;
            }
        }
        cart.addItem(new Item(p, num));

        //UPDATE COOKIE
        deleteCookieCart(request, response);
        Cookie c = new Cookie("c_cart", cart.cartToStringCookie());
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        Cookie c_cartsize = new Cookie("c_cartsize", String.valueOf(cart.getCart().size()));
        c_cartsize.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c_cartsize);

        request.setAttribute("cart", cart);
        response.sendRedirect("cart");
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
        Cart cart = getCartFromCookie(request);

        //handle remove item
        int remove_pid = Utility.parseIntParameter(request.getParameter("remove_pid"), -1);
        if (remove_pid != -1) {
            cart.removeItem(remove_pid);
        }

        //UPDATE COOKIE
        deleteCookieCart(request, response);
        Cookie c = new Cookie("c_cart", cart.cartToStringCookie());
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        Cookie c_cartsize = new Cookie("c_cartsize", String.valueOf(cart.getCart().size()));
        c_cartsize.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c_cartsize);

        request.setAttribute("cart", cart);
        response.sendRedirect("cart");

//        int change_pid = Utility.parseIntParameter(request.getParameter("change_pid"), -1);
//        String raw_minus = request.getParameter("minus");
//        String raw_plus = request.getParameter("plus");
//        int quantity = Utility.parseIntParameter(request.getParameter("quantity"), 0, 0, 1000);
//        int minus = (raw_minus != null && raw_minus.length() != 0) ? -1 : 0;
//        int plus = (raw_plus != null && raw_plus.length() != 0) ? 1 : 0;
//
//
//        //Handle change quantity of item
//        Product p = cart.getProductById(change_pid, pList);
//        if (minus == -1) {
//            if (cart.getQuantityById(change_pid) <= 1) {
//                cart.removeItem(change_pid);
//            } else {
//                cart.addItem(new Item(p, -1));
//            }
//        } else if (plus == 1) {
//            if (cart.getQuantityById(change_pid) >= p.getQuantity()) {
//                request.setAttribute("quantity", quantity);
//            } else {
//                cart.addItem(new Item(p, 1));
//            }
//        }
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

    private Cart getCartFromCookie(HttpServletRequest request) {
//        ArrayList<Product> pList = dao.getProducts();
        Cookie[] cookies = request.getCookies();
        String raw_cart = "";
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("c_cart")) {
                    raw_cart += c.getValue();
                }
            }
        }
        Cart cart = new Cart(raw_cart, pList);
        return cart;
    }

    private void deleteCookieCart(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("c_cart")) {
                    c.setValue("");
                    c.setPath("/");
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
                if (c.getName().equals("c_cartsize")) {
                    c.setValue("");
                    c.setPath("/");
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
    }

}
