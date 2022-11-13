<%-- 
    Document   : ASIDE
    Created on : Jun 26, 2022, 9:34:22 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="left-aside">
    <div class="aside-top">
        <a href="#">
            <img src="${pageContext.request.contextPath}/images/logo.svg" alt="">
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize">
                <i class="fa-solid fa-bars"></i>
            </button>
        </div>
    </div>

    <div class="aside-body">
        <ul class="menu-aside menu">
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="fa-solid fa-house-user"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/product">
                    <i class="fa-solid fa-bag-shopping"></i>
                    <span class="text">Products</span>
                </a>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/order">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span class="text">Orders</span>
                </a>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/user">
                    <i class="fa-solid fa-user-group"></i>
                    <span class="text">Users</span>
                </a>
            </li>

            <!-- <li class="menu-item has-submenu">
                <a class="menu-link" href="page-transactions-A.html"> <i
                        class="icon material-icons md-monetization_on"></i>
                    <span class="text">Transactions</span>
                </a>
            </li> -->
            <li class="menu-item has-submenu">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/account">
                    <i class="fa-solid fa-gear"></i>
                    <span class="text">Account Setting</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/review">
                    <i class="fa-solid fa-comment-dots"></i>
                    <span class="text">Reviews</span>
                </a>
            </li>
            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/admin/mail">
                    <i class="fa-solid fa-envelope"></i>
                    <span class="text">Quản lí Mail</span> </a>
            </li> 
<!--            <li class="menu-item">
                <a class="menu-link" disabled="" href="#">
                    <i class="fa-solid fa-chart-line"></i>
                    <span class="text">Statistics</span>
                </a>
            </li>-->
        </ul>
    </div>
</aside>
