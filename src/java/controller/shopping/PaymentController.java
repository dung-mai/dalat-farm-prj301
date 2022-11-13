/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.shopping;

import DAL.DAO;
import DAL.UserDAO;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Cart;
import model.Item;
import model.Product;
import model.User;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class PaymentController extends HttpServlet {

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
        request.setAttribute("dao", dao);
        User loggedInUser = Utility.getLoginAccount(request, response);

        UserAddress userAdd = (UserAddress) request.getSession().getAttribute("c_Add");
        if (userAdd != null) {
            request.setAttribute("userAddress", userAdd);
        } else {
            if (loggedInUser != null) {
                userAdd = userDAO.getDefaultAddress(loggedInUser.getUser_id());
                if (userAdd != null) {
                    request.setAttribute("userAddress", userAdd);
                }
            }
        }
        request.getRequestDispatcher("../view/shopping/thanhtoan.jsp").forward(request, response);
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
        User loggedInUser = Utility.getLoginAccount(request, response);

        UserAddress userAdd = (UserAddress) request.getSession().getAttribute("c_Add");
        if (userAdd != null) {
            request.setAttribute("userAddress", userAdd);
        } else {
            loggedInUser = Utility.getLoginAccount(request, response);
            if (loggedInUser != null) {
                userAdd = userDAO.getDefaultAddress(loggedInUser.getUser_id());
                if (userAdd != null) {
                    request.setAttribute("userAddress", userAdd);
                }
            }
        }

//        if (request.getSession().getAttribute("purchase_cart") == null) {
        String[] items = request.getParameterValues("purchase_product");
        Cart cart = new Cart(Utility.getStringFromCookie(request, "c_cart"), pList);
        if (items == null) {
            response.sendRedirect(request.getContextPath() + "/cart");
        } else {
            cart = cart.getBuyListFromCart(items);
            request.getSession().setAttribute("purchase_cart", cart);
            request.getRequestDispatcher("../view/shopping/thanhtoan.jsp").forward(request, response);
        }
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

}
