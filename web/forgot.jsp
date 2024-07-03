<%-- 
    Document   : forgot
    Created on : Dec 30, 2023, 9:21:53 PM
    Author     : lvhho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Forgot</title>
        <link rel="icon" href="images/logo1.png"/>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/style_1.css">
        <style>
            i#iconsee {
                position: absolute;
                right: 13px;
                top: 40px;
            }
        </style>
    </head>

    <body>
        <section class="fxt-template-animation fxt-template-layout1">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 col-12 fxt-bg-color">
                        <div class="fxt-content">
                            <div class="fxt-header">
                                <a href="home" class="fxt-logo"><img src="images/logo.png" alt="Logo" width="30%"></a>

                                <div class="fxt-page-switcher">
                                    <a href="login" class="switcher-text1">Log In</a>
                                    <a href="register" class="switcher-text1">Register</a>
                                </div>
                            </div>
                            <div class="fxt-form">
                                <h2 style="color: red">Forgot Password</h2>
                                <c:if test="${requestScope.check == null}">
                                    <p>For recover your password</p>
                                </c:if>
                                <h4 style="color: red">${error}</h4>
                                <h4 style="color: green">${msg}</h4>
                                <h4 style="color: green">${mess}</h4>
                                <c:if test="${user == null}">
                                    <form action="forgot" method="post">
                                        <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                                            <div class="form-group">
                                                <div class="fxt-transformY-50 fxt-transition-delay-1">
                                                    <input type="text" class="form-control" name="username" placeholder="Username" required="required" value="${requestScope.account}">
                                                    <i class="flaticon-envelope"></i>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                                            <div class="form-group">
                                                <div class="fxt-transformY-50 fxt-transition-delay-2">
                                                    <button type="submit" class="fxt-btn-fill">NEXT</button>
                                                </div>
                                            </div>
                                        </c:if>
                                    </form>
                                </c:if>

                                <c:if test="${user != null}">
                                    <form action="changeforgotpass" method="post">

                                        <div class="mb-3" style="position: relative">
                                            <label class="mb-1" for="newPassword">New Password</label>
                                            <input oninput="checkNumberCharacter(this)" name="newpass" value="" class="form-control" id="pass1" required type="password" placeholder="Enter new password">
                                            <i id="iconsee" style="cursor: pointer" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                            <label style="color: red; display:none" class="mb-1" id="text1"></label>
                                        </div>
                                        <div class="mb-2" style="position: relative">
                                            <label class="mb-1" for="confirmPassword">Confirm Password</label>
                                            <input oninput="checkSame(this)" name="cfnewpass" class="form-control" id="pass2" required type="password" placeholder="Confirm new password">
                                            <i id="iconsee" style="cursor: pointer" onclick="changeIcon(this)" class="fa-solid fa-eye-slash"></i>
                                            <label style="color: red; display:none" class="mb-1" id="text"></label>
                                        </div>
                                        <input name="username" value="${user.userName}" id="confirmPassword" type="hidden">
                                        <button style="margin-top: 10px" class="btn btn-primary" type="submit">Save</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-12 fxt-none-767 fxt-bg-img" data-bg-image="images/figure/aa.jpg"></div>
                </div>
            </div>
        </section>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/validator.min.js"></script>
        <script src="js/main_1.js"></script>
        <script type="text/javascript">
                                                function changeIcon(obj) {
                                                    var id = obj.previousSibling.previousSibling.id;
                                                    var inputP = document.getElementById(id);
                                                    if (obj.className == 'fa-solid fa-eye-slash') {
                                                        obj.className = 'fa-solid fa-eye';
                                                        inputP.type = 'text';
                                                    } else {
                                                        obj.className = 'fa-solid fa-eye-slash';
                                                        inputP.type = 'password';
                                                    }
                                                }

                                                function checkSame(obj) {
                                                    var text = document.getElementById("text1");
                                                    if (text.style.display == 'none') {
                                                        var a = document.getElementById("pass1");
                                                        if (obj.value !== a.value) {
                                                            var text = document.getElementById("text");
                                                            text.style.display = "block";
                                                            text.textContent = "New password does not match. Please re-enter your new password here.";
                                                        } else {
                                                            var text = document.getElementById("text");
                                                            text.style.display = "none";
                                                        }
                                                    }
                                                }

                                                function checkNumberCharacter(obj) {
                                                    var a = document.getElementById("pass1");
                                                    if (obj.value.length <= 5) {
                                                        var text = document.getElementById("text1");
                                                        text.style.display = "block";
                                                        text.textContent = "This password should have more than 6 characters and be difficult for others to guess.";
                                                    } else {
                                                        var text = document.getElementById("text1");
                                                        text.style.display = "none";
                                                    }
                                                }


        </script>
    </body>
</html>

