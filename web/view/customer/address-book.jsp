<%-- 
    Document   : address-book.jsp
    Created on : Jul 2, 2022, 10:05:13 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Tài khoản của tôi</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <!--<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>-->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/address-book.css">

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <c:set var="context" value="${pageContext.request.contextPath}" />
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>

            <div class="page-wrapper">
                <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

                <section class="content-main ">

                    <div class="content-header">
                        <h2>Sổ địa chỉ</h2>
                    </div>

                    <div class="card address-book">
                        <div class="inner">
                            <div class="new">
                                <a href="${context}/customer/address/create">
                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"></path></svg>
                                    <span>Thêm địa chỉ mới</span>
                                </a>
                            </div>
                            <c:forEach items="${requestScope.addressList}" var="i">
                                <div class="item">
                                    <div class="info">
                                        <div class="name">${i.customer_name}
                                            <span>
                                                <c:if test="${i.default_address == true}">
                                                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 48c110.532 0 200 89.451 200 200 0 110.532-89.451 200-200 200-110.532 0-200-89.451-200-200 0-110.532 89.451-200 200-200m140.204 130.267l-22.536-22.718c-4.667-4.705-12.265-4.736-16.97-.068L215.346 303.697l-59.792-60.277c-4.667-4.705-12.265-4.736-16.97-.069l-22.719 22.536c-4.705 4.667-4.736 12.265-.068 16.971l90.781 91.516c4.667 4.705 12.265 4.736 16.97.068l172.589-171.204c4.704-4.668 4.734-12.266.067-16.971z"></path></svg><span>Địa chỉ mặc định</span>
                                                </c:if>
                                            </span>
                                        </div>
                                        <div class="address">
                                            <span>Địa chỉ: </span>
                                            ${i.detail_address}, ${i.ward}, ${i.district}, ${i.city}
                                        </div>
                                        <div class="phone">
                                            <span>Điện thoại: </span>
                                            ${i.phone_number}
                                        </div>
                                    </div>
                                    <div class="action">
                                        <a class="edit" href="${context}/customer/address/update?add=${i.address_id}">Chỉnh sửa</a>
                                        <c:if test="${i.default_address != true}">
                                            <form onsubmit="return confirm('Bạn có thực sự muốn xóa?');" method="post" action="${context}/customer/address/delete">
                                                <button type="submit" class="delete">Xóa</button>                                               
                                                <input type="hidden" name="add" value="${i.address_id}">                              
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>

                </section>
            </main>
        </div>
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>
    </body>
</html>
