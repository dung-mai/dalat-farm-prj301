<%-- 
    Document   : ASIDE
    Created on : Jun 26, 2022, 9:34:22 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
    aside {
        overflow: auto;
        margin-top: 40px;
    }

    .left-aside .aside-top {
        justify-content: left;
    }

    .aside-top .avatar{
        margin: 0 20px 0 25px;
    }

    .aside-top span{
        font-weight: 600;
    }
    
    .aside-top img{
        width:72px;
        height: 72px;
        border-radius: 50%;
        border: 1px solid #d3d6d8;
    }
    
    .searchform {
        border: none;
    }
</style>
<aside class="left-aside">
    <div class="aside-top">
        <div class="avatar">
            <c:choose>
                <c:when test="${sessionScope.user.avatar != null}">
                    <img src="${fn:startsWith(sessionScope.user.avatar,'https')?'':pageContext.request.contextPath.concat("/")}${sessionScope.user.avatar}" class="img-lg mb-3 img-avatar" alt="User Photo">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/images/avatardefault.png" alt="">
                </c:otherwise>
            </c:choose>

        </div>
        <div>
            <span>${sessionScope.user.first_name} ${sessionScope.user.last_name}</span>
        </div>
    </div>

    <div class="aside-body">
        <ul class="menu-aside menu">
            <li class="menu-item has-submenu">
                <a class="menu-link" href="${pageContext.request.contextPath}/customer/account">
                    <i class="fa-solid fa-user-group"></i>
                    <span class="text">Quản lí tài khoản</span>
                </a>
            </li>
            <li class="menu-item has-submenu">
                <a class="menu-link" href="${pageContext.request.contextPath}/customer/order">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span class="text">Quản lí đơn hàng</span>
                </a>
            </li>

            <li class="menu-item">
                <a class="menu-link" href="${pageContext.request.contextPath}/customer/address">
                    <i class="fa-solid fa-location"></i>
                    <span class="text">Quản lí sổ địa chỉ</span>
                </a>
            </li>
        </ul>
    </div>
</aside>
