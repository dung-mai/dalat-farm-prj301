/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import DAL.DAO;
import controller.base.Utility;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author Admin
 */
public class AjaxPriceFilter extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        //Get and set Category
        String p_cid_raw = request.getParameter("cid");
        int p_cid = Utility.parseIntParameter(p_cid_raw, -1, 1);   //default value of cid = -1; min = 1;

        //ORDERY BY
        String[] orderByArr = {"viewcount DESC", "rating DESC", "created_at DESC", "promotion_price ASC", "promotion_price DESC"};
        int orderBy = Utility.parseIntParameter(request.getParameter("orderBy"), 0, 0);

        //Filter product
        int priceMin = Utility.parseIntParameter(request.getParameter("inputmin"), 0, 0);
        int priceMax = Utility.parseIntParameter(request.getParameter("inputmax"), 250000, priceMin);

        //search
        String qtext = request.getParameter("q");
        qtext = qtext != null ? qtext : "";

        //PAGING
        String nrppContext = getServletContext().getInitParameter("nrppContext");
        String[] raw_nrppArr = nrppContext.split(",");
        int[] nrppArr = Utility.parseStringArray(nrppContext, ",");
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = Utility.parseIntParameter(request.getParameter("pagesize"), 8, 4);
        int pageindex = Utility.parseIntParameter(request.getParameter("page"), 1, 1);
        int totalrecords = dao.getProductsByAllFilter(p_cid, priceMin, priceMax, qtext).size();  // total record of p_cid category
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalrecords", totalrecords);
        //Get and set List Product
        ArrayList<Product> pList = dao.getProductsByCate(p_cid, pageindex, pagesize, orderByArr[orderBy], priceMin, priceMax, qtext);

        try ( PrintWriter out = response.getWriter()) {
            for (Product p : pList) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<div class=\"section_item shop-product product\">\n"
                        + "            <div class=\"box-image\">\n"
                        + "                <a href=\"product?pid=" + p.getProduct_id() + "\">\n"
                        + "                    <img src='" + p.getThumbnail() + "' alt=\"\"/>\n"
                        + "                </a>\n"
                        + "            </div>\n"
                        + "            <div class=\"box-text\">\n"
                        + "                <a href=\"product?pid=" + p.getProduct_id() + "\">\n"
                        + "                    <h4 class=\"product_title\">" + p.getName() + "</h4>\n"
                        + "                </a>\n");
                if (p.getPromotion_price() == p.getUnitprice()) {
                    out.println("<div class=\"price-wrapper\">\n"
                            + " <span>" + p.getUnitprice() / 1000 + ".000 đ</span>\n"
                            + "</div>\n");
                } else {
                    out.println("<div class=\"product-price\">\n"
                            + "                            <div class=\"product-price__current-price\">" + p.getPromotion_price() / 1000 + ".000 ₫</div>\n"
                            + "                            <div class=\"product-price__discount-rate\">-" + (100 - Math.ceil(p.getPromotion_price() * 100 / p.getUnitprice())) + "%</div>\n"
                            + "                        </div>");
                }
                out.println("  <button><a href=\"buy?pid=" + p.getProduct_id() + "\">Thêm vào giỏ</a></button>\n"
                        + "            </div>\n"
                        + "        </div>");
            }

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

}
