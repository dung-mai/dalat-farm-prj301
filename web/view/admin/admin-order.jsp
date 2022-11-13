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
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='../js/pagger.js'></script>
        <link href="../css/pagger.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <style>
            .content-main{
                padding: 20px;
            }

            .dropdown-menu-me {
                display: none;
            }

            .dropdown:hover .dropdown-menu-me{
                display: block;
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
                            <h2 class="content-title">Orders two</h2>
                        </div>

                        <div class="row">
                            <div class="col-md-9">
                                <div class="card mb-4">
                                    <header class="card-header">
                                        <form method="post">

                                            <div class="row gx-3">
                                                <!--Search bar-->
                                                <div class="col-lg-4 col-md-6 me-auto">
                                                </div>
                                                <!--Trang thai don hang-->
                                                <div class="col-lg-3 col-md-3 col-6">
                                                    <select class="form-select" name="status" onchange="this.form.submit();">
                                                        <option value="-1" <c:if test="${requestScope.status==-1}">selected</c:if>>
                                                            Trạng thái</option>
                                                        <option value="1" <c:if test="${requestScope.status==1}">selected</c:if>>
                                                            Chờ xác nhận</option>
                                                        <option value="2" <c:if test="${requestScope.status==2}">selected</c:if>>
                                                            Đang giao hàng</option>
                                                        <option value="3" <c:if test="${requestScope.status==3}">selected</c:if>>
                                                            Giao hàng thành công</option>
                                                        <option value="4" <c:if test="${requestScope.status==4}">selected</c:if>>
                                                            Đã hủy</option>
                                                    </select>
                                                </div>

                                                <!-- so luong hien thi mot trang-->
                                                <div class="col-lg-3 col-md-3 col-6">
                                                    <select name="orderBy" class="order-by" onchange="this.form.submit();">
                                                        <option value="0" 
                                                        <c:if test="${requestScope.orderBy==0}">selected</c:if>
                                                            >Mới nhất</option>
                                                        <option value="1" 
                                                        <c:if test="${requestScope.orderBy==1}">selected</c:if>
                                                            >Tổng tiền tăng dần</option>
                                                        <option value="2" <c:if test="${requestScope.orderBy==2}">selected</c:if>
                                                                >Tổng tiền giảm dần</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="hidden" name="page" value="${requestScope.pageindex}">
                                        <input type="hidden" name="pagesize" value="${requestScope.pagesize}">
                                        <input type="hidden" name="order_id" value="${requestScope.order_id}">
                                        <input type="hidden" name="phone_email" value="${requestScope.phone_email}">
                                        <input type="hidden" name="customer_name" value="${requestScope.customer_name}">

                                    </form>

                                </header> <!-- card-header end// -->
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Mã ĐH</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Trạng thái</th>
                                                    <th>Ngày mua hàng</th>
                                                    <th class="text-end"> Action </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.orderList}" var="o">
                                                    <tr>
                                                        <td>${o.order_code}</td>
                                                        <td><b>${o.fullname}</b></td>
                                                        <td>${o.getTotalMoney()/1000}00 đ</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${o.status == 1}">
                                                                    <span class="badge rounded-pill alert-secondary">Chờ xác nhận</span>
                                                                </c:when>
                                                                <c:when test="${o.status == 2}">
                                                                    <span class="badge rounded-pill alert-primary">Ðang giao hàng</span>
                                                                </c:when>
                                                                <c:when test="${o.status == 3}">
                                                                    <span class="badge rounded-pill alert-success">Đã giao</span>
                                                                </c:when>
                                                                <c:when test="${o.status == 4}">
                                                                    <span class="badge rounded-pill alert-danger">Đã hủy</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>${o.order_date}</td>
                                                        <td class="text-end">
                                                            <div class="dropdown">
                                                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light">
                                                                    <i class="fa-solid fa-gear"></i> </a>
                                                                <div class="dropdown-menu">
                                                                    <a class="dropdown-item" href="${context}/admin/order/detail?id=${o.order_id}">Chi tiết</a>
                                                                    <a class="dropdown-item" href="${context}/admin/order/update?id=${o.order_id}">Cập nhật</a>
                                                                    <a class="dropdown-item text-danger" href="#">Xóa</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div> <!-- table-responsive //end -->
                                </div> <!-- card-body end// -->
                            </div> <!-- card end// -->
                        </div>
                        <div class="col-md-3">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h5 class="mb-3">Filter by</h5>
                                    <form method="post">
                                        <div class="mb-4">
                                            <label for="order_id" class="form-label">Order ID</label>
                                            <input type="text" placeholder="Type here" class="form-control" id="order_id" name="order_id" value="${requestScope.order_id}">
                                        </div>
                                        <div class="mb-4">
                                            <label for="order_customer" class="form-label">Tên KH</label>
                                            <input type="text" placeholder="Type here" class="form-control" id="order_customer" name="customer_name" value="${requestScope.customer_name}">
                                        </div>

                                        <div class="mb-4">
                                            <label for="order_created_date" class="form-label">Số điện thoại | Email</label>
                                            <input type="text" placeholder="Type here" class="form-control" id="order_created_date" name="phone_email" value="${requestScope.phone_email}">
                                        </div>
                                        <div class="mb-4">
                                            <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                                        </div>
                                        <input type="hidden" name="page" value="${requestScope.pageindex}">
                                        <input type="hidden" name="pagesize" value="${requestScope.pagesize}">
                                        <input type="hidden" name="orderBy" value="${requestScope.orderBy}">
                                        <input type="hidden" name="status" value="${requestScope.status}">
                                    </form>
                                </div>
                            </div> <!-- card end// -->
                        </div>
                    </div>
                    <!-- .row end// -->

                    <div class="paging-product-list">
                        <form method="POST" style="width: 73%;">
                            <div id="pagger" class="pagger">

                            </div>

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
                            <input type="hidden" name="status" value="${requestScope.status}">
                            <input type="hidden" name="order_id" value="${requestScope.order_id}">
                            <input type="hidden" name="phone_email" value="${requestScope.phone_email}">
                            <input type="hidden" name="customer_name" value="${requestScope.customer_name}">
                        </form>

                    </div>

                </section>
            </main>
        </div>

        <script>
            pagger('pagger',${requestScope.pageindex},${requestScope.totalpage}, 2, ${requestScope.cid});
        </script>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
