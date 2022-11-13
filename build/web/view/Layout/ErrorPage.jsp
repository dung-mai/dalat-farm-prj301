<%-- 
    Document   : ErrorPage
    Created on : Jun 28, 2022, 9:42:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error | Not Found</title>
        <link  type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>

            <section class="content-main">

                <div class="row" style="margin-top:60px">
                    <div class="col-sm-12">
                        <div class="w-50 mx-auto text-center">
                            <img src="${pageContext.request.contextPath}/images/not-found.png" width="350" alt="Page Not Found">
                        <h3 class="mt-4">Oops! Trang không tìm thấy</h3>
                        <p>Có thể bạn đã nhập sai đường dẫn hoặc trang không còn tồn tại. Đừng lo lắng... chuyện này xảy ra với tất cả chúng ta. Bạn hãy thử
                            kiểm tra lại đường dẫn</p>
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary mt-4">Quay lại trang chủ
                        </a>
                    </div>
                </div>
            </div>


        </section>
    </body>
</html>
