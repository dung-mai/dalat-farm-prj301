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
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <!--<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/add-product.css'>-->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <style>
            body {
                font-family: Roboto,Helvetica,Arial,sans-serif;
                font-size: 14px;
            }

            .content-header {
                text-align: left;
                margin: 30px 30px 0px;
            }

            .content-header h2 {
                padding-left: 40px;
                text-align: left;
                font-size: 26px;
            }

            .fJeMaX .heading {
                font-size: 19px;
                line-height: 21px;
                font-weight: 300;
                margin: 20px 0px 15px;
            }
            .fJeMaX .inner {
                background-color: rgb(255, 255, 255);
                border-radius: 4px;
                min-height: 400px;
                padding: 30px 20px;
                padding-left: 60px;
            }
            .fJeMaX form {
                width: 600px;
            }

            .fJeMaX .form-control {
                display: flex;
                -moz-box-align: center;
                align-items: center;
                margin: 0px 0px 15px;
                border: none;
                padding: 0;
            }

            .fJeMaX .input-label {
                width: 110px;
                min-width: 110px;
                font-size: 13px;
                color: rgb(51, 51, 51);
            }
            .fJeMaX .form-control > div {
                display: flex;
                flex: 1 1 0%;
                position: relative;
                z-index: 1;
            }
            .fJeMaX .form-control input {
                flex: 1 1 0%;
            }
            .girQwT {
                transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
                border: 1px solid rgb(204, 204, 204);
                border-radius: 4px;
                height: 34px;
                padding: 6px 12px;
                line-height: 34px;
                outline: currentcolor none medium;
            }

            .kpLnYz {
                display: flex;
                margin-right: 15px;
            }

            .kpLnYz .label {
                font-size: 13px;
                line-height: 20px;
                display: flex;
                -moz-box-align: center;
                align-items: center;
            }

            .fJeMaX .form-control textarea {
                border: 1px solid rgb(204, 204, 204);
                border-radius: 4px;
                width: 100%;
                padding: 6px 12px;
            }
            .etNXAi .checkbox-fake {
                width: 18px;
                height: 18px;
                border: 1px solid rgb(120, 120, 120);
                display: inline-block;
                vertical-align: middle;
                margin: 0px 12px 0px 0px;
                position: relative;
                z-index: 1;
                color: rgb(120, 120, 120);
            }
            .etNXAi .label {
                font-size: 14px;
                line-height: 20px;
                display: inline-block;
                vertical-align: middle;
                text-align: justify;
            }
            .fJeMaX .btn-submit {
                border: 0px none;
                width: 176px;
                height: 40px;
                border-radius: 4px;
                color: rgb(74, 74, 74);
                font-size: 14px;
                background-color: rgb(253, 216, 53);
                cursor: pointer;
            }

            .fJeMaX .form-control select {
                margin: 0;
                width: 100%;
                border: 1px solid rgb(204, 204, 204);
                height: 34px;
                padding: 6px 12px;
                line-height: 34px;
                outline: currentcolor none medium;
                background: rgba(0, 0, 0, 0) none repeat scroll 0px center;
                border-radius: 4px;
                box-shadow: none;
            }
        </style>
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
                                    <div class="message ${requestScope.sucess == false? "danger":""}">
                                        <p class="alert-message">${requestScope.mess}</p>
                                    </div>
                                </c:if>
                                <form method="post">
                                    <div class="form-control ">
                                        <label for="fullName" class="input-label">Họ và tên:</label>
                                        <div>
                                            <input type="text" required="" name="fullName" placeholder="Nhập họ và tên" maxlength="50" class="girQwT" value="${requestScope.address.customer_name}">
                                        </div>
                                    </div>
                                    <div class="form-control ">
                                        <label for="phone_number" class="input-label">Số điện thoại:</label>
                                        <div>
                                            <input type="text" required="" name="phone_number" placeholder="Nhập số điện thoại" class="girQwT" value="${requestScope.address.phone_number}">
                                        </div>
                                    </div>
                                    <div class="form-control">
                                        <label for="city" class="input-label">Tỉnh/Thành phố:</label>
                                        <select name="city" id="city" aria-label=".form-select-sm" value="${requestScope.address.city}">
                                            <option value="${requestScope.address.city}">${requestScope.address.city}</option>         
                                            <input type="hidden" id="cityvalue" value="${requestScope.address.city}">
                                        </select>
                                    </div>
                                    <div class="form-control">
                                        <label for="district" class="input-label">Quận huyện:</label>
                                        <select name="district"  id="district" aria-label=".form-select-sm" value="${requestScope.address.district}">
                                            <option value="${requestScope.address.district}">${requestScope.address.district}</option>
                                            <input type="hidden" id="districtvalue" value="${requestScope.address.district}">
                                        </select>
                                    </div>
                                    <div class="form-control">
                                        <label for="ward" class="input-label">Phường xã:</label>
                                        <select name="ward" id="ward" aria-label=".form-select-sm" value="${requestScope.address.ward}">
                                            <option value="${requestScope.address.ward}">${requestScope.address.ward}</option>
                                            <input type="hidden" id="wardvalue" value="${requestScope.address.ward}">
                                        </select>
                                    </div>
                                    <div class="form-control ">
                                        <label for="detail_address" class="input-label">Địa chỉ:</label>
                                        <div>
                                            <textarea required="" name="detail_address" rows="3" placeholder="Nhập địa chỉ">${requestScope.address.detail_address}</textarea>
                                        </div>
                                    </div>
                                    <c:if test="${requestScope.address.default_address == false}">
                                        <div class="form-control">
                                            <label class="input-label">&nbsp;</label>
                                            <label class="Checkbox__StyledCheckbox-sc-75m08j-0 etNXAi">
                                                <input name="default_address" type="checkbox" class="checkbox-fake">
                                                <span class="label">Đặt làm địa chỉ mặc định</span>
                                            </label>
                                        </div>
                                    </c:if>

                                    <div class="form-control">
                                        <label class="input-label">&nbsp;</label>
                                        <button type="submit" class="btn-submit">Cập nhật</button>
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
        <script src="../../js/address_2.js"></script>
    </body>
</html>

