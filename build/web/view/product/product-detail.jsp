<%-- 
    Document   : product-detail.jsp
    Created on : Jun 17, 2022, 6:18:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>${requestScope.product.name}</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <!-- <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'> -->
        <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick-theme.css">
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <!--<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>-->
        <link type="text/css" rel="stylesheet" href="css/product-detail.css">

    </head>

    <body>

        <style>
            .comment-item-box {
                display: flex;
                justify-content: space-between;
            }
            .dropdown-toggle{
                white-space:nowrap
            }
            .dropdown-toggle::after{
                display:inline-block;
                margin-left:.255em;
                vertical-align:.255em;
                content:"";
                border-top:.3em solid;
                border-right:.3em solid transparent;
                border-bottom:0;
                border-left:.3em solid transparent
            }
            .dropdown-toggle:empty::after{
                margin-left:0
            }
            .dropdown-menu{
                position:absolute;
                top:100%;
                left:0;
                z-index:1000;
                display:none;
                min-width:10rem;
                padding:.5rem 0;
                margin:.125rem 0 0;
                font-size:1rem;
                color:#141432;
                text-align:left;
                list-style:none;
                background-color:#fff;
                background-clip:padding-box;
                border:1px solid rgba(0,0,0,.15);
                border-radius:.25rem;
                box-shadow:0 .5rem 1rem rgba(0,0,0,.15)
            }
            .dropdown-menu[style]{
                right:auto !important
            }

            .btn-light{
                padding: 5px;
                color:#000;
                background-color:#f8f9fa;
                border-color:#f8f9fa;
                box-shadow:inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075)
            }
            .btn-light:hover{
                color:#000;
                background-color:#f9fafb;
                border-color:#f9fafb
            }
            .btn-check:focus+.btn-light,.btn-light:focus{
                color:#000;
                background-color:#f9fafb;
                border-color:#f9fafb;
                box-shadow:inset 0 1px 0 rgba(255,255,255,.15),0 1px 1px rgba(0,0,0,.075),0 0 0 4px rgba(211,212,213,.5)
            }
            .btn-check:checked+.btn-light,.btn-check:active+.btn-light,.btn-light:active,.btn-light.active,.show>.btn-light.dropdown-toggle{
                color:#000;
                background-color:#f9fafb;
                border-color:#f9fafb
            }
            .btn-check:checked+.btn-light:focus,.btn-check:active+.btn-light:focus,.btn-light:active:focus,.btn-light.active:focus,.show>.btn-light.dropdown-toggle:focus{
                box-shadow:inset 0 3px 5px rgba(0,0,0,.125),0 0 0 4px rgba(211,212,213,.5)
            }
            .btn-light:disabled,.btn-light.disabled{
                color:#000;
                background-color:#f8f9fa;
                border-color:#f8f9fa
            }
            .dropdown-menu.show{
                display:block
            }
            .dropdown-item{
                display:block;
                width:100%;
                padding:.25rem 1rem;
                clear:both;
                font-weight:400;
                color:#141432;
                text-align:inherit;
                text-decoration:none;
                white-space:nowrap;
                background-color:transparent;
                border:0
            }
            .dropdown-item:hover,.dropdown-item:focus{
                color:#12122d;
                background-color:#f8f9fa
            }
            .dropdown-item.active,.dropdown-item:active{
                color:#fff;
                text-decoration:none;
                background-color:#3167eb
            }
            .dropdown-item.disabled,.dropdown-item:disabled{
                color:#6c757d;
                pointer-events:none;
                background-color:transparent
            }
            .dropdown-menu-dark .dropdown-item:hover,.dropdown-menu-dark .dropdown-item:focus{
                color:#fff;
                background-color:rgba(255,255,255,.15)
            }
            .dropdown-menu-dark .dropdown-item.active,.dropdown-menu-dark .dropdown-item:active{
                color:#fff;
                background-color:#3167eb
            }
            .dropdown-menu-dark .dropdown-item.disabled,.dropdown-menu-dark .dropdown-item:disabled{
                color:#adb5bd
            }
            .text-danger{
                color:#f30000 !important
            }
        </style>
        <c:set var="context" value="${pageContext.request.contextPath}"></c:set>
            <!-- Header -->
        <jsp:include page="../Layout/Menu.jsp"></jsp:include>


            <div class="breadcrumb">
                <a href="${pageContext.request.getContextPath()}/home" class="breadcrumb-item">
                <span>Trang chủ </span>
            </a>
            <span class="icon icon-next"><i class="fas fa-solid fa-angle-right"></i></span>
            <a href="${pageContext.request.getContextPath()}/cua-hang?cid=${requestScope.product.cate_id}" class="breadcrumb-item">
                <span> ${requestScope.category}</span>
            </a>
            <span class="icon icon-next"><i class="fas fa-solid fa-angle-right"></i></span>
            <a href="" class="breadcrumb-item">
                <span> ${requestScope.product.name}</span>
            </a>
        </div>

        <c:choose>
            <c:when test="${requestScope.product == null}">
                <h1 style="height: 500px">Sản phẩm này không tồn tại</h1>
            </c:when>
            <c:otherwise>
                <div class="product-content section">
                    <div class="product-content-left">
                        <div class="product-content-left-big-image">
                            <img src="${requestScope.product.thumbnail}" alt="" id="product-left-big-image">
                        </div>
                        <div class="product-content-left review-image__list">
                            <c:forEach items="${requestScope.product.images}" var="i">
                                <div class="image-container">
                                    <img src="${i}" alt="Hinh anh san pham"onclick="changeImage(this);">
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="product-content-right">
                        <div class="product-content-right-product-name">
                            <h3>${requestScope.product.name}</h3>
                        </div>
                        <div class="product-rating">
                            <div class="rating">
                                <c:forEach begin="1" end="${requestScope.product.rating}">
                                    <i class="fa-solid fa-star check"></i>
                                </c:forEach>
                                <c:forEach begin="${requestScope.product.rating + 1}" end="5">
                                    <i class="fa-solid fa-star"></i>
                                </c:forEach>
                            </div>
                            <span>Đã bán 200+</span>
                        </div>

                        <div class="product-price">
                            <div class="product-price__current-price">${requestScope.product.promotion_price/1000}00 ₫</div>
                            <div class="product-price__init-price">${requestScope.product.unitprice/1000}00 ₫</div>
                            <div class="product-price__discount-rate">-${100-Math.ceil(requestScope.product.promotion_price/requestScope.product.unitprice*100)}%</div>
                        </div>

                        <form action="buy" method="post">
                            <div class="quantity-button">
                                <span>Số lượng</span>
                                <input type="button" value="-" class="minus button" onclick="adjustQuantityButton(this)">
                                <input class="quantity-display" type="number" min="1" max="999" name="quantity" value="1" size="4" pattern="[0-9]*"
                                       inputmode="numeric" title="SL">
                                <input type="button" value="+" class="plus button" onclick="adjustQuantityButton(this)">
                            </div>

                            <div class="add-to-cart">
                                <c:choose>
                                    <c:when test="${requestScope.product.quantity > 0}">
                                        <button type="submit" class="btn-add-to-cart">Thêm vào giỏ</button>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="btn-add-to-cart">Đã hết hàng</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <input type="hidden" name="pid" value="${requestScope.product.product_id}">
                        </form>
                        <div class="style__StyledCustomerBenefits-sc-4w35vj-0 dcoZYl">
                            <div class="benefit-item"><img alt="compensation-icon"
                                                           src="https://salt.tikicdn.com/ts/upload/2c/48/44/720434869e103b03aaaf1a104d91ad25.png"
                                                           height="32" width="32"><span>Hoàn tiền<br><b>111%</b><br>nếu hàng giả</span></div>
                            <div class="benefit-item"><img alt="compensation-icon"
                                                           src="https://salt.tikicdn.com/ts/upload/4b/a1/23/1606089d5423e5cba05e3820ad39708e.png"
                                                           height="32" width="32"><span>Mở hộp<br>kiểm tra<br>nhận hàng</span></div>
                            <div class="benefit-item"><img alt="compensation-icon"
                                                           src="https://salt.tikicdn.com/ts/upload/63/75/6a/144ada409519d72e2978ad2c61bc02a7.png"
                                                           height="32" width="32"><span>Đổi trả trong<br><b>30 ngày</b><br>nếu sp lỗi</span></div>
                        </div>
                    </div>
                </div>

                <!--ADDITION INFORMATION-->
                <div class="product-detail-addtion">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item nav-infor">
                            <a class="nav-link ${requestScope.commentSide == null?'active':''}" onclick="switchPill()" id="infor-tab" role="tab" aria-controls="home" aria-selected="">Thông tin thực phẩm</a>
                        </li>

                        <li class="nav-item nav-review">
                            <a class="nav-link ${requestScope.commentSide != null?'active':''}" id="review-tab" onclick="switchPill()" role="tab" aria-controls="profile" aria-selected="${requestScope.commentSide  != null ?'true':'false'}">Bình luận</a>
                        </li>
                    </ul>

                    <div class="content-box">
                        <div class="product-infor" style="display: ${requestScope.commentSide != null?'none':'block'}">
                            ${requestScope.product.detail}
                        </div>
                        <div class="review-rating" style="display: ${requestScope.commentSide == null?'none':'block'}">

                            <!--REVIEW OVERVIEW-->
                            <div class="product-rating-overview">
                                <div class="review-rating__summary">
                                    <div class="review-rating__point">${requestScope.product.rating}</div>
                                    <div class="review-rating__stars">
                                        <div class="star-container">
                                            <c:forEach begin="1" end="${requestScope.product.rating}">
                                                <i class="fa-solid fa-star check"></i>
                                            </c:forEach>
                                            <c:forEach begin="${requestScope.product.rating + 1}" end="5">
                                                <i class="fa-solid fa-star"></i>
                                            </c:forEach>

                                        </div>
                                        <div class="review-rating__total">${requestScope.reviewList.size()} nhận xét</div>
                                    </div>
                                </div><!-- SUMary end -->

                                <div class="review-rating__detail">
                                    <c:forEach items="${requestScope.reviewCount}" var="r" varStatus="loop">
                                        <div class="review-rating__level">
                                            <div class="star-container">
                                                <c:forEach begin="1" end="${5 - loop.index}">
                                                    <span><i class="fa-solid fa-star check"></i></span>
                                                    </c:forEach>
                                                    <c:forEach begin="1" end="${loop.index}">
                                                    <span><i class="fa-solid fa-star"></i></span>
                                                    </c:forEach>
                                            </div>
                                            <div class="style__StyledProcessBar-sc-10ol6xi-2 irgthR">
                                                <div style="width: ${(r * 100) /requestScope.reviewList.size() }%;"></div>
                                            </div>
                                            <div class="review-rating__number">${r}</div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <c:if test="${requestScope.review_pemission != null}">
                                    <div class="review-rating__btn" onclick="openReviewBox()">Viết Đánh Giá</div>
                                </c:if>
                            </div>   <!-- End rating HEADER -->
                            <c:if test="${requestScope.product.rating == 0}">
                                <h2>  Chưa có đánh giá nào cho sản phẩm này</h2>
                            </c:if>

                            <div class="write-review">
                                <div class="header">
                                    <p>Đánh giá sản phẩm</p>
                                    <div class="close"onclick="closeReviewBox()">
                                        <i class="fa-solid fa-xmark"></i>
                                    </div>
                                </div>
                                <form action="${context}/product/review" method="post">
                                    <div class="star-box">
                                        <div class="stars" onclick="changeContent()">
                                            <input class="star star-5" id="star-5" type="radio" name="star"  required="" value="5" />
                                            <label class="star star-5" for="star-5"></label>
                                            <input class="star star-4" id="star-4" type="radio" name="star" value="4" />
                                            <label class="star star-4" for="star-4"></label>
                                            <input class="star star-3" id="star-3" type="radio" name="star" value="3" />
                                            <label class="star star-3" for="star-3"></label>
                                            <input class="star star-2" id="star-2" type="radio" name="star" value="2" />
                                            <label class="star star-2" for="star-2"></label>
                                            <input class="star star-1" id="star-1" type="radio" name="star" value="1" />
                                            <label class="star star-1" for="star-1"></label>
                                        </div>
                                        <span class="star-content"></span>
                                    </div>
                                    <textarea rows="3" required="" name="reviewDetail" placeholder="Chia sẻ thêm đánh giá về sản phẩm" class="write-review__input"></textarea>
                                    <button type="submit" class="write-review__button write-review__button--submit">
                                        <span>Gửi đánh giá</span>
                                    </button>
                                    <input type="hidden" name="pid" value="${requestScope.product.product_id}">
                                </form>
                            </div>

                            <!-- COMMENT LIST -->
                            <div class="comment__list">
                                <c:forEach items="${requestScope.reviewList}" var="review">
                                    <div class="comment-item-box">
                                        <div class="shop-product-rating">
                                            <div class="shop-avatar">
                                                <img src="${context}/images/avatardefault.png">
                                                <span class="shop-product-rating__author-name">${review.name}</span>
                                            </div>
                                            <div class="shop-product-rating__main" id="old-comment${review.review_id}">
                                                <div class="repeat-purchase-con">
                                                    <div class="shop-product-rating__rating">
                                                        <span>
                                                            <c:forEach begin="1" end="${review.rating}">
                                                                <i class="fa-solid fa-star check"></i>
                                                            </c:forEach>
                                                            <c:forEach begin="${review.rating + 1}" end="5">
                                                                <i class="fa-solid fa-star"></i>
                                                            </c:forEach>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="shop-product-rating__time">
                                                    ${review.created_at}
                                                    <div class="review-comment__seller-name">
                                                        <span class="review-comment__check-icon"></span>Đã mua hàng
                                                    </div>
                                                </div>
                                                <div class="Em3Qhp">${review.detail}</div>
                                            </div>
                                            <c:if test="${sessionScope.user.user_id == review.user_id}">
                                                <form action="${context}/product/review" method="post"  id="change-review-form${review.review_id}" style="display: none;min-width: 500px;">
                                                    <div class="star-box">
                                                        <div class="stars" >
                                                            <c:forEach begin="1" end="5" varStatus="loop">
                                                                <input class="star star-${6 - loop.count}" id="star-${review.review_id}-${6 - loop.count}" type="radio" name="star"  required="" value="${6 - loop.count}" ${review.rating == (6 - loop.count)?'checked':''}/>
                                                                <label class="star star-${6 - loop.count}" for="star-${review.review_id}-${6 - loop.count}" onclick="document.getElementById('star-${review.review_id}-${6 - loop.count}').checked = true;"></label>
                                                            </c:forEach>
                                                        </div>
                                                        <span class="star-content"></span>
                                                    </div>
                                                    <textarea style="display: inline-block" required="" name="reviewDetail" class="write-review__input">${review.detail}</textarea>
                                                    <button type="submit" class="btn" style="color: #fff; background: #0080ff;" style="display: inline-block">
                                                        <span>Gửi</span>
                                                    </button>
                                                    <span class="btn" style="color: #fff;background: #d8b83dfc;padding: 0 3px;margin-left: 10px;" style="display: inline-block" onclick="cancelChangeComment(${review.review_id})">
                                                        <span>Hủy</span>
                                                    </span>
                                                    <input type="hidden" value="true" name="update">
                                                    <input type="hidden" name="rid" value="${review.review_id}">
                                                    <input type="hidden" name="pid" value="${requestScope.product.product_id}">
                                                </form>
                                            </c:if>
                                        </div>

                                        <c:if test="${sessionScope.user.user_id == review.user_id}">
                                            <div class="dropdown">
                                                <a href="" data-bs-toggle="dropdown" class="btn btn-light">
                                                    <i class="fa-solid fa-ellipsis-vertical"></i></a>                                        
                                                <div class="dropdown-menu">
                                                    <div class="dropdown-item" onclick="changeComment(${review.review_id})">Chỉnh sửa</div>
                                                    <form action="${context}/product/review" method="post" onsubmit="return confirm('Bạn có thực sự muốn xóa?');">
                                                        <input type="hidden" name="delete" value="true">
                                                        <input type="hidden" name="pid" value="${requestScope.product.product_id}">
                                                        <input type="hidden" name="rid" value="${review.review_id}">
                                                        <button class="dropdown-item text-danger" type="submit">Xóa</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div> <!-- END comment LIST -->
                        </div>   <!-- END REVIEW RATING ALL-->
                    </div>  <!-- END Content -->

                    <div class="shop-container_list" id="product-display">
                        <c:forEach items="${requestScope.viewedList}" var="p">
                            <div class="section_item shop-product product">
                                <div class="box-image">
                                    <a href="product?pid=${p.product_id}">
                                        <img src="${p.thumbnail}" alt=""/>
                                    </a>
                                </div>
                                <div class="box-text">
                                    <a href="product?pid=${p.product_id}">
                                        <h4 class="product_title">${p.name}</h4>
                                    </a>
                                    <c:choose>
                                        <c:when test="${p.promotion_price == p.unitprice}">
                                            <div class="price-wrapper">
                                                <span>${p.unitprice/1000}00 đ</span>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="product-price">
                                                <div class="product-price__current-price">${p.promotion_price/1000}00 ₫</div>
                                                <div class="product-price__discount-rate">-${100-Math.ceil(p.promotion_price/p.unitprice*100)}%</div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <button><a href="buy?pid=${p.product_id}">Thêm vào giỏ</a></button>
                                </div>
                            </div> <!-- bài viết-->
                        </c:forEach>
                    </div>
                </div>
            </c:otherwise>

        </c:choose>


        <!--Footer-->
        <jsp:include page="../Layout/Footer.jsp"></jsp:include>
        <script src="${pageContext.request.getContextPath()}/js/main.js">
        </script>
        <script>
            function changeComment(id) {
                document.getElementById('change-review-form' + id).style.display = 'block';
                document.getElementById('old-comment' + id).style.display = 'none';
            }

            function  cancelChangeComment(id) {
                document.getElementById('change-review-form' + id).style.display = 'none';
                document.getElementById('old-comment' + id).style.display = 'block';
            }

            function changeContent() {
                const content = document.querySelector('.star-content');
                var stars = document.querySelectorAll('input[name="star"]');
                for (let radio of stars) {
                    if (stars[4].checked == true) {
                        content.innerHTML = 'Rất tệ';
                    } else if (stars[3].checked == true) {
                        content.innerHTML = 'Không hài lòng';
                    } else if (stars[2].checked == true) {
                        content.innerHTML = 'Bình thường';
                    } else if (stars[1].checked == true) {
                        content.innerHTML = 'Hài lòng';
                    } else if (stars[0].checked == true) {
                        content.innerHTML = 'Rất hài lòng';
                    }
                }
            }

            function openReviewBox() {
                document.querySelector('.write-review').style.display = "block";
            }

            function closeReviewBox() {
                document.querySelector('.write-review').style.display = "none";
            }

            const infor = document.getElementById('infor-tab').classList;
            const infor_content = document.querySelector('.product-infor');
            const review = document.getElementById('review-tab').classList;
            const review_content = document.querySelector('.review-rating');
            function switchPill() {
                if (infor.contains('active') == true) {
                    infor.remove("active");
                    infor_content.style.display = "none";
                    review.add("active");
                    review_content.style.display = "block";
                } else {
                    infor.add("active");
                    infor_content.style.display = "block";
                    review.remove("active");
                    review_content.style.display = "none";
                }
            }

            function changeImage(img) {
                var bigpic = document.getElementById('product-left-big-image');
                bigpic.src = img.src;
            }
        </script>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>
            $('.review-image__list').slick({
                infinite: false,
                variableWidth: false,
                speed: 400,
                arrow: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplaySpeed: 2000,
                prevArrow: "<button type='button' class='slick-prev slick-arrow'><i class='fa fa-arrow-left' aria-hidden='true'></i></button>",
                nextArrow: "<button type='button' class='slick-next slick-arrow'><i class='fa fa-arrow-right' aria-hidden='true'></i></button>"
            });
        </script>
    </body>
</html>
