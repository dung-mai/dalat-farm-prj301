<%-- 
    Document   : edit-admin-pass
    Created on : Jul 4, 2022, 10:08:01 AM
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

        <style>
            .edit-account{
                min-height: 800px;
            }

            .card{
                align-items: center
            }

            .card-body {
                width: 600px;
            }

            .content-header {
                margin: 20px 0;
                text-align: center;
            }

            .form-group {
                margin-top: 20px;
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

                    <section class="content-main edit-account">
                        <div class="content-header">
                            <h2 class="content-title">Change Password </h2>
                        </div>

                        <div class="card">
                            <div class="card-body">
                            <c:if test="${requestScope.mess != null}">
                                <div class="message danger">
                                    <p class="alert-message">${requestScope.mess}</p>
                                </div>
                            </c:if>
                            <form method="POST">
                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">Current Password</label>

                                    <div class="col-md-6">
                                        <input id="password" required="required" type="password" class="form-control" name="current_password">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">New Password</label>

                                    <div class="col-md-6">
                                        <input id="new_password" required="required" type="password" class="form-control" name="new_password">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">New Confirm Password</label>

                                    <div class="col-md-6">
                                        <input id="new_confirm_password" required="required" type="password" class="form-control" name="new_confirm_password">
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Update Password
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
    </body>
</html>
