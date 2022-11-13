<%-- 
    Document   : cart.jsp
    Created on : Jun 30, 2022, 11:52:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link href="${pageContext.request.getContextPath()}/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/ui.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/responsive.css" rel="stylesheet">
        <link href="${pageContext.request.getContextPath()}/css/all.min.css" rel="stylesheet">
        <!--<script type="text/javascript" src="js/main.js"></script>-->
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.getContextPath()}/css/style.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.getContextPath()}/css/cart.css">
    </head>
</head>
<body>
    <c:set var="context" value="${pageContext.request.getContextPath()}"></c:set>
        <!-- =========== HEADER ================ -->
    <jsp:include page="../Layout/Menu.jsp"></jsp:include>


        <style>

        </style>
        <!-- ========================= SECTION PAGETOP ========================= -->
        <section class="section-pagetop bg">
            <div class="container">
                <h2 class="title-page">Shopping cart</h2>
            </div> <!-- container //  -->
        </section>

        <!-- ========================= SECTION CONTENT ========================= -->
        <section class="section-content padding-y">
            <div class="container">

                <div class="row">
                    <main class="col-md-9">
                        <div class="card">

                            <table class="table table-borderless table-shopping-cart">
                                <thead class="text-muted">
                                    <tr class="small text-uppercase">
                                        <th scope="col" style="margin-right: 10px;">
                                            <input type="checkbox" name="purchase_all_product" onclick="tickCheckbox(this)" form="purchase-button" value="0">
                                        </th>
                                        <th scope="col">Sản phẩm</th>
                                        <th scope="col" width="120">Giá tiền</th>
                                        <th scope="col" width="120">Số lượng</th>
                                        <th scope="col" width="120">Thành tiền</th>
                                        <th scope="col" class="text-right" width="200"></th>
                                    </tr>
                                </thead> 
                                <tbody>
                                <c:forEach items="${requestScope.cart.cart}" var="i">
                                    <tr style="${i.product.quantity > 0? '':'opacity: 0.5;'}">
                                        <td>
                                            <div class="buy-or-later">
                                                <input type="checkbox" ${i.product.quantity > 0? '':'disabled'} form="purchase-button" name="purchase_product" value="${i.product.product_id}">
                                            </div>
                                        </td>
                                        <td>
                                            <div class="product-name-image">
                                                <img src="${i.product.thumbnail}" class="img-sm" width="80px" height="80px">
                                                <p class="info">
                                                    <a href="${context}/product?pid=${i.product.product_id}" class="title text-dark">${i.product.name}</a>
                                                </p>
                                            </div>
                                        </td>
                                        <td> 
                                            <div class="price-wrap"> 
                                                <span class="price">${i.product.promotion_price/1000}00 ₫</span> 
                                            </div> <!-- price-wrap .// -->
                                        </td>
                                        <td class="change-quantity">
                                            <c:if test="${i.product.quantity > 0}">
                                                <div class="content-box">
                                                    <a href="cartprocess?num=-1&change_pid=${i.product.product_id}">
                                                        <img src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/decrease.svg" alt="decrease"></a>
                                                    <span class="quantity-display">${i.quantity}</span>
                                                    <a href="cartprocess?num=1&change_pid=${i.product.product_id}" class="increase">
                                                        <img src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/increase.svg" alt="increase"><!-- comment --></a>
                                                </div>
                                            </c:if>
                                        </td>
                                        <td> 
                                            <c:if test="${i.product.quantity > 0}">
                                                <div class="total-price-wrap"> 
                                                    <span class="price">${i.product.promotion_price * i.quantity/1000}00 ₫</span> 
                                                </div> <!-- price-wrap .// -->
                                            </c:if>
                                        </td>
                                        <td class="text-right">
                                            <form method="post" action="cartprocess">
                                                <button type="submit" class="btn btn-light"><img src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/trash.svg" alt="deleted"></button>
                                                <input type="hidden" name="remove_pid" value="${i.product.product_id}">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

                        <div class="card-body border-top">
                            <a href="${pageContext.request.contextPath}/cua-hang" class="btn btn-primary float-md-right"> <i class="fa fa-chevron-left"></i> Continue shopping </a>
                        </div>  
                    </div> <!-- card.// -->

                    <div class="alert alert-success mt-3">
                        <p class="icontext"><i class="icon text-success fa fa-truck"></i> Giao hàng trong vòng từ 1 - 3 ngày</p>
                    </div>

                </main> <!-- col.// -->
                <aside class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label>Mã khuyến mãi</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="" placeholder="Coupon code">
                                        <span class="input-group-append"> 
                                            <button class="btn btn-primary">Áp dụng</button>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div> <!-- card-body.// -->
                    </div>  <!-- card .// -->
                    <div class="card">
                        <div class=" iRKLRb">
                            <ul class="prices__items">
                                <li class="prices__item">
                                    <span class="prices__text">Tạm tính</span>
                                    <span class="prices__value">${requestScope.cart.getTotalMoney()/1000}00 ₫</span>
                                </li>
                                <li class="prices__item">
                                    <span class="prices__text">Giảm giá</span>
                                    <span class="prices__value">0đ</span>
                                </li>
                            </ul>
                            <div class="prices__total">
                                <span class="prices__text">Tổng tiền</span>
                                <div class="prices__content">
                                    <span class="prices__value prices__value--final">${requestScope.cart.getTotalMoney()/1000}00 ₫</span>
                                    <span
                                        class="prices__value--noted">(Đã bao gồm VAT nếu có)</span>
                                </div>
                            </div>
                            <form id="purchase-button" action="${context}/checkout/payment" method="POST">
                                <button class="bsEPkA" type="submit">Mua Hàng</button>
                            </form>
                        </div> <!-- card-body.// -->
                    </div>  <!-- card .// -->
                </aside> <!-- col.// -->
            </div>

        </div> <!-- container .//  -->
    </section>

    <!-- ========================= FOOTER ========================= -->
    <jsp:include page="../Layout/Footer.jsp"></jsp:include>
    <script>

        function tickCheckbox(allcheck) {
            var checkboxes = document.getElementsByName('purchase_product');
            for (var checkbox of checkboxes) {
                if (allcheck.checked === true) {
                    checkbox.checked = true;
                } else {
                    checkbox.checked = false;
                }
            }
        }
    </script>
</body>
</html>
