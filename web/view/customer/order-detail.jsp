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
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <style>
            .content-main{
                padding: 20px;
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>

            <div class="page-wrapper">
                <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>

                <main class="main-admin-page">
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


                                <div class="card-header">
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
                                            <a class="btn btn-close" href="${context}/customer/order"></a>
                                        </div>
                                    </div>
                                </div> <!-- card-header end// -->
                                <div class="card-body">

                                    <div class="row mb-5 order-info-wrap">
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
                                    <c:if test="${requestScope.order.status == 1}">
                                        <form method="post" onsubmit="return confirm('Bạn có thực sự muốn hủy');">
                                            <input type="hidden" name="cancel" value="true">
                                            <button class="btn btn-primary" type="submit">Hủy đơn hàng</button>
                                        </form>
                                    </c:if>
                                </div> <!-- card-body end// -->
                            </c:otherwise>
                        </c:choose>
                    </div> <!-- card end// -->

                </section>
            </main>
        </div>
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>

            <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
