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
        <title>Danh mục sản phẩm</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet'>
        <!-- FOR JQUERY-->

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


        <script src='js/pagger.js'></script>
        <link href="css/pagger.css" rel="stylesheet" type="text/css"/>
        <link href="css/ui-slider.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <style>
            body {
                background-color: white;
            }
            .active-category{
                background-color: var(--clr-green);
                color: #fff;
            }
        </style>

        <!-- Header -->
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>

            <!-- Category page -->
            <div class="section page-title">
                <div class="page-title-inner">
                    <a href="${pageContext.request.getContextPath()}/home">Trang chủ</a>
                <span class="divider">/</span>
                Cửa hàng
            </div>

            <div class="category-filter">
                <select name="orderBy" class="order-by" onchange="this.form.submit();" form="main-form" style="float:right;">
                    <option name="popularity" value="0" <c:if test="${requestScope.orderBy==0}">selected</c:if>
                            >Thứ tự theo mức độ phổ biến</option>
                        <option name="rating" value="1" 
                        <c:if test="${requestScope.orderBy==1}">selected</c:if>
                            >Thứ tự theo điểm đánh giá</option>
                        <option name="date" value="2" 
                        <c:if test="${requestScope.orderBy==2}">selected</c:if>
                            >Mới nhất</option>
                        <option name="price-asc" value="3" 
                        <c:if test="${requestScope.orderBy==3}">selected</c:if>
                            >Thứ tự theo giá: thấp đến cao</option>
                        <option name="price-desc" value="4" <c:if test="${requestScope.orderBy==4}">selected</c:if>
                                >Thứ tự theo giá: cao xuống thấp</option>
                    </select>
            </div>
        </div>


        <!---------- MAIN PRODUCT PAGE -------------->
        <div class="section product-page">
            <!--SHOP SIDEBAR - Danh muc san pham -->
            <jsp:include page="Shop-Sidebar.jsp"></jsp:include>

                <div class="shop-container">
                <c:choose>
                    <c:when test="${requestScope.dao.getProductsByCate(requestScope.cid).size() == 0}">
                        <h1>Không có sản phẩm nào thuộc danh mục này</h1>
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="ProductDislay.jsp"></jsp:include>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!--Footer-->
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>
        <script src='js/price-range.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script >
//                    function searchProduct(txt) {
//                        document.getElementById('hiddenMin').value = document.getElementById('searchBar').value;
//
//                        $.ajax({
//                            url: '/PROJECT_PRJ301/searchajax',
//                            type: "get",
//                            data: {
//                                q: txt
//                            },
//                            async: true,
//                            success: function (data) {
//                                var row = document.getElementById('product-display');
//                                row.innerHTML = data;
//                            },
//                            error: function (xhr) {
//
//                            }
//                        });
//                    }

                    function filterPrice(cid, total, size, order) {
                        document.getElementById('hiddenMin').value = document.getElementById('inputmin').value;
                        document.getElementById('hiddenMax').value = document.getElementById('inputmax').value;
                        document.getElementById('hiddenSearch').value = document.getElementById('searchbar').value;

                        $.ajax({
                            url: '/PROJECT_PRJ301/price-filter',
                            type: "POST",
                            data: {
                                inputmin: document.getElementById('inputmin').value,
                                inputmax: document.getElementById('inputmax').value,
                                q: document.getElementById('searchbar').value,
                                cid: cid,
                                pagesize: size,
                                orderBy: order,
                                totalpage: total
                            },
                            async: true,
                            success: function (data) {
                                var row = document.getElementById('product-display');
                                row.innerHTML = data;
                            },
                            error: function (xhr) {

                            }
                        });
                    }
        </script>

    </body>
    <html>