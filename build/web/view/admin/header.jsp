<%-- 
    Document   : header
    Created on : Jun 26, 2022, 9:39:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<header class="main-header navbar">
    <div class="col-search">
        <form role="search" method="POST" class="searchform" action="">
            <input type="text" name="q" placeholder="Tìm kiếm sản phẩm" required>
            <button type="submit"><i class="fas fa-search"></i></button>
        </form>
    </div>
    <div class="col-user">
        <li class="nav-item">
            <a class="nav-link btn-icon" href="#">
                <i class="fa-solid fa-bell"></i>
            </a>
        </li>
        <li class="dropdown nav-item">
            <a class="dropdown-account-toggle" href="#">
                <c:choose>
                    <c:when test="${sessionScope.user.avatar != null}">
                        <img src="${fn:startsWith(sessionScope.user.avatar,'https')?'':pageContext.request.contextPath.concat("/")}${sessionScope.user.avatar}" class="img-user" alt="User Photo">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/images/avatardefault.png" class="img-user" alt="User Photo" id="show-avatar">
                    </c:otherwise>
                </c:choose>
                <i class="fa-solid fa-caret-down"></i>
            </a>
            <div class="dropdown-menu-list dropdown-menu-end">
                <a class="dropdown-item" href="${context}/home">Về trang chủ</a>
                <a class="dropdown-item" href="${context}/admin/account">My profile</a>
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item text-danger" href="${context}/logout">Exit</a>
            </div>
        </li>
    </div>
</header>
