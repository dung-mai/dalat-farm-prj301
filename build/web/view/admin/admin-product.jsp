<%-- 
    Document   : admin-product
    Created on : Jun 26, 2022, 9:09:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='../css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='../css/product-admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='../js/pagger.js'></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
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
                            <h2 class="content-title">Products table </h2>
                            <div>
                                <a href="product/add" class="btn btn-primary">
                                    <i class="fa-solid fa-plus"></i>
                                    Create new
                                </a>
                            </div>
                        </div>

                        <div class="content-body">
                            <div class="category-filter">
                                <form method="post">
                                    <select name="cid" class="category-fiter-" onchange="this.form.submit();">
                                        <option value="0">All category</option>
                                    <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c" >
                                        <option value="${p_c.cate_id}" 
                                                <c:if test="${requestScope.cid == p_c.cate_id}">selected</c:if>
                                                > ${p_c.name} </option>
                                    </c:forEach>
                                </select>

                                <select name="orderBy" class="order-by" onchange="this.form.submit();">
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

                                    <input type="hidden" name="pageindex" value="${requestScope.pageindex}">
                                <input type="hidden" name="pagesize" value="${requestScope.pagesize}">
                            </form>
                        </div> <!-- card-header end// -->

                        <div class="product-list">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Category</th>
                                        <th>Supplier</th>
                                        <th>Quantity</th>
                                        <th>Rating</th>
                                        <th class="text-end"> Action </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.pList}" var="p" varStatus="loop">
                                        <tr>
                                            <td>${loop.count}</td>
                                            <td class="product">
                                                <img src="${pageContext.request.getContextPath()}/${p.thumbnail}">
                                                <b>${p.name}</b>
                                            </td>
                                            <td>${p.promotion_price}</td>
                                            <td>${p.cate_id}</td>
                                            <td>${p.supplier_id}</td>
                                            <td>${p.quantity}</td>
                                            <td>${p.rating} *</td>
                                            <td>
                                                <a href=" #" class="btn btn-light">Detail</a>
                                                <a class="btn btn-edit" href="${pageContext.request.getContextPath()}/admin/product/update?pid=${p.product_id}">Edit</a>
                                                <a class="btn btn-delete"  onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="${pageContext.request.getContextPath()}/admin/product/delete?pid=${p.product_id}">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="paging-product-list">
                                <form method="POST">
                                    <div id="pagger" class="pagger"></div>
                                    <div class="nrpp">
                                        <select name="pagesize" onchange="this.form.submit()">
                                            <c:forEach items="${requestScope.nrppArr}" var="p">
                                                <option value="${p}" 
                                                        <c:if test="${requestScope.pagesize==p}">
                                                            selected
                                                        </c:if>
                                                        >${p}</option>
                                            </c:forEach>
                                        </select>
                                        <span>Hiển thị ${(requestScope.pageindex-1)*requestScope.pagesize + 1}–
                                            ${requestScope.totalrecords < requestScope.pageindex*requestScope.pagesize?requestScope.totalrecords:requestScope.pageindex*requestScope.pagesize}
                                            trong ${requestScope.totalrecords} kết quả</span>
                                        <p class="result-count">
                                        </p>
                                    </div>
                                    <input type="hidden" name="orderBy" value="${requestScope.orderBy}">
                                    <input type="hidden" name="cid" value="${requestScope.cid}">
                                </form>

                            </div>
                            <script>
                                pagger('pagger',${requestScope.pageindex},${requestScope.totalpage}, 2, ${requestScope.cid});
                            </script>

                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->


                </section> <!-- content-main end// -->
            </main>
        </div>

    </body>
</html>
