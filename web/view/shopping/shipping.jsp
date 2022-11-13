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
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/address-form.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/address-book.css">


    </head>
</head>
<body>
    <c:set var="context" value="${pageContext.request.getContextPath()}"></c:set>
        <!-- =========== HEADER ================ -->
    <jsp:include page="../Layout/Menu.jsp"></jsp:include>

        <style>
            section {
                max-width: 1240px;
                margin: 0 auto;
            }
            .address__list{
                display: flex;
                flex-wrap: wrap;
            }

            .address__item{
                position: relative;
                flex: 1 0 40%;
                background-color: rgb(255, 255, 255);
                box-shadow: none;
                border-radius: 3px;
                border: 1px dashed rgb(0, 153, 0);
                margin: 0px 0px 20px 20px;
                max-width: calc(50% - 20px);
                padding: 10px 15px;
            }

            .address-book .item {
                margin: 0px 0px 20px 20px;
                display: block;
            }
            .action {
                padding-top: 5px;
            }

            .address-book .choose-address{
                display: inline-block;
                margin-right: 7px;
                border: 1px solid rgb(2, 159, 209);
                color: rgb(255, 255, 255);
                background-color: rgb(0, 182, 240);

            }

            .btn {
                height: 31px;
                font-size: 12px;
                color: #fff;
            }

        </style>
        <!-- ========================= SECTION PAGETOP ========================= -->
        <section class="section-pagetop bg">
            <div class="container">
                <h2 class="title-page">Thanh toán</h2>
            </div> <!-- container //  -->

            <div class="card address-book">
                <div class="inner address__list">
                <c:forEach items="${requestScope.addressList}" var="i">
                    <div class="item address__item">
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
                            <form method="post" class="choose-add-form${i.address_id}">
                                <span onclick="document.querySelector('.choose-add-form${i.address_id}').submit();" class="choose-address btn" style="${i.default_address == false?'background: rgb(98, 100, 85);':''}" >Giao đến địa chỉ này</span>
                                <input type="hidden" name="chooseAdd" value="${i.address_id}">                           
                            </form>
                            <a class="edit btn btn-light" href="${context}/customer/address/update?add=${i.address_id}">Sửa</a>
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
            <div class="new">
                <a href="${context}/customer/address/create">
                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"></path></svg>
                    <span>Thêm địa chỉ mới</span>
                </a>
            </div>
        </div>
    </section>


    <!-- ========================= FOOTER ========================= -->
    <jsp:include page="../Layout/Footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="../../js/address.js"></script>
</body>
</html>
