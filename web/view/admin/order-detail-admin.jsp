<%-- 
    Document   : admin-product
    Created on : Jun 26, 2022, 9:09:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <style>
            .content-main{
                padding: 20px;
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->
                    <section class="content-main">

                        <div class="content-header">
                            <h2 class="content-title">Order detail</h2>
                        </div>

                        <div class="card">
                        <c:choose>
                            <c:when test="${requestScope.order == null}">
                                <h2> Đơn hàng này không tồn tại </h2>
                            </c:when>
                            <c:otherwise>


                                <header class="card-header">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6">
                                            <span>
                                                <i class="material-icons md-calendar_today fa-solid fa-calendar"></i>
                                                <b><fmt:formatDate type = "both" 
                                                                dateStyle = "medium" timeStyle = "medium" value = "${order.order_date}" /></b>  
                                            </span> <br>
                                            <small class="">Order ID: ${order.order_code}</small>
                                        </div>
                                        <div class="col-lg-6 col-md-6 ms-auto text-md-end">
                                            <c:choose>
                                                <c:when test="${order.status == 1}">
                                                    <span class="badge rounded-pill alert-secondary">Chờ xác nhận</span>
                                                </c:when>
                                                <c:when test="${order.status == 2}">
                                                    <span class="badge rounded-pill alert-primary">Ðang giao hàng</span>
                                                </c:when>
                                                <c:when test="${order.status == 3}">
                                                    <span class="badge rounded-pill alert-success">Đã giao</span>
                                                </c:when>
                                                <c:when test="${order.status == 4}">
                                                    <span class="badge rounded-pill alert-danger">Đã hủy</span>
                                                </c:when>
                                            </c:choose>
                                            <a class="btn btn-primary" href="${context}/admin/order/update?id=${requestScope.order.order_id}">Cập nhật</a>
                                            <a class="btn btn-close" href="${context}/admin/order"></a>
                                        </div>
                                    </div>
                                </header> <!-- card-header end// -->
                                <div class="card-body">

                                    <div class="row mb-5 order-info-wrap">
                                        <div class="col-md-4">
                                            <article class="icontext align-items-start">
                                                <span class="icon icon-sm rounded-circle bg-primary-light">
                                                    <i class="fa-solid fa-user text-primary material-icons md-person"></i>
                                                </span>
                                                <div class="text">
                                                    <h6 class="mb-1">Khách hàng</h6> 
                                                    <p class="mb-1">
                                                        ${order.fullname} <br> ${order.email} <br> ${order.phone_number}
                                                    </p>
                                                </div>
                                            </article> 
                                        </div> <!-- col// -->
                                        <div class="col-md-4">
                                            <article class="icontext align-items-start">
                                                <span class="icon icon-sm rounded-circle bg-primary-light">
                                                    <i class="fa-solid fa-truck-fast text-primary material-icons"></i>
                                                </span>
                                                <div class="text">
                                                    <h6 class="mb-1">Thông tin đơn hàng</h6> 
                                                    <p class="mb-1">
                                                        ĐV vận chuyển: J&T Express <br> Phương thức thanh toán: 
                                                        ${order.payment_method == "cod"? "Thanh toán khi nhận hàng": "Chuyển khoản"}
                                                    </p>
                                                </div>
                                            </article> 
                                        </div> <!-- col// -->
                                        <div class="col-md-4">
                                            <article class="icontext align-items-start">
                                                <span class="icon icon-sm rounded-circle bg-primary-light">
                                                    <i class="text-primary material-icons md-place fa-solid fa-location-dot"></i>
                                                </span>
                                                <div class="text">
                                                    <h6 class="mb-1">Thông tin giao hàng</h6>
                                                    <p class="mb-1">
                                                        ${order.fullname} <br> ${order.phone_number}
                                                        ${order.address}
                                                    </p>
                                                </div>
                                            </article> 
                                        </div> <!-- col// -->
                                    </div> <!-- row // -->

                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="table-responsive">
                                                <table class="table border table-hover table-lg">
                                                    <thead>
                                                        <tr>
                                                            <th width="40%">Product</th>
                                                            <th width="20%">Unit Price</th>
                                                            <th width="20%">Quantity</th>
                                                            <th width="20%" class="text-end">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${order.orderList}" var="i">
                                                            <tr>
                                                                <td>
                                                                    <a class="itemside" href="#">
                                                                        <div class="left">
                                                                            <img src="${context}/${i.product.thumbnail}" width="40" height="40" class="img-xs" alt="Item">
                                                                        </div>
                                                                        <div class="info"> ${i.product.name}   </div>
                                                                    </a>
                                                                </td>
                                                                <td> ${i.price/1000}00 đ</td>
                                                                <td> ${i.quantity} </td>
                                                                <td class="text-end"> ${i.quantity * i.price/1000}00 đ </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr>
                                                            <td colspan="4"> 
                                                                <article class="float-end">
                                                                    <dl class="dlist"> 
                                                                        <dt>Tổng đơn hàng:</dt> <dd> <b class="h5">${order.getTotalMoney()/1000}00 đ</b> </dd> 
                                                                    </dl>
                                                                </article>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div> <!-- table-responsive// -->
                                        </div>  <!-- col// -->
                                        <div class="col-lg-4">
                                        </div> <!-- col// -->
                                    </div>

                                </div> <!-- card-body end// -->
                            </c:otherwise>
                        </c:choose>
                    </div> <!-- card end// -->

                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
