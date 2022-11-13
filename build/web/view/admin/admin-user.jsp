<%-- 
    Document   : admin-product
    Created on : Jun 26, 2022, 9:09:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src='${pageContext.request.contextPath}/js/pagger.js'></script>
        <link href="${pageContext.request.contextPath}/css/pagger.css" rel="stylesheet" type="text/css"/>
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
                            <h2 class="content-title">Quản lí người dùng</h2>
                            <div>
                                <!--<a href="#" class="btn btn-primary"><i class="material-icons md-plus"></i> Create new</a>-->
                            </div>
                        </div>

                        <div class="card mb-4">
                            <header class="card-header">
                                <div class="row gx-3">
                                    <div class="col-lg-4 col-md-6 me-auto">
                                        <input type="text" name="search" form="main-form" placeholder="Tìm kiếm tên hoặc email" class="form-control" value="${requestScope.search}">
                                </div>
                                <div class="col-lg-2 col-md-3 col-6">
                                    <select class="form-select" name="status" onchange="this.form.submit();" form="main-form">
                                        <option value="-1" <c:if test="${requestScope.status==-1}">selected</c:if>>
                                                Trạng thái</option>
                                            <option value="1" <c:if test="${requestScope.status==1}">selected</c:if>>
                                                Active</option>
                                            <option value="2" <c:if test="${requestScope.status==2}">selected</c:if>>
                                                Inactive</option>
                                            <option value="3" <c:if test="${requestScope.status==3}">selected</c:if>>
                                                Unverified</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-6">
                                    </div>

                                </div>
                            </header> <!-- card-header end// -->
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>User</th>
                                                <th>Email</th>
                                                <th>Status</th>
                                                <th>Registered</th>
                                                <th class="text-end"> Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${requestScope.userList}" var="u">
                                            <tr>
                                                <td width="40%">
                                                    <a href="#" class="itemside">
                                                        <div class="left">
                                                            <c:choose>
                                                                <c:when test="${u.avatar != null}">
                                                                    <img src="${fn:startsWith(u.avatar,'http')?'':context.concat("/")}${u.avatar}" class="img-sm img-avatar" alt="User Photo" id="show-avatar">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="${context}/images/avatardefault.png" class="img-sm img-avatar" alt="User Photo" id="show-avatar">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="info pl-3">
                                                            <h6 class="mb-0 title">${u.first_name} ${u.last_name}</h6>
                                                            <small class="text-muted">ID: #${u.user_id}</small>
                                                        </div>
                                                    </a>
                                                </td>
                                                <td>${u.email}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${u.verified == false}">
                                                            <span class="badge rounded-pill alert-warning">Unverified</span>
                                                        </c:when>
                                                        <c:when test="${u.active == false}">
                                                            <span class="badge rounded-pill alert-danger">Inactive</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge rounded-pill alert-success">Active</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td><fmt:formatDate pattern="dd/MM/yyyy" value="${u.created_at}"></fmt:formatDate></td>
                                                    <td class="text-end">
                                                        <a href="${context}/admin/user/detail?id=${u.user_id}" class="btn btn-light">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> <!-- table-responsive.// -->
                            </div>

                        </div> <!-- card-body end// -->
                    </div> <!-- card end// -->
                    <jsp:include page="PAGING.jsp"></jsp:include>

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
