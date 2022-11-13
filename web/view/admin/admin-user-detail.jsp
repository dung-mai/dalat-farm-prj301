<%-- 
    Document   : add-product
    Created on : Jun 26, 2022, 9:41:27 AM
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
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
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

                    <section class="content-main edit-account">

                        <div class="content-header">
                            <h2 class="content-title">Profile setting </h2>
                        </div>

                        <div class="card">
                            <header class="card-header">
                                <div class="row gx-3">
                                    <div class="col-lg-4 col-md-6 me-auto"></div>
                                    <div class="col-lg-2 col-md-3 col-6">
                                        <select class="form-select" name="status" form="main-form">
                                            <option value="-1" <c:if test="${requestScope.user.getStatus()==-1}">selected</c:if>>
                                                Trạng thái</option>
                                            <option value="1" <c:if test="${requestScope.user.getStatus()==1}">selected</c:if>>
                                                Active</option>
                                            <option value="2" <c:if test="${requestScope.user.getStatus()==2}">selected</c:if>>
                                                Inactive</option>
                                            <option value="3" <c:if test="${requestScope.user.getStatus()==3}">selected</c:if>>
                                                Unverified</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-2 col-md-3 col-6">
                                        <div>
                                            <a href="${context}/admin/user" class="btn btn-primary">Quay lại</a>
                                    </div>
                                </div>
                            </div>
                        </header> <!-- card-header end// -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-10">

                                    <section class="content-body p-xl-4">
                                        <form method="POST" id="main-form">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="row gx-3">
                                                        <div class="col-6  mb-3">
                                                            <label class="form-label">First name</label>
                                                            <input name="first_name" class="form-control" type="text" placeholder="Type here" value="${requestScope.user.first_name}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-6  mb-3">
                                                            <label class="form-label">Last name</label>
                                                            <input name="last_name" class="form-control" type="text" placeholder="Type here" value="${requestScope.user.last_name}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Email</label>
                                                            <!--<input name="email" class="form-control" type="email" placeholder="example@mail.com" value="${requestScope.user.email}">-->
                                                            <input name="email" class="form-control" type="email" placeholder="example@mail.com" value="${requestScope.user.email}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Phone</label>
                                                            <input name="phone" class="form-control" type="tel" placeholder="+1234567890" value="${requestScope.user.phone_number}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-12  mb-3">
                                                            <label class="form-label">Address</label>
                                                            <input name="address" class="form-control" type="text" placeholder="Type here" value="${requestScope.user.address}">
                                                        </div> <!-- col .// -->
                                                    </div> <!-- row.// -->
                                                </div> <!-- col.// -->
                                                <aside class="col-lg-4 avatar-input">
                                                    <figure class="text-lg-center">
                                                        <c:choose>
                                                            <c:when test="${requestScope.user.avatar != null}">
                                                                <img src="${fn:startsWith(requestScope.user.avatar,'https')?'':pageContext.request.contextPath.concat("/")}${requestScope.user.avatar}" class="img-lg mb-3 img-avatar" alt="User Photo" id="show-avatar">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${pageContext.request.contextPath}/images/avatardefault.png" class="img-lg mb-3 img-avatar" alt="User Photo" id="show-avatar">
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <figcaption>
                                                            <div class="btn btn-outline-primary" id="my-button" onclick="document.getElementById('my-file').click()">
                                                                <i class="fa-solid fa-cloud-arrow-up" style="color: blue"></i> Upload
                                                            </div>
                                                            <input type="file" accept="image/*" name="avatar" id="my-file" style="display: none" onchange="document.getElementById('show-avatar').src = window.URL.createObjectURL(this.files[0])">
                                                        </figcaption>

                                                    </figure>
                                                </aside> <!-- col.// -->
                                            </div> <!-- row.// -->
                                            <br>
                                            <button class="btn btn-primary" type="submit">Save changes</button>
                                        </form>

                                        <hr class="my-5">

                                    </section> <!-- content-body .// -->

                                </div> <!-- col.// -->
                            </div> <!-- row.// -->

                        </div> <!-- card body end// -->
                    </div> <!-- card end// -->


                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
