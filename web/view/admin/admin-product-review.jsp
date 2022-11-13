<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
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
                            <h2 class="content-title">Đánh giá sản phẩm từ khách hàng</h2>
                        </div>
                        <div class="card mb-4">
                            <header class="card-header">
                                <div class="row gx-3">
                                    <div class="col-lg-4 col-md-6 me-auto">
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-6">
                                        <select class="form-select">
                                            <option>Status</option>
                                            <option>Active</option>
                                            <option>Disabled</option>
                                            <option>Show all</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-1 col-md-3 col-6">
                                    </div>
                                </div>
                            </header>
                            <!-- card-header end// -->
                            <div class="card-body">

                                <div class="table-responsive">                 
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#ID</th>
                                                <th>Product</th>
                                                <th>Name</th>
                                                <th>Rating</th>
                                                <th>Date</th>
                                                <th class="text-end">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.reviewList}" var="review">
                                            <tr>
                                                <td>${review.product_id}</td>
                                                <td><b>
                                                        <c:forEach items="${requestScope.pList}" var="p">
                                                            <c:if test="${p.product_id == review.product_id}">
                                                                ${p.name}
                                                            </c:if>
                                                        </c:forEach>
                                                    </b></td>
                                                <td>${review.name}</td>
                                                <td>
                                                    <ul class="rating-stars">
                                                        <c:forEach begin="1" end="${review.rating}">
                                                            <i class="fa-solid fa-star check" style="color: #fbe679"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="${review.rating + 1}" end="5">
                                                            <i class="fa-solid fa-star"></i>
                                                        </c:forEach>
                                                    </ul>
                                                </td>
                                                <td><fmt:formatDate pattern="dd.MM.yyyy" value="${review.created_at}"></fmt:formatDate></td>
                                                <td class="text-end">
                                                    <a href="#" class="btn btn-light">Detail</a>
                                                    <div class="dropdown">
                                                        <a href="#" data-bs-toggle="dropdown" class="btn btn-light" aria-expanded="false"> <i class="fa-solid fa-ellipsis-vertical"></i> </a>
                                                        <div class="dropdown-menu" style="margin: 0px;">
                                                            <a class="dropdown-item" href="#">Chi tiết</a>
                                                            <a class="dropdown-item" href="#">Cập nhật</a>
                                                            <a class="dropdown-item text-danger" href="#">Xóa</a>
                                                        </div>
                                                    </div>
                                                    <!-- dropdown //end -->
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div> <!-- table-responsive//end -->
                        </div>
                        <!-- card-body end// -->
                    </div>
                    <!-- card end// -->
                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
