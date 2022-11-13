/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import DAL.DAO;
import controller.base.Utility;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Product;
import model.ProductCategory;
import model.ProductReview;
import model.User;

/**
 *
 * @author Admin
 */
public class ProductDetailController extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // GET Product id
        int pid = Utility.parseIntParameter(request.getParameter("pid"), -1, 0);
        Product product = dao.getProductById(pid);
        if (product != null) {  // If product not null -> set list images
            product.getImagesFromDescription();
        }

        //SET DAO and Product data
        request.setAttribute("dao", dao);
        request.setAttribute("product", product);
        if (product != null) {
            request.setAttribute("category", dao.getPCategoryById(product.getCate_id()).getName());
        }

        //Review controll
        //if user not buy || has review this product => not has permission
        User loggedInUser = Utility.getLoginAccount(request, response);
        if (loggedInUser != null) {
            if (dao.checkUserReviewPemission(pid, loggedInUser.getUser_id()) && !dao.hasUserReviewProduct(pid, loggedInUser.getUser_id())) {
                request.setAttribute("review_pemission", true);
            }
        }

        //get Review List
        ArrayList<ProductReview> reviewList = dao.getReviewByProduct(pid);
        request.setAttribute("reviewList", reviewList);
        int[] stars = countReviewByStar(reviewList);
        request.setAttribute("reviewCount", stars);

//        /* VIEWD PRODUCT LIST*/
//        //get current view list from cookie -> set data
//        String c_viewedproduct = Utility.getStringFromCookie(request, "c_viewedproduct");
//        ArrayList<Product> viewedList = getProductListFromCookie(dao.getProducts(), c_viewedproduct);
//        request.setAttribute("viewdList", viewedList);
//
//        //update cookie
//        int maxsize = Utility.parseIntParameter(getServletContext().getInitParameter("maxViewedProductList"), 5);
//        Cookie c_viewedproduct_new = new Cookie("c_viewedproduct", updateViewList(dao.getProducts(), viewedList, pid, maxsize));
//        c_viewedproduct_new.setMaxAge(30 * 24 * 60 * 60);
//        response.addCookie(c_viewedproduct_new);
        //send to JSP
        request.getRequestDispatcher("view/product/product-detail.jsp").forward(request, response);
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

    private int[] countReviewByStar(ArrayList<ProductReview> list) {
        int[] stars = new int[5];
        for (int i = 1; i <= 5; i++) {
            int count = 0;
            for (ProductReview r : list) {
                if (r.getRating() == i) {
                    count++;
                }
                stars[5 - i] = count;
            }
        }
        return stars;
    }

    private ArrayList<Product> getProductListFromCookie(ArrayList<Product> list, String cookie) {
        ArrayList<Product> pList = new ArrayList<>();
        int[] raw_pList = Utility.parseStringArray(cookie, "-");
        for (int i : raw_pList) {
            Product p = getProductById(list, i);
            if (p != null) {
                pList.add(p);
            }
        }
        return pList;
    }

    private String updateViewList(ArrayList<Product> pList, ArrayList<Product> list, int id, int size) {
        if (list.isEmpty()) {
            return String.valueOf(id);
        }
        String txt = "";
        Product p = getProductById(list, id);
        if (p != null) {
            list.remove(p);
            list.add(0, p);
        } else {
            p = getProductById(pList, id);
            list.add(0, p);
            if (list.size() > size) {
                list.remove(list.size() - 1);
            }
        }

        for (int i = 0; i < list.size(); i++) {
            if (i == 0) {
                txt += String.valueOf(list.get(i));
            } else {
                txt += "-" + list.get(i).getProduct_id();
            }
        }
        return txt;
    }

    private Product getProductById(ArrayList<Product> list, int id) {
        for (Product p : list) {
            if (p.getProduct_id() == id) {
                return p;
            }
        }
        return null;
    }
}
