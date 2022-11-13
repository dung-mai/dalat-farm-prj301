<%-- 
    Document   : Ajax
    Created on : Jul 5, 2022, 10:53:37 PM
    Author     : Admin
--%>
<%@page import="import model.*" %>
<%@page import="import java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
DAO dao = new DAO();
        request.setAttribute("dao", dao);
        String qtext = request.getParameter("q");
        ArrayList<Product> pList = dao.getProductsByName(qtext);%>
        <c:set var="pList" value="<%=pList%>"></c:set>

<c:forEach items="${pList}" var="p">
    <div class="section_item shop-product product">
        <div class="box-image">
            <a href="product?pid=${p.product_id}">
                <img src="${p.thumbnail}" alt=""/>
            </a>
        </div>
        <div class="box-text">
            <a href="product?pid=${p.product_id}">
                <h4 class="product_title">${p.name}</h4>
            </a>
            <c:choose>
                <c:when test="${p.promotion_price == p.unitprice}">
                    <div class="price-wrapper">
                        <span>${p.unitprice/1000}00 đ</span>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="product-price">
                        <div class="product-price__current-price">${p.promotion_price/1000}00 ₫</div>
                        <div class="product-price__discount-rate">-${100-Math.ceil(p.promotion_price/p.unitprice*100)}%</div>
                    </div>
                </c:otherwise>
            </c:choose>
            <button><a href="buy?pid=${p.product_id}">Thêm vào giỏ</a></button>
        </div>
    </div> <!-- bài viết-->
</c:forEach>
