<%-- 
    Document   : index.jsp
    Created on : Jun 11, 2022, 9:29:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Trang chủ</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <!-- <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet'> -->
        <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet'>
        <link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick.css">
        <link rel="stylesheet" type="text/css" href="./slick-1.8.1/slick/slick-theme.css">
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <!-- Header -->
        <jsp:include page="Layout/Menu.jsp"></jsp:include>
        
            <!-- Top banner -->
            <section class="top-banner">
                <img src="images/banner_super.jpg">
                <div class="textbox">
                    <h2>GIAO TẬN TAY NGƯỜI DÙNG NHANH</h2>
                    <h1>
                        <b><span>THỰC PHẨM ORGANIC</span></b>
                    </h1>
                    <h3>Chúng tôi cung cấp các sản phẩm hữu cơ chất lượng cao</h3>
                    <button class="">
                        <a href="">
                            <span>MUA NGAY</span>
                            <i class="fas fa-angle-right"></i>
                        </a>

                    </button>
                </div>
            </section>

            <!-- Product category -->
            <section class="section category">
                <h1 class="category_intro">Mua sản phẩm được lựa chọn từ vườn</h1>
                <div class="section_list category_list">
                <c:forEach items="${requestScope.dao.getProductCategories()}" var="p_c">
                    <div class="container">
                        <img src="images/index_cate_${p_c.cate_id}.png" class="image">
                        <div class="overlay">
                            <img src="images/index_cate_${p_c.cate_id}_hover.png" class="image">
                        </div>
                        <h3><a href="cua-hang?cid=${p_c.cate_id}">${p_c.name}</a></h3>
                    </div> <!-- /category -->
                </c:forEach>
            </div>
        </section>


        <!-- CHương trình khuyến mãi -->

        <!-- Sản phẩm bán chạy -->
        <div class="section top-sell">
            <div class="section_title top-sell_title">
                <h1>SẢN PHẨM BÁN CHẠY</h1>
            </div>
            <div class="section_list top-sell_list">
                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p3-.jpg" alt="Cà chua">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="#">Cà chua</a>
                        </div>
                        <div class="price-wrapper">
                            <span>60,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->

                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p5.jpg" alt="Bắp cải">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Bắp cải</a>
                        </div>
                        <div class="price-wrapper">
                            <span>65,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->

                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p6.jpg" alt="Chuối">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Chuối</a>
                        </div>
                        <div class="price-wrapper">
                            <span>30,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->

                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p7.jpg" alt="Táo">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Táo</a>
                        </div>
                        <div class="price-wrapper">
                            <span>50,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->

                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p9.jpg" alt="Cà rốt">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Cà rốt</a>
                        </div>
                        <div class="price-wrapper">
                            <span>40,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->


                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p10.jpg" alt="Ớt chuông">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Ớt chuông</a>
                        </div>
                        <div class="price-wrapper">
                            <span>80,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->

                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p11.jpg" alt="Dâu tây">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Dâu tây</a>
                        </div>
                        <div class="price-wrapper">
                            <span>120,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->

                <div class="section_item top-sell_item">
                    <div class="box-image">
                        <a href="">
                            <img src="images/p12.jpg" alt="Chanh vàng">
                        </a>
                        <div class="add-cart">
                            <a href="">
                                <i class="fas fa-shopping-cart"></i> </a>
                        </div>
                    </div>

                    <div class="box-text">
                        <div class="title-wrapper">
                            <a href="">Chanh vàng</a>
                        </div>
                        <div class="price-wrapper">
                            <span>80,000 đ</span>
                        </div>
                    </div>
                </div> <!-- /banchay -->
            </div>
        </div>

        <!-- TIN TỨC -->

        <div class="section blog">
            <div class="section_title blog_title">
                <h1>BÀI VIẾT MỚI</h1>
            </div>
            <div class="section_list blog_list">
                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a1.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->

                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a2.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->

                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a3.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->

                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a4.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->


                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a5.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->

                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a6.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->

                <div class="section_item baiviet">
                    <div class="box-image">
                        <img src="images/a3.jpg" alt="Nấm vân chi">
                    </div>
                    <div class="baiviet_main">
                        <h3 class="baiviet_title">Nấm vân chi có tác dụng gì?</h2>
                        </h3>
                        <span class="baiviet_date">16 Tháng Năm, 2019</span>
                        <p class="baiviet_excerpt">
                            Cách dây hơn 2000 năm, nấm vân chi rừng đã được biết đến và sử dụng...
                        </p>
                    </div>
                </div> <!-- bài viết-->
            </div>
        </div>

        <!--Footer-->
        <jsp:include page="Layout/Footer.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>
            $('.top-sell_list').slick({
                infinite: true,
                speed: 400,
                slidesToShow: 4,
                slidesToScroll: 2,
                autoplaySpeed: 2000,
                prevArrow: "<button type='button' class='slick-prev slick-arrow'><i class='fa fa-arrow-left' aria-hidden='true'></i></button>",
                nextArrow: "<button type='button' class='slick-next slick-arrow'><i class='fa fa-arrow-right' aria-hidden='true'></i></button>"
            });

            $('.blog_list').slick({
                infinite: true,
                speed: 400,
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplaySpeed: 2000,
                prevArrow: "<button type='button' class='slick-prev slick-arrow'><i class='fa fa-arrow-left' aria-hidden='true'></i></button>",
                nextArrow: "<button type='button' class='slick-next slick-arrow'><i class='fa fa-arrow-right' aria-hidden='true'></i></button>"
            });
        </script>
        <script>
            $(window).scroll(function () {
                if ($(window).scrollTop() > 79) {
                    $('#header').css({position: 'fixed'});
                } else {
                    $('#header').css({position: 'static', top: '-79px'});
                }
            });
        </script>
    </body>

</html>
