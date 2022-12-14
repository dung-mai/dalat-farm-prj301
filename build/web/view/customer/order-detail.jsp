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
                                <h2> ????n h??ng n??y kh??ng t???n t???i </h2>
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
                                                    <span class="badge rounded-pill alert-secondary">Ch??? x??c nh???n</span>
                                                </c:when>
                                                <c:when test="${order.status == 2}">
                                                    <span class="badge rounded-pill alert-primary">??ang giao h??ng</span>
                                                </c:when>
                                                <c:when test="${order.status == 3}">
                                                    <span class="badge rounded-pill alert-success">???? giao</span>
                                                </c:when>
                                                <c:when test="${order.status == 4}">
                                                    <span class="badge rounded-pill alert-danger">???? h???y</span>
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
                                                    <h6 class="mb-1">Th??ng tin ????n h??ng</h6> 
                                                    <p class="mb-1">
                                                        ??V v???n chuy???n: J&T Express <br> Ph????ng th???c thanh to??n: 
                                                        ${order.payment_method == "cod"? "Thanh to??n khi nh???n h??ng": "Chuy???n kho???n"}
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
                                                    <h6 class="mb-1">Th??ng tin giao h??ng</h6>
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
                                                                <td> ${i.price/1000}00 ??</td>
                                                                <td> ${i.quantity} </td>
                                                                <td class="text-end"> ${i.quantity * i.price/1000}00 ?? </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr>
                                                            <td colspan="4"> 
                                                                <article class="float-end">
                                                                    <dl class="dlist"> 
                                                                        <dt>T???ng ????n h??ng:</dt> <dd> <b class="h5">${order.getTotalMoney()/1000}00 ??</b> </dd> 
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
                                        <form method="post" onsubmit="return confirm('B???n c?? th???c s??? mu???n h???y');">
                                            <input type="hidden" name="cancel" value="true">
                                            <button class="btn btn-primary" type="submit">H???y ????n h??ng</button>
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
