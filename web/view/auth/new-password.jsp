<%-- 
    Document   : otp-enter
    Created on : Jul 4, 2022, 11:13:42 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>


<!DOCTYPE html>
<!-- === Coding by CodingLab | www.codinglabweb.com === -->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- ===== Iconscout CSS ===== -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <!-- ===== CSS ===== -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <style>
            /* ===== Google Font Import - Poformsins ===== */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }

            body{
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #eae0e0;
            }

            .container{
                position: relative;
                max-width: 430px;
                width: 100%;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                margin: 100px 20px 0;
            }

            .container .forms{
                display: flex;
                align-items: center;
                width: 200%;
                transition: height 0.2s ease;
            }


            .container .form{
                width: 50%;
                padding: 30px;
                background-color: #fff;
                transition: margin-left 0.18s ease;
            }

            .container.active .login{
                margin-left: -50%;
                opacity: 0;
                transition: margin-left 0.18s ease, opacity 0.15s ease;
            }

            .container.active .forms{
                height: 600px;
            }
            .container .form .title{
                position: relative;
                font-size: 27px;
                font-weight: 600;
            }

            .form .title::before{
                content: '';
                position: absolute;
                left: 0;
                bottom: -10px;
                height: 2px;
                width: 90px;
                background-color: #4070f4;
                border-radius: 25px;
            }

            .form .input-field{
                position: relative;
                height: 50px;
                width: 100%;
                margin-top: 30px;
            }

            .input-field input{
                position: absolute;
                height: 100%;
                width: 100%;
                padding: 0 35px;
                border: none;
                outline: none;
                font-size: 16px;
                border-bottom: 2px solid #ccc;
                border-top: 2px solid transparent;
                transition: all 0.2s ease;
            }

            .input-field input:focus, .input-field input:valid{
                border-bottom-color: #4070f4;
            }

            .input-field i{
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                color: #999;
                font-size: 23px;
                transition: all 0.2s ease;
            }

            .input-field input:focus ~ i, .input-field input:valid ~ i{
                color: #4070f4;
            }

            .input-field i.icon{
                left: 0;
            }
            .input-field i.showHidePw{
                right: 0;
                cursor: pointer;
                padding: 10px;
            }

            .form .checkbox-text{
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-top: 20px;
            }

            .form a:hover{
                text-decoration: underline;
            }

            .form .button{
                margin-top: 35px;
            }

            .form .button input{
                border: none;
                color: #fff;
                font-size: 17px;
                font-weight: 500;
                letter-spacing: 1px;
                border-radius: 6px;
                background-color: #4070f4;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .button input:hover{
                background-color: #503da2;
            }

        </style>

        <!--<title>Login & Registration Form</title>-->
    </head>
    <body>
        <div class="container">
            <div class="forms">
                <div class="form login">
                    <c:if test="${requestScope.mess != null}">
                        <div class="message danger">
                            <p class="alert-message">${requestScope.mess}</p>
                        </div>
                    </c:if>
                    <span class="title">Thay đổi mật khẩu</span>
                    <form method="post">
                        <div class="input-field">
                            <input id="myPassword" type="password" placeholder="Nhập password" required maxlength="30" name="new_password">
                            <i class="uil uil-lock icon"></i>
                        </div>

                        <div class="input-field">
                            <input type="password" id="confirm_password" placeholder="Nhập lại mật khẩu"
                                   name="new_confirm_password" onkeyup="confirmPassword()" required="" maxlength="30">
                            <i id="status_icon" class="fas fa-solid"></i>
                            <i class="uil uil-lock icon"></i>
                        </div>

                        <div class="input-field button">
                            <input type="submit" value="Thay đổi">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function passwordToggle() {
                var x = document.getElementById("myPassword");
                let icon = document.querySelector('#myPassword-eye');
                if (x.type === "password") {
                    x.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else {
                    x.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                }
            }

            function confirmPassword() {
                var status_icon = document.querySelector('#status_icon');
                if (document.getElementById('myPassword').value ===
                        document.getElementById('confirm_password').value) {
                    status_icon.classList.remove("fa-xmark");
                    status_icon.classList.add("fa-check");
                    status_icon.style.color = 'green';
                    return true;
                } else {
                    status_icon.classList.remove("fa-check");
                    status_icon.classList.add("fa-xmark");
                    status_icon.style.color = 'red';
                    return false;
                }
            }

            var alertBox = document.getElementById("alert-warning");

            function closeAlert() {
                alertBox.style.display = "none";
            }
        </script>
    </body>
</html>


