<%-- 
    Document   : cart.jsp
    Created on : Jun 30, 2022, 11:52:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link href="${pageContext.request.getContextPath()}/css/bootstrap.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.getContextPath()}/css/style.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.getContextPath()}/css/cart.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/address-form.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/thanhtoan.css">

    </head>
</head>
<body>
    <c:set var="context" value="${pageContext.request.getContextPath()}"></c:set>
        <!-- =========== HEADER ================ -->
    <jsp:include page="../Layout/Menu.jsp"></jsp:include>

        <!-- ========================= SECTION PAGETOP ========================= -->
        <section class="section-pagetop bg">
            <div class="container">
                <h2 class="title-page">Thanh toán</h2>
            </div> <!-- container //  -->
        </section>

        <!-- ========================= SECTION CONTENT ========================= -->
        <section class="section-content padding-y">
            <div class="container">

                <div class="row">
                    <main class="col-md-9">
                        <div class="card">
                            <div class="package">
                            <c:if test="${sessionScope.purchase_cart == null}">
                                <div class="message danger">
                                    <p class="alert-message"><i class='fas fa-exclamation-triangle'></i>  Giỏ hàng không có sản phẩm nào. Vui lòng thêm sản phẩm</p>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.purchase_cart != null}">
                                <div class="left-content">
                                    <div class="PackageLeadTimestyles__NormalPackageLeadTime-sc-6boi18-0 giCRPo">
                                        <div class="package-title"><img width="24" height="24" alt="icon"
                                                                        src="https://salt.tikicdn.com/ts/upload/ad/b7/93/7094a85d0b6d299f30ed89b03511deb9.png">Gói</div><span
                                            class="package-leadTime">Giao vào Thứ Hai, 11/07</span>
                                    </div>
                                    <div class="package-item-list">
                                        <c:forEach items="${sessionScope.purchase_cart.cart}" var="i">
                                            <div>
                                                <div class="HEIyE">
                                                    <div class="item-icon">
                                                        <picture class="webpimg-container">
                                                            <img src="${pageContext.request.contextPath}/${i.product.thumbnail}" alt="icon" width="48" height="48" class="fWjUGo">
                                                        </picture>
                                                    </div>
                                                    <div class="item-info">
                                                        <div class="item-info__first-line">
                                                            <span class="item-info__product-name" title="${i.product.name}">${i.product.name}</span>
                                                        </div>
                                                        <div class="item-info__second-line">
                                                            <div class="item-info__qty">SL: x${i.quantity}</div>
                                                            <div class="item-info__price">${i.product.promotion_price * i.quantity /1000}00 ₫</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="right-content">
                                    <div class="Fulfillmentstyles__StyledFulfillment-sc-zxj5yf-0 gEhjmR"><svg class="fulfillment-icon" width="24"
                                                                                                              height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                              d="M3 4.5C3 4.08579 3.33579 3.75 3.75 3.75H10.5C10.9142 3.75 11.25 4.08579 11.25 4.5V6.75H16.5C16.8442 6.75 17.1441 6.98422 17.2276 7.3181L17.8939 9.98345L20.5854 11.3292C20.8395 11.4562 21 11.7159 21 12V16.5C21 16.9142 20.6642 17.25 20.25 17.25H17.25C17.25 18.9069 15.9069 20.25 14.25 20.25C12.5931 20.25 11.25 18.9069 11.25 17.25H10.5C10.0858 17.25 9.75 16.9142 9.75 16.5V5.25H3.75C3.33579 5.25 3 4.91421 3 4.5ZM12.8306 16.7635C12.834 16.7546 12.8372 16.7455 12.8402 16.7364C13.0499 16.1609 13.602 15.75 14.25 15.75C14.898 15.75 15.4501 16.1609 15.6598 16.7364C15.6628 16.7455 15.666 16.7546 15.6694 16.7635C15.7216 16.9161 15.75 17.0797 15.75 17.25C15.75 18.0784 15.0784 18.75 14.25 18.75C13.4216 18.75 12.75 18.0784 12.75 17.25C12.75 17.0797 12.7784 16.9161 12.8306 16.7635ZM16.8487 15.75C16.3299 14.8533 15.3604 14.25 14.25 14.25C13.1396 14.25 12.1701 14.8533 11.6513 15.75H11.25V8.25H15.9144L16.5224 10.6819C16.5755 10.8943 16.7188 11.0729 16.9146 11.1708L19.5 12.4635V15.75H16.8487ZM3 8.25C3 7.83579 3.33579 7.5 3.75 7.5H7.5C7.91421 7.5 8.25 7.83579 8.25 8.25C8.25 8.66421 7.91421 9 7.5 9H3.75C3.33579 9 3 8.66421 3 8.25ZM13.5 9C13.9142 9 14.25 9.33579 14.25 9.75V10.5H15C15.4142 10.5 15.75 10.8358 15.75 11.25C15.75 11.6642 15.4142 12 15 12H13.5C13.0858 12 12.75 11.6642 12.75 11.25V9.75C12.75 9.33579 13.0858 9 13.5 9ZM4.5 12C4.5 11.5858 4.83579 11.25 5.25 11.25H7.5C7.91421 11.25 8.25 11.5858 8.25 12C8.25 12.4142 7.91421 12.75 7.5 12.75H5.25C4.83579 12.75 4.5 12.4142 4.5 12ZM6 15.75C6 15.3358 6.33579 15 6.75 15H7.5C7.91421 15 8.25 15.3358 8.25 15.75C8.25 16.1642 7.91421 16.5 7.5 16.5H6.75C6.33579 16.5 6 16.1642 6 15.75Z"
                                              fill="#38383D"></path>
                                        </svg>
                                        <div>
                                            <p class="fulfillment-text">Được giao bởi GHN Smart Logistics (giao từ Hà Nội)</p>
                                            <p class="fulfillment-text fulfillment-text--warning"></p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <div class="payment-method gOWblv">
                            <h3 class="Section__Title-sc-r6ysni-1 styles__StyledTitle-sc-mhfx8n-1 dMMxLl eqwnfr">Chọn hình thức thanh toán
                            </h3>
                            <div class="kPqUSk">
                                <div>
                                    <label class="styles__StyledRadioButton-sc-xm8rtv-0 IYkXU">
                                        <input type="radio" readonly="" form="order-infor" name="paymentMethod" value="cod" class="radio-fake" checked="" onclick="document.getElementById('banking-info').style.display = 'none';">
                                        <span class="label">
                                            <div class="styles__StyledLabel-sc-9jb57b-0 jwHxkx">
                                                <div class="Methodstyles__StyledMethod-sc-ya9clp-0 eydcWx">
                                                    <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-cod.svg" width="32" height="32" alt="icon">
                                                    <div class="method-content">
                                                        <div class="method-content__title"><span>Thanh toán tiền mặt khi nhận hàng</span></div>
                                                        <div class="method-content__sub-title method-content__sub-title--normal"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </span>
                                    </label>
                                </div> <!--  End first item -->

                                <div>
                                    <label class="styles__StyledRadioButton-sc-xm8rtv-0 IYkXU">
                                        <input type="radio"  readonly="" form="order-infor" class="radio-fake" name="paymentMethod" value="banking" onchange="changePaymentMethod(this)">
                                        <span class="label">
                                            <div class="jwHxkx">
                                                <div class="eydcWx">
                                                    <img class="method-icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/icons/checkout/icon-payment-method-credit.svg" width="32" height="32" alt="icon">
                                                    <div class="method-content">
                                                        <div class="method-content__title"><span>Thanh toán chuyển khoản</span></div>
                                                        <div class="method-content__sub-title method-content__sub-title--normal"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </span>
                                    </label>
                                    <div id="banking-info" style="display: none">
                                        <p>
                                            <strong>Mẫu nội dung chuyển khoản:</strong> <br/>
                                            <i>Mã đơn hàng +Tên Khách Hàng + Email </i><br/>
                                        </p>
                                        <p>
                                            <strong>Ngân hàng Vietcombank (Chi nhánh Hà Nội)</strong> <br/>
                                            <span>Tên tài khoản : Mai Văn Dũng</span><br/>
                                            <span>Số tài khoản : 0331000456714</span><br/>
                                        </p>
                                        <p>
                                            <strong>Ngân hàng Paypal</strong> <br/>
                                            <span>Tên tài khoản : Mai Văn Dũng</span><br/>
                                            <span>Số tài khoản : maivandungdungdung@gmail.com</span><br/>
                                        </p>
                                        <p>
                                            <strong>Ngân hàng Paypal</strong> <br/>
                                            <span>Tên tài khoản : Mai Văn Dũng</span><br/>
                                            <span>Số tài khoản : 0961595581</span><br/>
                                        </p>

                                    </div>
                                </div> <!--  End first item -->
                            </div>
                        </div>



                    </div> <!-- card.// -->

                    <div class="customer-order cTGPxG">
                        <div class="block-header">
                            <h3 class="block-header__title">Giao tới</h3>
                            <c:if test="${requestScope.userAddress != null}">
                                <a class="block-header__nav" href="${pageContext.request.contextPath}/checkout/shipping">Thay đổi</a>
                            </c:if>
                        </div>
                        <c:choose>
                            <c:when test="${requestScope.userAddress != null}">
                                <div class="customer_info">
                                    <p class="customer_info__name">${requestScope.userAddress.customer_name}</p> <br/>
                                    <p class="customer_info__phone">${requestScope.userAddress.phone_number}</p>
                                </div>
                                <div class="address">${requestScope.userAddress.getFullAddress()}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="fJeMaX">
                                    <div class="inner">
                                        <div class="form-control ">
                                            <label for="fullName" class="input-label">Họ và tên:</label>
                                            <div>
                                                <input type="text" required="" name="fullName" placeholder="Nhập họ và tên" maxlength="50" class="girQwT" form="order-infor" >
                                            </div>
                                        </div>
                                        <c:if test="${sessionScope.user == null}">
                                            <div class="form-control ">
                                                <label for="email" class="input-label">Email:</label>
                                                <div>
                                                    <input type="email" required="" name="email" placeholder="Nhập email" class="girQwT" form="order-infor" >
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="form-control ">
                                            <label for="phone_number" class="input-label">Số điện thoại:</label>
                                            <div>
                                                <input type="text" required="" name="phone_number" placeholder="Nhập số điện thoại" class="girQwT" form="order-infor" >
                                            </div>
                                        </div>
                                        <div class="form-control">
                                            <label for="city" class="input-label">Tỉnh/Thành phố:</label>
                                            <select name="city" id="city" aria-label=".form-select-sm" required="" form="order-infor" >
                                                <option value="" selected>Chọn tỉnh thành</option>           
                                            </select>
                                        </div>
                                        <div class="form-control">
                                            <label for="district" class="input-label">Quận huyện:</label>
                                            <select name="district"  id="district" aria-label=".form-select-sm" required="" form="order-infor" >
                                                <option value="" selected>Chọn quận huyện</option>
                                            </select>
                                        </div>
                                        <div class="form-control">
                                            <label for="ward" class="input-label">Phường xã:</label>
                                            <select name="ward" id="ward" aria-label=".form-select-sm"required="" form="order-infor" >
                                                <option value="" selected>Chọn phường xã</option>
                                            </select>
                                        </div>
                                        <div class="form-control ">
                                            <label for="detail_address" class="input-label">Địa chỉ:</label>
                                            <div>
                                                <textarea required="" name="detail_address" rows="3" placeholder="Nhập địa chỉ"form="order-infor" ></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </main> <!-- col.// -->


                <aside class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label>Mã khuyến mãi</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="" placeholder="Coupon code">
                                        <span class="input-group-append"> 
                                            <button class="btn btn-primary">Áp dụng</button>
                                        </span>
                                    </div>
                                </div>
                            </form>
                        </div> <!-- card-body.// -->
                    </div>  <!-- card .// -->
                    <div class="card">
                        <div class=" iRKLRb">
                            <ul class="prices__items">
                                <li class="prices__item">
                                    <span class="prices__text">Tạm tính</span>
                                    <span class="prices__value">${sessionScope.purchase_cart.getTotalMoney()/1000}00 ₫</span>
                                </li>
                                <li class="prices__item">
                                    <span class="prices__text">Giảm giá</span>
                                    <span class="prices__value">0đ</span>
                                </li>
                            </ul>
                            <div class="prices__total">
                                <span class="prices__text">Tổng tiền</span>
                                <div class="prices__content">
                                    <span class="prices__value prices__value--final">${sessionScope.purchase_cart.getTotalMoney()/1000}00 ₫</span>
                                    <span
                                        class="prices__value--noted">(Đã bao gồm VAT nếu có)</span>
                                </div>
                            </div>
                            <form method="post" id="order-infor" action="${context}/checkout/finish">
                                <button class="bsEPkA" type="submit" form="order-infor">Mua Hàng</button>
                            </form>
                        </div> <!-- card-body.// -->
                    </div>  <!-- card .// -->
                </aside> <!-- col.// -->
            </div>

        </div> <!-- container .//  -->
    </section>

    <!-- ========================= FOOTER ========================= -->
    <jsp:include page="../Layout/Footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
    <script src="http://localhost:9999/PROJECT_PRJ301/js/address.js"></script>
    <script>
                                            function  changePaymentMethod(checkbox) {
                                                if (checkbox.checked === true) {
                                                    document.getElementById('banking-info').style.display = 'block';
                                                }
                                            }
    </script>
</body>
</html>
