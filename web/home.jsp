<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Houseware Store</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        <script src="js/convertmoney.js"></script>

    </head>
    <body>
        <%@ include file="menu.jsp"%>
        <div style="margin-top: 150px">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images\slider\slider1.jpg" class="d-block w-100" alt="Wild Landscape" height="50px"/>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>

                </div>

                <div class="container" style="margin-top: 650px">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li class="breadcrumb-item"><a href="refine?cid_refine=${0}">Category</a></li>
                                    <li class="breadcrumb-item active" aria-current="#">Sub-category</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <%@ include file="left.jsp"%>

                        <div class="col-sm-9">
                            <div class="row">
                                <c:forEach items="${listAll}" var="o">
                                    <div class="col-12 col-md-6 col-lg-4" style="padding-bottom: 15px">
                                        <div class="card">
                                            <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                            <div class="card-body">
                                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                                <span class="price h4 text-danger" style="margin-left: 20px">
                                                    <input type="hidden" id="amount" value="${o.price}">
                                                    <span class="num currency" id="price"></span>
                                                </span> 

                                                <div class="row" style="margin-top: 5px">
                                                    <div class="col" style="margin-left: 25px">
                                                        <a href="#"> <i class="fa fa-heart-o" style="font-size: x-large" title="Add to Wishlist"></i>
                                                        </a>
                                                    </div>
                                                    <div class="col" style="padding-top: 3px">
                                                        <a href="cart?role=add&id=${o.id}&quantity=1"><i class="fa fa-shopping-cart" style="font-size: x-large; " title="Add to Cart"></i></a>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
                <button id="myBtn" title="Lên đầu trang" style="border-radius: 30%; width: 40px"> <i class="fa fa-chevron-up" style="color: black"></i></button>

                <%@ include file="footer.jsp"%>
            </div>
    </body>
    <div class="modal fade" id="modal_box" role="dialog"></div>
    <script>
        window.onscroll = function () {
            scrollFunction();
        };
        function scrollFunction() {

            if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
                document.getElementById("myBtn").style.display = "block";
            } else {
                document.getElementById("myBtn").style.display = "none";
            }
        }
    </script>
</html>

