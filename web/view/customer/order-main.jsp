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
        <title>Đơn hàng của tôi</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <style>
            .card {
                margin: 20px 80px;
                background: #f8f9fa;
            }

            .krSXKE {
                margin: 12px 0;
                cursor: pointer;
                background: rgb(255, 255, 255);
                width: 100%;
                display: flex;
                flex-direction: row;
                overflow: hidden;
                position: sticky;
                top: 0px;
/*                z-index: 10;*/
            }
            .kJvPK {
                width: 16.6667%;
                padding: 12px 0px;
                text-align: center;
                color: rgb(13, 92, 182);
                border-bottom: 2px solid rgb(13, 92, 182);
            }

            .czMhB {
                width: 16.6667%;
                padding: 12px 0px;
                text-align: center;
                color: rgb(128, 128, 137);
                border-bottom: none;
            }
            .status{
                border-bottom: 1px solid rgb(235, 235, 240);
                padding-bottom: 12px;
                color: rgb(128, 128, 137);
                font-size: 14px;
                font-weight: 600;
                line-height: 20px;
            }

            .btn-more{
                display: flex;
                -webkit-box-pack: start;
                justify-content: flex-start;
                -webkit-box-align: center;
                align-items: center;
                cursor: pointer;
                margin-top: 12px;
            }
            .btn-more p {
                margin: 0;
                padding: 6px 12px;
                border-radius: 4px;
                border: 1px solid rgb(221, 221, 227);
                font-size: 12px;
                font-weight: 400;
                color: rgb(100, 100, 109);
                line-height: 16px;
            }
            .HEIyE {
                display: flex;
                padding: 12px 0px;
                -webkit-box-align: center;
                align-items: center;
                border-bottom: 1px solid rgb(235, 235, 240);
            }

            .HEIyE .item-icon {
                margin-right: 8px;
                flex-shrink: 0;
                border-radius: 4px;
                border: 0.5px solid rgb(238, 238, 238);
            }

            .fWjUGo {
                object-fit: contain;
            }

            .HEIyE .item-info {
                font-size: 14px;
                line-height: 20px;
                color: rgb(128, 128, 137);
                flex: 1 1 0%;
            }

            .HEIyE .item-info__first-line {
                display: flex;
                margin-bottom: 4px;
                padding-right: 20px;
            }

            .HEIyE .item-info__product-name {
                display: -webkit-box;
                overflow: hidden;
                text-overflow: ellipsis;
                -webkit-line-clamp: 1;
                -webkit-box-orient: vertical;
                font-size: 14px;
                color: black;
                font-weight: 500;
                line-height: 1.15;

            }

            .HEIyE .item-info__second-line {
                display: flex;
                -webkit-box-pack: justify;
                justify-content: space-between;
            }
            .giCRPo {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                font-size: 14px;
                line-height: 20px;
                color: rgb(0, 171, 86);
                padding: 0px 4px;
                background-color: rgb(255, 255, 255);
                position: absolute;
                top: 0px;
                left: 12px;
                transform: translateY(-50%);
            }
            .giCRPo .package-title {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                padding: 4px 8px;
                font-weight: 500;
                margin-right: 8px;
                background: rgb(239, 255, 244);
                border: 1px solid rgb(183, 239, 195);
                border-radius: 6px;
            }

            .order-list {
                height: auto;
                overflow: auto;
                display: flex;
                flex-direction: column;
                min-height: calc(100vh - 110px);
            }

            .order-item {
                background: rgb(255, 255, 255);
                border-radius: 4px;
                font-size: 13px;
                margin-bottom: 20px;
                padding: 16px;
                padding-bottom: 0;
            }

            .order-item .main-status::before {
                content: "";
                display: block;
                background: url(https://frontend.tikicdn.com/_desktop-next/static/img/account/delivery_done.png) center center / 20px 20px no-repeat;
                width: 20px;
                height: 20px;
                float: left;
                margin: 0px 6px 0px 0px;
            }

            .order-footer{
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                width: 100%;
                position: relative;
                top: -20px;
            }
            .total-money {
                font-size: 17px;
                display: flex;
                margin-bottom: 12px;
            }

            .total-money .title {
                font-weight: 300;
                color: rgb(128, 128, 137);
                margin-right: 8px;
            }
            .total-money .total {
                font-weight: 500;
                color: rgb(56, 56, 61);
            }

            .button-group {
                display: flex;
                -webkit-box-pack: justify;
                justify-content: space-between;
            }
            .button-group div {
                padding: 12px 8px;
                height: 36px;
                border-radius: 4px;
                border: 1px solid rgb(11, 116, 229);
                font-size: 14px;
                font-weight: 400;
                line-height: 1.4;
                color: rgb(11, 116, 229);
                display: flex;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                cursor: pointer;
                margin-left: 8px;
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>

            <div class="page-wrapper">
                <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <section class="content-main ">

                        <div class="content-header">
                            <h2>Quan lý don hàng</h2>
                        </div>

                        <div class="card">
                            <div class="inner">
                                <div class="krSXKE">
                                    <div  class="styles__Tab-sc-e27b7w-3 kJvPK">Tất cả đơn</div>
                                    <div class="styles__Tab-sc-e27b7w-3 czMhB">Chờ thanh toán</div>
                                    <div class="styles__Tab-sc-e27b7w-3 czMhB">Đang xử lý</div>
                                    <div class="styles__Tab-sc-e27b7w-3 czMhB">Đang vận chuyển</div>
                                    <div class="styles__Tab-sc-e27b7w-3 czMhB">Đã giao</div>
                                    <div class="styles__Tab-sc-e27b7w-3 czMhB">Đã huỷ</div>
                                </div>


                                <div class="order-list">
                                <c:forEach items="${requestScope.orderList}" var="order">
                                    <div class="order-item">
                                        <div color="#808089" class="status">
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
                                        </div>
                                        <div class="item_list_box">
                                            <div class="item_list">
                                                <c:forEach items="${order.orderList}" var="i">
                                                    <div class="HEIyE">
                                                        <div class="item-icon">
                                                            <img src="${pageContext.request.contextPath}/${i.product.thumbnail}" alt="icon" width="80" height="80" class="fWjUGo">
                                                        </div>
                                                        <div class="item-info">
                                                            <div class="item-info__first-line">
                                                                <span class="item-info__product-name" title="${i.product.name}">${i.product.name}</span>
                                                            </div>
                                                            <div class="item-info__second-line">
                                                                <div class="item-info__qty">SL: x${i.quantity}</div>
                                                                <div class="item-info__price">${i.product.promotion_price * i.quantity /1000}00 ₫</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
<!--                                            <div class="btn-more">
                                                <p>Xem thêm 3 sản phẩm</p>
                                            </div>-->
                                            <div class="order-footer">
                                                <div class="total-money">
                                                    <div class="title">Tổng tiền:</div>
                                                    <div class="total">${order.getTotalMoney()/1000}00 ₫</div>
                                                </div>
                                                <div class="button-group">
                                                    <div  onclick="window.location.href = '${context}/customer/order/view?oid=${order.order_id}'">Xem chi tiết</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>

    </body>
</html>
