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
        <%--<c:set value="cookie" value="${pageContext.request.cookies}"></c:set>--%>
        <div class="login-page">
            <div class="welcome-massage">
                <span>Welcome to Hola Farm</span>
            </div>

            <div class="alert alert-warning" id="alert-warning">
                <i class="fa-solid fa-xmark close" onclick="closeAlert()"></i>
                <p class="alert-message"></p>
                <input type="hidden" value="${requestScope.status}">
            </div>

            <form method="post" class="login-form auth-form">
                <div class="form-group form-group-box username">
                    <i class="fas fa-user"></i>
                    <input type="text" name="email" value="${cookie.c_email.value}" required="required" placeholder="Nhập email của bạn">
                </div>
                <div class="form-group form-group-box password">
                    <i class="fas fa-solid fa-lock"></i>
                    <input type="password" id="myPassword" value="${cookie.c_pass.value}" required="required" placeholder="Nhập mật khẩu" name="password">
                    <i class="fa-solid fa-eye icon" id="myPassword-eye" onclick="passwordToggle()"></i>
                </div>

                <div class="form-group addition">
                    <div class="remember-me">
                        <input type="checkbox" name="rememberMe" ${cookie.remember != null?'checked':''}>
                        <span>Remember Me</span>
                    </div>
                    <div class="forgot-password">
                        <a href="${pageContext.request.contextPath}/account/forgot-password" title="Go to reset password">Forgot Password?</a>
                    </div>
                </div>

                <button class="sign-in-button" type="submit">Sign in</button>
            </form>

            <div class="sign-in-others">
                <p class="sign-in-others-text">— Or Sign In With —</p>
                <div class="sign-in-others-button">
                    <a href="https://facebook.com"><i class="fa-brands fa-facebook-square"></i><span>Facebook</span></a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:9999/PROJECT_PRJ301/LoginGoogleHandler&response_type=code&client_id=447960113226-itgeno2p8hbp1m1kr1i9r7kg1kcnek90.apps.googleusercontent.com&approval_prompt=force">
                        <i class="fa-brands fa-google"></i>
                        <span>Google</span>

                    </a>
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

            var alertBox = document.getElementById("alert-warning");
            var status = document.querySelector(".alert-warning input").value;
            var alertMessage = document.querySelector(".alert-message");

            function closeAlert() {
                alertBox.style.display = "none";
            }

//            if (alertMessage != null) {
//                console.log('OKAY ?O');
//            }
            if (status === "invalidEmail" || status === "invalidPwd") {
                alertMessage.innerHTML = "Vui lòng điền đầy đủ Email và Mật khẩu";
                alertBox.style.display = "block";
            } else if (status === "invalidAccount") {
                alertMessage.innerHTML = "Vui lòng kiểm tra lài email hoặc mật khẩu";
                alertBox.style.display = "block";
            } else if (status === "loginFail") {
                alertMessage.innerHTML = "Đăng nhập thất bại";
                alertBox.style.display = "block";
            } else if (status === "nolongerExist") {
                alertMessage.innerHTML = "Tài khoản không còn tồn tại";
                alertBox.style.display = "block";
            } else if (status === "hasRegisted") {
                alertMessage.innerHTML = "Email này đã được đăng ký";
                alertBox.style.display = "block";
            }

        </script>
    </body>

</html>
