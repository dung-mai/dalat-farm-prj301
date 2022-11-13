<%-- 
    Document   : cuahang.jsp
    Created on : Jun 11, 2022, 9:22:46 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Trang chủ</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick-theme.css">
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <style>
            body {
                background-color: white;
            }
        </style>

        <!-- Header -->
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>

            <!-- Category page -->
            <div class="section page-title">
                <div class="page-title-inner">
                    <a href="http://mauweb.monamedia.net/vuonrau">Trang chủ</a>
                    <span class="divider">/</span>
                    Cửa hàng
                </div>

                <div class="category-filter">
                    <p class="result-count">
                        Hiển thị 1–12 trong 20 kết quả</p>
                    <form action="" method="get">
                        <select name="order-by" class="order-by">
                            <option value="menu_order" selected="selected">Thứ tự mặc định</option>
                            <option value="popularity">Thứ tự theo mức độ phổ biến</option>
                            <option value="rating">Thứ tự theo điểm đánh giá</option>
                            <option value="date">Mới nhất</option>
                            <option value="price-asc">Thứ tự theo giá: thấp đến cao</option>
                            <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>
                        </select>
                        <input type="hidden" name="paged" value="1">
                    </form>
                </div>
            </div>


            <!---------- MAIN PRODUCT PAGE -------------->
            <div class="section product-page">
                <!--SHOP SIDEBAR - Danh muc san pham -->
            <jsp:include page="Shop-Sidebar.jsp"></jsp:include>

                <div class="shop-container">
                <c:choose>
                    <c:when test="${requestScope.pList.size() == 0}">
                        <h1>Kết quả tìm kiếm cho ${requestScope.qtext}</h1>
                        <h2  style="margin-top: 30px; ">Không có sản phẩm nào trong kho hàng</h2>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="ProductDislay.jsp"></jsp:include>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!--Footer-->
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>


    </body>
    <html>

