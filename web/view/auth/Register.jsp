<%-- 
    Document   : Login
    Created on : Jun 19, 2022, 12:16:37 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login page</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <!-- <link rel='stylesheet' type='text/css' media='screen' href='main.css'> -->
        <link type="text/css" rel="stylesheet" href="css/login.css">
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="register-page">
            <div class="welcome-massage">
                <span>Đăng kí tài khoản</span>
            </div>

            <c:if test="${requestScope.mess != null}">
                <div class="alert alert-warning" id="alert-warning" style="display: block;">
                    <i class="fa-solid fa-xmark close" onclick="closeAlert()"></i>
                    <p class="alert-message">${requestScope.mess}</p>
                </div>
            </c:if>

            <form action="" method="post" class="register-form auth-form" onsubmit="return confirmPassword()">
                <div class="form-group form-group-box username">
                    <i class="fas fa-user"></i>
                    <input type="email" name="email" required="" placeholder="Nhập email của bạn" maxlength="50">
                </div> <!-- first input -->

                <div class="form-group form-group-box username">
                    <i class="fas fa-user"></i>
                    <input type="text" required="" name="firstname" placeholder="First Name" maxlength="25">
                </div>  <!-- first input -->

                <div class="form-group form-group-box username">
                    <i class="fas fa-user"></i>
                    <input type="text" name="lastname" placeholder="Last Name" maxlength="25" required="">
                </div>   <!-- first input -->

                <div class="form-group form-group-box username">
                    <i class="fas fa-user"></i>
                    <input type="text" name="phone" placeholder="Phone Number" maxlength="15" required="">
                </div>    <!-- first input -->

                <div class="form-group form-group-box password">
                    <!-- <p class="password-input-title">
                        Mật khẩu
                    </p> -->
                    <i class="fas fa-solid fa-lock"></i>
                    <input type="password" id="myPassword" placeholder="Nhập mật khẩu" name="password" required="">

                    <i class="fa-solid fa-eye icon" id="myPassword-eye" onclick="passwordToggle()"></i>
                </div>

                <div class="form-group form-group-box confirm_password">
                    <!-- <p class="password-input-title">
                        Mật khẩu
                    </p> -->
                    <i class="fas fa-solid fa-lock"></i>
                    <input type="password" id="confirm_password" placeholder="Nhập lại mật khẩu"
                           name="confirm_password" onkeyup="confirmPassword()" required="">
                    <i id="status_icon" class="fas fa-solid"></i>
                </div>


                <button class="sign-in-button" type="submit">Đăng ký</button>
            </form>

            <div class="sign-in-others">
                <p class="sign-in-others-text">— Or Sign In With —</p>
                <div class="sign-in-others-button">
                    <a href="https://facebook.com"><i class="fa-brands fa-facebook-square"></i><span>Facebook</span></a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/PROJECT_PRJ301/LoginGoogleHandler&response_type=code&client_id=447960113226-itgeno2p8hbp1m1kr1i9r7kg1kcnek90.apps.googleusercontent.com&approval_prompt=force">
                        <i class="fa-brands fa-google"></i><span>Google</span></a>
                </div>
            </div>

            <div class="or-create-new-account">
                <p>
                    <a href="dangky">Create new account</a>
                </p>
            </div>
        </div>

        <div class="button-ex">
            <a><span>BUTTON</span></a>
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
