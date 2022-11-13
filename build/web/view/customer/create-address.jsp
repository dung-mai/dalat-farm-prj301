<%-- 
    Document   : edit-address
    Created on : Jul 2, 2022, 10:45:20 AM
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
        <title>Tài khoản của tôi</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <!--<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>-->
        <!--<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>-->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/address-form.css">

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
            
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>

            <div class="page-wrapper">
                <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <%--<jsp:include page="header.jsp"></jsp:include>--%>
                <!--HEADER-->

                <section class="content-main ">

                    <div class="content-header">
                        <h2>Sổ địa chỉ</h2>
                    </div>

                    <div class="Account__StyledAccountLayoutInner-sc-1d5h8iz-1 jXurFV">
                        <div class="fJeMaX">
                            <div class="inner">
                                <c:if test="${requestScope.mess != null}">
                                    <div class="message danger">
                                        <p class="alert-message">${requestScope.mess}</p>
                                    </div>
                                </c:if>
                                <form method="post">
                                    <div class="form-control ">
                                        <label for="fullName" class="input-label">Họ và tên:</label>
                                        <div>
                                            <input type="text" required="" name="fullName" placeholder="Nhập họ và tên" maxlength="50" class="girQwT" value="">
                                        </div>
                                    </div>
                                    <div class="form-control ">
                                        <label for="phone_number" class="input-label">Số điện thoại:</label>
                                        <div>
                                            <input type="text" required="" name="phone_number" placeholder="Nhập số điện thoại" class="girQwT" value="">
                                        </div>
                                    </div>
                                    <div class="form-control">
                                        <label for="city" class="input-label">Tỉnh/Thành phố:</label>
                                        <select name="city" id="city" aria-label=".form-select-sm" required="">
                                            <option value="" selected>Chọn tỉnh thành</option>           
                                        </select>
                                    </div>
                                    <div class="form-control">
                                        <label for="district" class="input-label">Quận huyện:</label>
                                        <select name="district"  id="district" aria-label=".form-select-sm" required="">
                                            <option value="" selected>Chọn quận huyện</option>
                                        </select>
                                    </div>
                                    <div class="form-control">
                                        <label for="ward" class="input-label">Phường xã:</label>
                                        <select name="ward" id="ward" aria-label=".form-select-sm"required="">
                                            <option value="" selected>Chọn phường xã</option>
                                        </select>
                                    </div>
                                    <div class="form-control ">
                                        <label for="detail_address" class="input-label">Địa chỉ:</label>
                                        <div>
                                            <textarea required="" name="detail_address" rows="3" placeholder="Nhập địa chỉ"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-control">
                                        <label class="input-label">&nbsp;</label>
                                        <label class="Checkbox__StyledCheckbox-sc-75m08j-0 etNXAi">
                                            <input name="default_address" type="checkbox" class="checkbox-fake">
                                            <span class="label">Đặt làm địa chỉ mặc định</span>
                                        </label>
                                    </div>
                                    <div class="form-control">
                                        <label class="input-label">&nbsp;</label>
                                        <button type="submit" class="btn-submit">Create</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </section>
            </main>
        </div>
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="../../js/address.js"></script>
    </body>
</html>

