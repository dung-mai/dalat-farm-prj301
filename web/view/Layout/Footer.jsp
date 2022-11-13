<%-- 
    Document   : Footer
    Created on : Jun 17, 2022, 8:59:32 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<footer id="footer">
    <div class="container">
        <div class="footer-left">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/images/mona.png" alt="">
            </div>
            <div class="contact-info">
                <div class="address">
                    <p><i class="fas fa-location-dot"></i> Số 14c QL21, Thôn 3, Thạch Hòa, Thạch Thất, Tp.Hà Nội</p>
                </div>
                <div class="phone-number">
                    <i class="fas fa-phone"></i>
                    <span> +84961595581</span>
                </div>
                <div class="email">
                    <i class="fas fa-envelope"></i> <span> maivandungdungdung@gmail.com</span> <br />
                    <i class="fas fa-envelope"></i> <span> dungmvhe163263@fpt.edu.vn</span>
                </div>
            </div>
        </div>

        <div class="footer-center">
            <div class="ft-center-item">
                <div class="sub-section_title ft-center-item_title">
                    <h4>Giới thiệu</h4>
                </div>
                <div class="ft-center-item_list">
                    <div class="ft-center-item_detail">
                        <li><a href="">Về Dalat Farm</a></li>
                        <li><a href="">Tuyển dụng</a></li>
                        <li><a href="">Hệ thống cửa hàng</a></li>
                    </div>
                </div>
            </div> <!-- item -->

            <div class="ft-center-item">
                <div class="sub-section_title ft-center-item_title">
                    <h4>Dịch vụ khách hàng</h4>
                </div>
                <div class="ft-center-item_list">
                    <div class="ft-center-item_detail">
                        <li><a href="">Chính sách điều khoản</a></li>
                        <li><a href="">Hướng dẫn mua hàng</a></li>
                        <li><a href="">Chính sách thanh toán</a></li>
                        <li><a href="">Chính sách đổi trả</a></li>
                        <li><a href="">Chính sách giao hàng</a></li>
                    </div>
                </div>
            </div> <!-- item -->

            <div class="ft-center-item">
                <div class="sub-section_title ft-center-item_title">
                    <h4>Sản phẩm</h4>
                </div>
                <div class="ft-center-item_list">
                    <div class="ft-center-item_detail">
                        <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c" >
                            <li><a href="${pageContext.request.contextPath}/cua-hang?cid=${p_c.cate_id}">${p_c.name}</a></li>
                            </c:forEach>
                    </div>
                </div>
            </div> <!-- item -->
        </div>

        <div class="footer-right">
            <div class="dangki-email">
                <div class="sub-section_title box-text">
                    <h4>Đăng kí</h4>
                    <p>Đăng ki để nhận được thông tin mới nhất từ chúng tôi.</p>
                </div>
                <div class="form">
                    <form method="POST" class="email-receive-form" action="">
                        <input type="text" name="reg-email" placeholder="Email ...">
                        <button type="submit"><i class="fas fa-paper-plane"></i></button>
                    </form>
                </div>

                <div class="social-icon">
                    <img src="${pageContext.request.contextPath}/images/ic_fb (1).svg" alt="Facebook" title="Follow on Facebook">
                    <img src="${pageContext.request.contextPath}/images/ic_instagram.svg" alt="ic_instagram" title="Follow on Instagram">
                    <img src="${pageContext.request.contextPath}/images/ic_pinterest.svg" alt="ic_pinterest" title="Follow on Printerest">
                    <img src="${pageContext.request.contextPath}/images/ic_ytb.svg" alt="youtube" title="Follow on youtube">
                </div>
            </div>
        </div>
    </div>

    <div class="copyright-footer">
        <p>© Bản quyền thuộc về Mai Van Dung</p>
    </div>
</footer>

