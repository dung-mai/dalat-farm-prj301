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
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/address-form.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/thanhtoan.css">

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
                                            <form method="post" id="order-infor">
                                                <select  class="form-select d-inline-block" style="max-width: 200px" name="order_status">
                                                    <option value="-1" <c:if test="${order.status==-1}">selected</c:if>>
                                                            Trạng thái</option>
                                                        <option value="1" <c:if test="${order.status==1}">selected</c:if>>
                                                            Chờ xác nhận</option>
                                                        <option value="2" <c:if test="${order.status==2}">selected</c:if>>
                                                            Đang giao hàng</option>
                                                        <option value="3" <c:if test="${order.status==3}">selected</c:if>>
                                                            Giao hàng thành công</option>
                                                        <option value="4" <c:if test="${order.status==4}">selected</c:if>>
                                                            Đã hủy</option>
                                                    </select>
                                                    <button class="btn btn-warning" type="submit">Cập nhật</button>
                                                    <a class="btn btn-close" href="${context}/admin/order"></a>
                                            </form>
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

                                            <button id="choose-change-infor" class="btn btn-primary" onclick="document.getElementById('change-order-info-box').style.display = 'block';">Cập nhật thông tin đơn hàng</button>
                                            <div id="change-order-info-box" style="display: none;">
                                                <c:if test="${requestScope.order.payment_method == 'cod' || (requestScope.order.payment_method == 'banking' && requestScope.order.status == 1)}">
                                                    <div class="payment-method gOWblv">
                                                        <h3 class="Section__Title-sc-r6ysni-1 styles__StyledTitle-sc-mhfx8n-1 dMMxLl eqwnfr">Thay đổi hình thức thanh toán
                                                        </h3>
                                                        <div class="kPqUSk">
                                                            <div>
                                                                <label class="styles__StyledRadioButton-sc-xm8rtv-0 IYkXU">
                                                                    <input type="radio" readonly="" form="order-infor" name="paymentMethod" value="cod" class="radio-fake" ${requestScope.order.payment_method == 'cod'?'checked':''}>
                                                                    <span class="label">
                                                                        <div class="styles__StyledLabel-sc-9jb57b-0 jwHxkx">
                                                                            <div class="Methodstyles__StyledMethod-sc-ya9clp-0 eydcWx">
                                                                                <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-cod.svg" width="32" height="32" alt="icon">
                                                                                <div class="method-content">
                                                                                    <div class="method-content__title"><span>Thanh toán tiền mặt khi nhận hàng</span></div>
                                                                                    <div class="method-content__sub-title method-content__sub-title--normal"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </span>
                                                                </label>
                                                            </div> <!--  End first item -->

                                                            <div>
                                                                <label class="styles__StyledRadioButton-sc-xm8rtv-0 IYkXU">
                                                                    <input type="radio" readonly="" form="order-infor" class="radio-fake" name="paymentMethod" value="banking" ${requestScope.order.payment_method == 'banking'?'checked':''}>
                                                                    <span class="label">
                                                                        <div class="jwHxkx">
                                                                            <div class="eydcWx">
                                                                                <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-credit.svg" width="32" height="32" alt="icon">
                                                                                <div class="method-content">
                                                                                    <div class="method-content__title"><span>Thanh toán chuyển khoản</span></div>
                                                                                    <div class="method-content__sub-title method-content__sub-title--normal"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </span>
                                                                </label>
                                                            </div> <!--  End first item -->
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${requestScope.order.status <= 2}">
                                                    <div class="fJeMaX">
                                                        <div class="inner">
                                                            <div class="form-control ">
                                                                <label for="fullName" class="input-label">Họ và tên:</label>
                                                                <div>
                                                                    <input form="order-infor" type="text" required="" name="fullName" placeholder="Nhập họ và tên" maxlength="50" class="girQwT" value="${requestScope.address.customer_name}">
                                                                </div>
                                                            </div>
                                                            <div class="form-control ">
                                                                <label for="phone_number" class="input-label">Số điện thoại:</label>
                                                                <div>
                                                                    <input  form="order-infor" type="text" required="" name="phone_number" placeholder="Nhập số điện thoại" class="girQwT" value="${requestScope.address.phone_number}">
                                                                </div>
                                                            </div>
                                                            <div class="form-control ">
                                                                <label for="email" class="input-label">Email:</label>
                                                                <div>
                                                                    <input form="order-infor" type="text" required="" name="email" placeholder="Nhập số email" class="girQwT" value="${requestScope.order.email}">
                                                                </div>
                                                            </div>
                                                            <div class="form-control">
                                                                <label for="city" class="input-label">Tỉnh/Thành phố:</label>
                                                                <select form="order-infor" name="city" id="city" aria-label=".form-select-sm" value="${requestScope.address.city}">
                                                                    <option value="${requestScope.address.city}">${requestScope.address.city}</option>         
                                                                    <input type="hidden" id="cityvalue" value="${requestScope.address.city}">
                                                                </select>
                                                            </div>
                                                            <div class="form-control">
                                                                <label for="district" class="input-label">Quận huyện:</label>
                                                                <select form="order-infor" name="district"  id="district" aria-label=".form-select-sm" value="${requestScope.address.district}">
                                                                    <option value="${requestScope.address.district}">${requestScope.address.district}</option>
                                                                    <input type="hidden" id="districtvalue" value="${requestScope.address.district}">
                                                                </select>
                                                            </div>
                                                            <div class="form-control">
                                                                <label for="ward" class="input-label">Phường xã:</label>
                                                                <select form="order-infor" name="ward" id="ward" aria-label=".form-select-sm" value="${requestScope.address.ward}">
                                                                    <option value="${requestScope.address.ward}">${requestScope.address.ward}</option>
                                                                    <input type="hidden" id="wardvalue" value="${requestScope.address.ward}">
                                                                </select>
                                                            </div>
                                                            <div class="form-control ">
                                                                <label for="detail_address" class="input-label">Địa chỉ:</label>
                                                                <div>
                                                                    <textarea  form="order-infor" required="" name="detail_address" rows="3" placeholder="Nhập địa chỉ">${requestScope.address.detail_address}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>  <!-- col// -->
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="http://localhost:9999/PROJECT_PRJ301/js/address.js"></script>

    </body>
</html>

