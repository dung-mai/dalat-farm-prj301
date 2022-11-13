/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import DAL.DAO;
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
public class SearchController extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");

        //create and set DAO
        DAO dao = new DAO();
        request.setAttribute("dao", dao);

        //Get and set Category
        String p_cid_raw = request.getParameter("cid");
        int p_cid = parseIntParameter(p_cid_raw, -1, 1);   //default value of cid = -1; min = 1;
        request.setAttribute("cid", p_cid);
        String qtext = request.getParameter("q");
        request.setAttribute("qtext", qtext);

//        //PAGING
        int[] nrppArr = {4, 8, 12, 20};
        request.setAttribute("nrppArr", nrppArr);
        int pagesize = parseIntParameter(request.getParameter("pagesize"), 12, 4);
        int pageindex = parseIntParameter(request.getParameter("page"), 1, 1);
        int totalrecords = dao.getProductsByName(qtext).size();  // total record of p_cid category
        int totalpage = (totalrecords % pagesize == 0) ? (totalrecords / pagesize) : (totalrecords / pagesize) + 1;
        pageindex = pageindex > 1 ? pageindex : 1;
        pageindex = pageindex < totalpage ? pageindex : totalpage;
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        
        //get and set product list by search text
        ArrayList<Product> pList = dao.getProductsByName(qtext);
        request.setAttribute("pList", pList);
        request.getRequestDispatcher("view/product/Search.jsp").forward(request, response);
    }

    private int parseIntParameter(String raw_input, int defaultValue, int minValue) {
        raw_input = (raw_input == null || raw_input.length() == 0) ? String.valueOf(defaultValue) : raw_input;
        int number;
        try {
            number = Integer.parseInt(raw_input);
            if (number < minValue) {
                number = defaultValue;
            }
        } catch (NumberFormatException numberFormatException) {
            number = defaultValue;
        }
        return number;
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
