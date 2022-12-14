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
                                                            Tr???ng th??i</option>
                                                        <option value="1" <c:if test="${requestScope.status==1}">selected</c:if>>
                                                            Ch??? x??c nh???n</option>
                                                        <option value="2" <c:if test="${requestScope.status==2}">selected</c:if>>
                                                            ??ang giao h??ng</option>
                                                        <option value="3" <c:if test="${requestScope.status==3}">selected</c:if>>
                                                            Giao h??ng th??nh c??ng</option>
                                                        <option value="4" <c:if test="${requestScope.status==4}">selected</c:if>>
                                                            ???? h???y</option>
                                                    </select>
                                                </div>

                                                <!-- so luong hien thi mot trang-->
                                                <div class="col-lg-3 col-md-3 col-6">
                                                    <select name="orderBy" class="order-by" onchange="this.form.submit();">
                                                        <option value="0" 
                                                        <c:if test="${requestScope.orderBy==0}">selected</c:if>
                                                            >M???i nh???t</option>
                                                        <option value="1" 
                                                        <c:if test="${requestScope.orderBy==1}">selected</c:if>
                                                            >T???ng ti???n t??ng d???n</option>
                                                        <option value="2" <c:if test="${requestScope.orderBy==2}">selected</c:if>
                                                                >T???ng ti???n gi???m d???n</option>
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
                                                    <th>M?? ??H</th>
                                                    <th>T??n kh??ch h??ng</th>
                                                    <th>T???ng ti???n</th>
                                                    <th>Tr???ng th??i</th>
                                                    <th>Ng??y mua h??ng</th>
                                                    <th class="text-end"> Action </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.orderList}" var="o">
                                                    <tr>
                                                        <td>${o.order_code}</td>
                                                        <td><b>${o.fullname}</b></td>
                                                        <td>${o.getTotalMoney()/1000}00 ??</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${o.status == 1}">
                                                                    <span class="badge rounded-pill alert-secondary">Ch??? x??c nh???n</span>
                                                                </c:when>
                                                                <c:when test="${o.status == 2}">
                                                                    <span class="badge rounded-pill alert-primary">??ang giao h??ng</span>
                                                                </c:when>
                                                                <c:when test="${o.status == 3}">
                                                                    <span class="badge rounded-pill alert-success">???? giao</span>
                                                                </c:when>
                                                                <c:when test="${o.status == 4}">
                                                                    <span class="badge rounded-pill alert-danger">???? h???y</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>${o.order_date}</td>
                                                        <td class="text-end">
                                                            <div class="dropdown">
                                                                <a href="#" data-bs-toggle="dropdown" class="btn btn-light">
                                                                    <i class="fa-solid fa-gear"></i> </a>
                                                                <div class="dropdown-menu">
                                                                    <a class="dropdown-item" href="${context}/admin/order/detail?id=${o.order_id}">Chi ti???t</a>
                                                                    <a class="dropdown-item" href="${context}/admin/order/update?id=${o.order_id}">C???p nh???t</a>
                                                                    <a class="dropdown-item text-danger" href="#">X??a</a>
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
                                            <label for="order_customer" class="form-label">T??n KH</label>
                                            <input type="text" placeholder="Type here" class="form-control" id="order_customer" name="customer_name" value="${requestScope.customer_name}">
                                        </div>

                                        <div class="mb-4">
                                            <label for="order_created_date" class="form-label">S??? ??i???n tho???i | Email</label>
                                            <input type="text" placeholder="Type here" class="form-control" id="order_created_date" name="phone_email" value="${requestScope.phone_email}">
                                        </div>
                                        <div class="mb-4">
                                            <button class="btn btn-primary" type="submit">T??m ki???m</button>
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
                                <span>Hi???n th??? ${(requestScope.pageindex-1)*requestScope.pagesize + 1}???
                                    ${requestScope.totalrecords < requestScope.pageindex*requestScope.pagesize?requestScope.totalrecords:requestScope.pageindex*requestScope.pagesize}
                                    trong ${requestScope.totalrecords} k???t qu???</span>
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
