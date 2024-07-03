<%-- 
    Document   : viewcart
    Created on : Dec 23, 2023, 11:45:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart    </title>
        <link rel="icon" href="images/logo1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <style>
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-color: #fff;
                background-repeat: no-repeat;
            }

            .plus-minus {
                position: relative;
            }

            .plus {
                position: absolute;
                top: -4px;
                left: 2px;
                cursor: pointer;
            }

            .minus {
                position: absolute;
                top: 8px;
                left: 5px;
                cursor: pointer;
            }

            .vsm-text:hover {
                color: #FF5252;
            }

            .book, .book-img {
                width: 120px;
                height: 180px;
                border-radius: 5px;
            }

            .book {
                margin: 20px 15px 5px 15px;
            }

            .border-top {
                border-top: 1px solid #EEEEEE !important;
                margin-top: 20px;
                padding-top: 15px;
            }

            .card {
                margin: 40px 0px;
                padding: 40px 50px;
                border-radius: 20px;
                border: none;
                box-shadow: 1px 5px 10px 1px rgba(0,0,0,0.2);
            }

            input, textarea {
                background-color: #F3E5F5;
                padding: 8px 15px 8px 15px;
                width: 100%;
                border-radius: 5px !important;
                box-sizing: border-box;
                border: 1px solid #F3E5F5;
                font-size: 15px !important;
                color: #000 !important;
                font-weight: 300;
            }

            input:focus, textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #9FA8DA;
                outline-width: 0;
                font-weight: 400;
            }

            button:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                outline-width: 0;
            }

            .pay {
                width: 80px;
                height: 40px;
                border-radius: 5px;
                border: 1px solid #673AB7;
                margin: 10px 20px 10px 0px;
                cursor: pointer;
                box-shadow: 1px 5px 10px 1px rgba(0,0,0,0.2);
            }

            .gray {
                -webkit-filter: grayscale(100%);
                -moz-filter: grayscale(100%);
                -o-filter: grayscale(100%);
                -ms-filter: grayscale(100%);
                filter: grayscale(100%);
                color: #E0E0E0;
            }

            .gray .pay {
                box-shadow: none;
            }

            #tax {
                border-top: 1px lightgray solid;
                margin-top: 10px;
                padding-top: 10px;
            }

            .btn-blue {
                border: none;
                border-radius: 10px;
                background-color: #673AB7;
                color: #fff;
                padding: 8px 15px;
                margin: 20px 0px;
                cursor: pointer;
            }

            .btn-blue:hover {
                background-color: #311B92;
                color: #fff;
            }

            #checkout {
                float: left;
            }

            #check-amt {
                float: right;
            }

            .btnAdd, .btnSub {
                padding: 5px 10px;
                margin-left: 7px;
                margin-right: 7px;
                border: none;
            }

            @media screen and (max-width: 768px) {
                .book, .book-img {
                    width: 100px;
                    height: 150px;
                }

                .card {
                    padding-left: 15px;
                    padding-right: 15px;
                }

                .mob-text {
                    font-size: 13px;
                }

                .pad-left {
                    padding-left: 20px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <form action="Checkout" method="post">
                <div id="viewcart_content" style="margin-top: 200px; margin-left: 10px">

                <c:if test="${sessionScope.listItemsInCart == null || sessionScope.cartSize == 0}">
                    <center><img src="images/emptycart1.png" width="400px"  alt="Emptycart"/></center>
                    </c:if>

                <c:if test="${sessionScope.cartSize != 0}">
                    <div class="row d-flex justify-content-center">
                        <div class="col-4">
                            <h4 class="heading">Shopping Bag</h4>
                        </div>
                        <div class="col-8">
                            <div class="row text-right">
                                <div class="col-3">
                                    <h6 class="mt-2">Quantity</h6>
                                </div>
                                <div class="col-3">
                                    <h6 class="mt-2">Price</h6>
                                </div>
                                <div class="col-3" style="padding-right: 30px">
                                    <h6 class="mt-2">Delete</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${sessionScope.listItemsInCart}" var="item">
                        <div class="convert">
                            <div class="row d-flex justify-content-center border-top" >
                                <input type="hidden" value="${item.product.id}" name="id">
                                <input type="hidden" value="${item.quantity}" name="quantity">
                                <div class="col-4">
                                    <div class="row">
                                        <div class="book col-7" style="margin-right: 30px; flex: 1">
                                            <img src="${item.product.image}" style="width: 170px; height: 150px" class="book-img">
                                        </div>
                                        <div class="my-auto flex-column d-flex pad-left col-5">
                                            <h6 class="mob-text">${item.product.name}</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="my-auto col-8 ">
                                    <div class="row text-right">
                                        <div class="col-3">
                                            <!--                                        <div class="">
                                                                                        <input style="width: 100px"
                                                                                               name="quantity" type="number" min="1" max="100" step="1" value="${item.quantity}">
                                                                                    </div>-->
                                            <h6>${item.quantity}</h6>
                                        </div>
                                        <div class="col-3">
                                            <h6 class="mob-text">
                                                <input type="hidden" class="amount" value="${item.product.price}">
                                                <span class="num currency price"></span>
                                            </h6>
                                        </div>
                                        <div class="col-3">
                                            <a  href="viewcart?rid=${item.product.id}" 
                                                style="padding: 8px 15px; border: none; border-radius: 5px; background-color: #1763c7; color: white">
                                                Delete
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <h4 style="color: red">${error}</h4>

                <div class="row justify-content-center">
                    <div class="col-lg-11">
                        <div class="card">
                            <div class="row">
                                <div class="col-lg-12 mt-2">
                                    <div class="row d-flex justify-content-between px-4">
                                        <p class="mb-1 text-left">Subtotal</p>
                                        <h6 class="mb-1 text-right">
                                            <input type="hidden" class="amount" value="${sessionScope.total}">
                                            <span class="num currency price"></span>
                                        </h6>
                                    </div>
                                    <div class="row d-flex justify-content-between px-4">

                                        <p class="mb-1 text-left">Shipping</p>
                                        <h6 class="mb-1 text-right">${sessionScope.cart == null || sessionScope.cartSize == 0 ? '0' : '30.000'} đ</h6>
                                    </div>
                                    <div class="row d-flex justify-content-between px-4" id="tax">
                                        <p class="mb-1 text-left">Total (tax included)</p>
                                        <h6 class="mb-1 text-right" style="font-size: 18px; font-weight: bold;">
                                            <input type="hidden" class="amount" value="${sessionScope.cart == null || sessionScope.cartSize == 0 ? '0' : sessionScope.total + 30000}">
                                            <span class="num currency price"></span>
                                        </h6>
                                    </div>
                                    <span>
                                        <input class="btn-block btn-blue" type="submit" value="CHECKOUT" id="checkout"
                                               style="color: white; font-weight: bold; background-color: orange"/>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%@ include file="footer.jsp"%>
        <div class="modal fade" id="modal_box" role="dialog"></div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/clickevents.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Select all price elements
                let priceElements = document.querySelectorAll('.convert');
                // Loop through each price element
                priceElements.forEach(function (priceElement) {
                    // Get the amount from the hidden input inside this price element
                    let amount = parseInt(priceElement.querySelector(".amount").value);
                    // Create a new formatter for each price element
                    let formatter = new Intl.NumberFormat("vi-VN", {style: "currency", currency: "VND"});
                    // Format the amount and set it as the inner text of the price element
                    priceElement.querySelector(".num").innerText = formatter.format(amount);
                });
            }
            );

            document.addEventListener("DOMContentLoaded", function () {
                // Select all subtotal, shipping, and total elements
                let priceElements = document.querySelectorAll('.row.d-flex.justify-content-between.px-4');

                // Loop through each price element
                priceElements.forEach(function (priceElement) {
                    // Get the amount from the hidden input inside this price element
                    let amount = parseFloat(priceElement.querySelector(".amount").value);

                    // Create a new formatter for each price element
                    let formatter = new Intl.NumberFormat("vi-VN", {style: "currency", currency: "VND"});

                    // Format the amount and set it as the inner text of the price element
                    priceElement.querySelector(".num").innerText = formatter.format(amount);
                });
            });

            document.addEventListener("DOMContentLoaded", function () {
                // Select the tax element
                let taxElement = document.getElementById('tax');

                if (taxElement) {
                    // Get the subtotal from the hidden input inside the tax element
                    let subtotal = parseFloat(taxElement.querySelector(".amount").value);

                    // Create a new formatter for the total
                    let formatter = new Intl.NumberFormat("vi-VN", {style: "currency", currency: "VND"});

                    // Format the total and set it as the inner text of the price element
                    taxElement.querySelector(".num").innerText = formatter.format(subtotal);
                } else {
                    console.error("Element with ID 'tax' not found.");
                }
            });


        </script>
    </body>
</html>
