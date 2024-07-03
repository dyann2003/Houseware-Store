<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
        <ul class="list-group category_block">
            <c:forEach items="${category}" var="o">
                <li class="list-group-item text-white ${tag == o.id ? "active":""}" style="border-top-width: 1px" ><a href="category?cid=${o.id}">${o.name}</a></li>
                </c:forEach>
        </ul>

    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last product</div>
        <div class="card-body">
            <img class="img-fluid" src="${p.image}" />
            <h4 class="card-title"><a href="detail?pid=${p.id}" title="View Product">${p.name}</a></h4>
            <p class="card-text">${p.describe}</p>
            <p class="bloc_left_price">
                <input type="hidden" id="amount" value="${p.price}">
                <span class="num currency" id="price"></span>
            </p>
        </div>
    </div>

    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Best Sellers</div>
        <c:forEach items="${productsTopSellers}" var="pts">
            <div class="card-body">
                <img class="img-fluid" src="${pts.image}" />
                <h4 class="card-title"><a href="detail?pid=${pts.id}" title="View Product">${pts.name}</a></h4>
                <hr>
            </div>
        </c:forEach>                        
    </div>

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


</div>
