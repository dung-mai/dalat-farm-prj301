<%-- 
    Document   : order-success
    Created on : Jul 8, 2022, 2:42:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <style>

            .mess{
                color: #f01414;
            }
            .order-id span{
                display: inline-block;
                padding: 10px 50px;
                background: #15ad15;
                color: #fff;
                font-size: 20px;
            }
            p{
                font-weight: 600;
            }
            
        </style>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <jsp:include page="../Layout/Menu.jsp"></jsp:include>

        <section class="section-pagetop bg">
            <div class="container">
                <div class="mess">
                    <h3>Cảm ơn bạn đã mua hàng tại Hola Farm</h3>
                </div>

                <div class="order-id">
                    <p>Mã số đơn hàng của bạn</p>
                    <span>${requestScope.order_code}</span>
                </div>

                <a href="${pageContext.request.contextPath}/customer/order">Xem đơn hàng</a>
            </div> <!-- container //  -->
        </section> 

    <jsp:include page="../Layout/Footer.jsp"></jsp:include>


</body>
</html>
