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
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-10">

                                    <section class="content-body p-xl-4">
                                        <form method="POST">
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <div class="row gx-3">
                                                        <div class="col-6  mb-3">
                                                            <label class="form-label">First name</label>
                                                            <input name="first_name" class="form-control" type="text" placeholder="Type here" value="${sessionScope.user.first_name}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-6  mb-3">
                                                            <label class="form-label">Last name</label>
                                                            <input name="last_name" class="form-control" type="text" placeholder="Type here" value="${sessionScope.user.last_name}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Email</label>
                                                            <!--<input name="email" class="form-control" type="email" placeholder="example@mail.com" value="${sessionScope.user.email}">-->
                                                            <input readonly="readonly" name="email" class="form-control" type="email" placeholder="example@mail.com" value="${sessionScope.user.email}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-6  mb-3">
                                                            <label class="form-label">Phone</label>
                                                            <input name="phone" class="form-control" type="tel" placeholder="+1234567890" value="${sessionScope.user.phone_number}">
                                                        </div> <!-- col .// -->
                                                        <div class="col-lg-12  mb-3">
                                                            <label class="form-label">Address</label>
                                                            <input name="address" class="form-control" type="text" placeholder="Type here" value="${sessionScope.user.address}">
                                                        </div> <!-- col .// -->
                                                    </div> <!-- row.// -->
                                                </div> <!-- col.// -->
                                                <aside class="col-lg-4 avatar-input">
                                                    <figure class="text-lg-center">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.user.avatar != null}">
                                                                <img src="${fn:startsWith(sessionScope.user.avatar,'https')?'':pageContext.request.contextPath.concat("/")}${sessionScope.user.avatar}" class="img-lg mb-3 img-avatar" alt="User Photo" id="show-avatar">
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

                                        <div class="row" style="max-width:460px">
                                            <div class="col-md">
                                                <article class="box mb-3 bg-light">
                                                    <a class="btn float-end btn-outline-danger btn-sm" href="${pageContext.request.contextPath}/admin/account/pass">Change</a>
                                                    <h4>Password</h4>
                                                    <p class="text-muted d-block" style="width:70%">You can reset or change your password by clicking here</p>
                                                </article>
                                            </div> <!-- col.// -->
                                        </div> <!-- row.// -->

                                    </section> <!-- content-body .// -->

                                </div> <!-- col.// -->
                            </div> <!-- row.// -->

                        </div> <!-- card body end// -->
                    </div> <!-- card end// -->


                </section>
                </main>
            </div>
    </body>
</html>
