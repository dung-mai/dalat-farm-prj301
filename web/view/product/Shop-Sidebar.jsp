<%-- 
    Document   : Shop-Sidebar
    Created on : Jun 18, 2022, 10:19:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="shop-sidebar-container">
    <aside class="shop-sidebar sidebar-category">
        <div class="sidebar_header sidebar-category_header">
            <span>Danh mục sản phẩm</span>
        </div>
        <ul class="sidebar-category_list">
            <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c" >
                <li class="${(p_c.cate_id==requestScope.cid)?"active-category":""}"><a href="cua-hang?cid=${p_c.cate_id}">${p_c.name}</a></li>
                </c:forEach>
        </ul>
    </aside> <!-- first box -->

    <!-- filter -->
    <body>
        <aside class="shop-sidebar sidebar-filter">
            <div class="sidebar_header sidebar-filter_header">
                <span>LỌC THEO GIÁ</span>
            </div>
            <form method="POST">
                <label for="amount">Price range:</label>
                <!--            <input type="text" id="amount" name="filter" style="border:0; color:#f6931f; font-weight:bold;">
                            <input type="submit" value="LỌC">-->
                <div class="range-filter">
                    <div class="price-input">
                        <div class="field">
                            <span>Min</span>
                            <input oninput="filterPrice(${requestScope.cid}, ${requestScope.totalpage}, ${requestScope.pagesize}, ${requestScope.orderBy})"
                                   type="number"  id="inputmin" class="input-min" name="inputmin" value="${requestScope.inputmin}">
                        </div>
                        <div class="separator">-</div>
                        <div class="field">
                            <span>Max</span>
                            <input  oninput="filterPrice(${requestScope.cid}, ${requestScope.totalpage}, ${requestScope.pagesize}, ${requestScope.orderBy})"
                                    type="number"  id="inputmax" class="input-max" name="inputmax" value="${requestScope.inputmax}">
                        </div>
                    </div>
                    <div class="display-range">
                        <div class="slider">
                            <div class="progress"></div>
                        </div>
                        <div class="range-input">
                            <input onchange="filterPrice(${requestScope.cid}, ${requestScope.totalpage}, ${requestScope.pagesize}, ${requestScope.orderBy})"
                                   type="range" class="range-min" min="0" max="500000" value="${requestScope.inputmin}" step="5000">
                            <input onchange="filterPrice(${requestScope.cid}, ${requestScope.totalpage}, ${requestScope.pagesize}, ${requestScope.orderBy})"
                                   type="range" class="range-max" min="0" max="500000" value="${requestScope.inputmax}" step="5000">
                        </div>
                    </div>

                    <input type="submit" value="Lọc">
                </div>
            </form>
        </aside>
</div>
