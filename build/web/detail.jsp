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
    </head>
    <body>
        <%@ include file="menu.jsp"%>

        <!--Main layout-->
        <main class="mt-5 pt-4" style="margin-bottom: 50px;">
            <div class="container mt-5">
                <div class="card" style="margin-top: 120px">
                    <div class="row">
                        <aside class="col-sm-5 border-right">
                            <article class="gallery-wrap"> 
                                <div class="img-big-wrap">
                                    <div> <a href="#"><img src="${detail.image}"></a></div>
                                </div> <!-- slider-product.// -->
                                <div class="img-small-wrap">
                                </div> <!-- slider-nav.// -->
                            </article> <!-- gallery-wrap .end// -->
                        </aside>
                        <aside class="col-sm-7">
                            <article class="card-body p-5">
                                <form action="cart">
                                    <input type="hidden" name="id" value="${detail.id}"/>
                                    <input type="hidden" name="role" value="add"/>
                                    <h3 class="title mb-3">${detail.name}</h3>

                                    <p class="price-detail-wrap"> 
                                        <span class="price h3 text-warning"> 
                                            <input type="hidden" id="amount" value="${detail.price}">
                                            <span class="num currency" id="price"></span>
                                        </span> 
                                    </p> <!-- price-detail-wrap .// -->
                                    <dl class="item-property">
                                        <dt>Description</dt>
                                        <dd><p>
                                                ${detail.describe}
                                            </p></dd>
                                    </dl>

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <dl class="param param-inline">
                                                <dt>Quantity: </dt>
                                                <dd>
                                                    <div class="form-outline me-1" style="width: 100px;">
                                                        <input type="number" value="1" min="1" max="${quantity}" step="1" class="form-control" name="quantity"/>
                                                    </div>
                                                </dd>
                                            </dl>  <!-- item-property .// -->
                                        </div> <!-- col.// -->
                                    </div> <!-- row.// -->
                                    <hr>
                                    <a href="cart" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                    <input type="submit" value="Add to Cart" class="btn btn-lg btn-outline-primary text-uppercase">
                                </form>
                            </article> <!-- card-body.// -->
                        </aside> <!-- col.// -->
                    </div> <!-- row.// -->
                </div> <!-- card.// -->


            </div>
        </main>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let price = document.getElementById("price");
                if (price) {
                    let formatter = new Intl.NumberFormat("vi-VN", {style: "currency", currency: "VND"});
                    let amount = parseInt(document.getElementById("amount").value);
                    price.innerText = formatter.format(amount);
                } else {
                    console.error("Element with ID 'price' not found.");
                }
            });

        </script>
        <%@ include file="footer.jsp"%>
    </body>
</html>

