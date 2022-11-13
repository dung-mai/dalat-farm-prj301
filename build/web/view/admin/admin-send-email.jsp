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
        <link rel='stylesheet' type='text/css' media='screen' href='https://reactify.theironnetwork.org/main.css'>
        <script src='${pageContext.request.contextPath}/tinymce/tinymce.min.js'></script>
        <script>
            tinymce.init({
                selector: '#myTextarea',
                height: 300,
                plugins: 'print preview paste importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern noneditable help charmap quickbars emoticons',
                imagetools_cors_hosts: ['picsum.photos'],
                menubar: ''
            });
        </script>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <style>
            .mail-input{
                display:flex;
            }
            .text-content{
                text-overflow: ellipsis;
                overflow: hidden;
                width: 360px;
                height: 1.2em;
                white-space: nowrap;
                margin-bottom: 5px;
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

                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="box">
                                            <div class="mail-list-wrap jss1617">
                                                <div class="MuiDrawer-root MuiDrawer-docked">
                                                    <div
                                                        class="MuiPaper-root MuiPaper-elevation0 MuiDrawer-paper jss1610 MuiDrawer-paperAnchorLeft MuiDrawer-paperAnchorDockedLeft">
                                                        <div class="mail-sidebar-wrap">
                                                            <div class="user-wrap d-flex justify-content-between">
                                                                <div class="media align-items-center">
                                                                    <img src="${context}/${sessionScope.user.avatar}"
                                                                     alt="user-profile" class="img-fluid rounded-circle mr-3" width="60" height="60">
                                                                <div class="media-body">
                                                                    <h5 class="text-white mb-0">${sessionScope.user.first_name} ${sessionScope.user.last_name}</h5>
                                                                    <p class="text-white font-xs mb-0">${sessionScope.user.email}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="p-20">
                                                            <div onclick="openCompose()" class="btn btn-danger text-white btn-block font-weight-bold">
                                                                <span class="MuiButton-label">
                                                                    <i class="fa-solid fa-pen zmdi zmdi-edit mr-10 font-lg"></i>
                                                                    <span>Gửi email</span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="rct-scroll"
                                                             style="position: relative; overflow: hidden; width: 100%; height: calc(100vh - 288px);">
                                                            <div onclick="openTemplate()"
                                                                 style="position: absolute; inset: 0px; overflow: scroll; margin-right: -17px; margin-bottom: -17px;">
                                                                <div class="sidebar-filters-wrap">
                                                                    <a class="btn btn-primary text-white btn-block font-weight-bold" href="${context}/admin/mail/detail" >
                                                                        <span>Tạo template</span>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div
                                                                style="position: absolute; height: 6px; transition: opacity 200ms ease 0s; opacity: 0; right: 2px; bottom: 2px; left: 2px; border-radius: 3px;">
                                                                <div
                                                                    style="position: relative; display: block; height: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); width: 0px;">
                                                                </div>
                                                            </div>
                                                            <div
                                                                style="position: absolute; width: 6px; transition: opacity 200ms ease 0s; opacity: 0; right: 2px; bottom: 2px; top: 2px; border-radius: 3px;">
                                                                <div
                                                                    style="position: relative; display: block; width: 100%; cursor: pointer; border-radius: inherit; background-color: rgba(0, 0, 0, 0.2); height: 30px; transform: translateY(0px);">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-8">
                                    <section class="content-body p-xl-4">
                                        <div class="box-text text-success">${requestScope.mess}</div>

                                        <div class="table-responsive" id="list" 
                                             <c:if test="${requestScope.sendemail != null}">style="display: none"</c:if>>
                                            <table class="table table-hover">
                                                <thead>
                                                <td>Tên template</td>
                                                <td>Tiêu đề email</td>
                                                <td>Action</td>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.templateList}" var="t">
                                                        <tr>
                                                            <td>${t.name}</td>
                                                            <td>
                                                                <div class="text-content" style="font-weight: 600;"><strong>${t.title}</strong></div>
                                                                <div class="text-content" style="color:#7e7f81;">${t.message}</div>
                                                            </td>
                                                            <td class="text-end">
                                                                <a href="${context}/admin/mail/detail?id=${t.e_id}" class="btn btn-light">Chi tiết</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                        <form method="POST" id="compose-form"                                 
                                              <c:if test="${requestScope.sendemail == null}">style="display: none"</c:if>>
                                            <div class="col-lg-6">
                                                <div class="mb-3 mail-input" onclick="changeAddress(this)">
                                                    <input name="toalladdress" type="checkbox" >
                                                    <label for="toalladdress">Gửi tất cả người dùng</label>
                                                </div> <!-- col .// -->
                                            </div>
                                            <div class="col-lg-2 col-md-2 ms-auto text-md-end">
                                                <button class="btn btn-warning" onclick="this.form.style.display = 'none';
                                                        document.getElementById('list').style.display = 'block';">Hủy</button>
                                            </div>
                                            <div class="row gx-3">

                                                <div class="mb-3 mail-input">
                                                    <label class="form-label input-group-text" id="receipients">Người nhận</label>
                                                    <input name="toaddress" class="form-control" type="text" placeholder="Type here" required="">
                                                </div> <!-- col .// -->
                                                <div class="mb-3 mail-input" >
                                                    <label class="form-label input-group-text">Tiêu đề</label>
                                                    <input name="title" class="form-control" type="text" placeholder="Type here" required="" value="${requestScope.mail.title}">
                                                </div> <!-- col .// -->
                                                <div class="col-lg-12  mb-3">
                                                    <label class="form-label">Nội dung</label>
                                                    <textarea name="message" id="myTextarea" class="form-control">
                                                        ${requestScope.mail.message}
                                                    </textarea>
                                                </div> <!-- col .// -->
                                            </div> <!-- row.// -->
                                            <br>
                                            <button id="submit-button" class="btn btn-primary" type="submit" onsubmit="this.form.style.display = 'none';
                                                    document.getElementById('list').style.display = 'block'">Gửi</button>
                                        </form>
                                        <hr class="my-5">

                                    </section> <!-- content-body .// -->
                                </div>
                                </section> <!-- content-body .// -->
                            </div> <!-- col.// -->
                        </div> <!-- row.// -->

                    </div> <!-- card body end// -->
                    </div> <!-- card end// -->
                </section>
            </main>
        </div>
        <script>
            function openCompose() {
                document.getElementById('compose-form').style.display = 'block';
                document.getElementById('list').style.display = 'none';
            }

            function changeAddress(box) {
                if (box.checked === true) {
                    document.getElementById('receipients').style.display = 'none';
                } else {
                    document.getElementById('receipients').style.display = 'flex';
                }
            }

        </script>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
