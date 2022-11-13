
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .cart-number{
        color: rgb(36, 36, 36);
        background: rgb(253, 216, 53);
        height: 20px;
        right: 20px;
        top: 15px;
        border-radius: 40px;
        display: inline-block;
        text-align: center;
        line-height: 20px;
        font-size: 13px;
        font-weight: 500;
        position: relative;
        padding: 0px 7px;
    }

    .others li>a>i{
        font-size: 30px;
    }
    .sub-menu {
        top: 60px;
    }
    
    .user-sub-menu {
        right 140px;
    }
</style>    
<c:set var="context" value="${pageContext.request.contextPath}"></c:set>
<header id="header">
        <div class="logo">
            <img src="${context}/images/logo.jpg" title="Vườn rau">
    </div>

    <div class="header header_menu">
        <li>
            <a href="${context}/home">TRANG CHỦ</a>
        </li>
        <li><a href="#">GIỚI THIỆU</a></li>
        <li class="product">
            <a href="${context}/cua-hang">SẢN PHẨM
                <i class="fas fa-angle-down"></i>
            </a>
            <ul class="dropdown sub-menu">
                <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c" >
                    <li><a href="${context}/cua-hang?cid=${p_c.cate_id}">${p_c.name}</a></li>
                    </c:forEach>
            </ul>
        </li>
        <li><a href="#">MẸO HAY</a></li>
        <li><a href="#">LIÊN HỆ</a></li>
    </div>

    <div id="1" class="others">
        <li>
            <form role="search" method="POST" class="searchform" action="${context}/cua-hang">
                <input oninput="filterPrice(${requestScope.cid}, ${requestScope.totalpage}, ${requestScope.pagesize}, ${requestScope.orderBy})" id="searchbar" type="text" name="q" placeholder="Tìm kiếm sản phẩm" required value="${requestScope.qtext}">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
        </li>
        <li class="account">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <a href="${context}/login" class="account">
                        <i class="fa-solid fa-user"></i>
                        <div class="account-text-box">
                            <span class="small">Tài khoản</span>
                            <span>${sessionScope.user.first_name} ${sessionScope.user.last_name}</span>
                        </div>
                    </a>
                    <ul class="dropdown user-sub-menu">
                        <li><a href="${context}/customer/account">Thông tin tài khoản</a></li>
                        <li><a href="${context}/customer/order">Theo dõi đơn hàng</a></li>
                        <li><a href="${context}/customer/notification">Thông báo</a></li>
                        <li><a href="${context}/logout">Đăng xuất</a></li>
                    </ul>
                </c:when>
                <c:otherwise>
                    <a href="${context}/login" class="login">
                        <i class="fa-solid fa-user"></i>
                        <span>Đăng nhập</span>
                    </a>
                </c:otherwise>
            </c:choose>
            </li>
        <li><a href="${context}/cart">
                <i class="fa-solid fa-shopping-bag"></i>
                <div>
                    <c:if test="${cookie.c_cartsize.value > 0}">
                        <span class="cart-number">${cookie.c_cartsize.value}</span>
                    </c:if>
                    <span style="margin-bottom: 10px">Giỏ hàng</span>
                </div>
            </a>
        </li>
    </div>
</header>
