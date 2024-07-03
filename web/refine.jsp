<%-- 
    Document   : refine
    Created on : Dec 20, 2023, 7:55:37 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Houseware Store</title>
        <link rel="icon" href="images/logo1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style2.css">
        <style>
            li a:hover {
                color: #f6692a;
            }
            ul li a.active {
                color: #f6692a;
            }

            .li_header {
                color: white;
                margin-left: 50px;
                font-size: 18px;
            }

            .submit-price {
                font-size: 16px;
                background-color: black;
                color: white;
                font-weight: 600;
                padding: 5px 40px;
                border-radius: 20px;
                margin: 10px 0 20px
            }

            .submit-price:hover {
                background-color: rgba(0,0,0,0.3);
                color: black;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <%@ include file="menu.jsp"%>

        <div class="home_section_two color_two"">
            <div class="container">
                <div class="row" style="margin-top: 120px">
                    <div class="col-sm-3">
                        <div class="home_section_left mb-3">
                            <!-- testimonial section starts  -->
                            <a href="home" class="btn btn-info btn-lg" style="font-size: 20px; margin-right: 5px">
                                <span class="glyphicon glyphicon-home"></span> Home
                            </a>
                            <c:set var="cat" value="${requestScope.category}"/>
                            <div class="testimonial_style_two mb-60 rightleft">
                                <div class="testimonial_container">
                                    <div class="section_title section_title_style2">
                                        <h2 style="font-size: 20px">Filter</h2>
                                        <i style="font-size: 18px; margin-left: 5px" class="fa fa-filter"></i>
                                    </div>
                                    <form id="f1" action="refine" method="get">
                                        <div class="section_title section_title_style2">
                                            <fieldset class="responsiveFacets_sectionContent " aria-hidden="false">
                                                <div class="responsiveFacets_sectionItemLabel">
                                                    <input type="checkbox" class="responsiveFacets_sectionItemCheckbox" 
                                                           ${chid[0]?"checked":""} 
                                                           id="c0" 
                                                           name="cid_refinee"
                                                           value="${0}" onclick="setCheck(this)">
                                                    <label class="responsiveFacets_sectionItem" for="brand">
                                                        ALL (${allproduct.size()})
                                                    </label>
                                                </div>
                                                <c:if test="${cat!=null}">
                                                    <c:forEach begin="0" end="${cat.size()-1}" var="i">
                                                        <div class="responsiveFacets_sectionItemLabel">
                                                            <input
                                                                type="checkbox"
                                                                ${cat.get(i).getId()==cid_refine?"checked":""}
                                                                class="responsiveFacets_sectionItemCheckbox"
                                                                id="cm" 
                                                                name="cid_refinee"
                                                                value="${cat.get(i).getId()}"
                                                                ${chid[i+1]?"checked":""}
                                                                onclick="setCheck(this)"/>
                                                            <label class="responsiveFacets_sectionItem" for="brand" >
                                                                ${cat.get(i).name} (${cat.get(i).getTotalProduct()})
                                                            </label>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </fieldset>
                                        </div>

                                        <div class="section_title section_title_style2">
                                            <h2 style="font-size: 16px">Price</h2>
                                            <fieldset class="responsiveFacets_sectionContent " aria-hidden="false">
                                                <div class="shopee-filter-group__body shopee-price-range-filter__edit">
                                                    <div class="shopee-price-range-filter__inputs" style="margin: 1.25rem 2px 0.625rem;
                                                         display: flex;
                                                         justify-content: space-between;
                                                         align-items: center;
                                                         padding-right: 30px">
                                                        <input type="number" style="width: 90px" name="pricefrom" class="shopee-price-range-filter__input" placeholder="FROM" value="${price1 == 0 ? "" : price1}" step="0.5" min=1>
                                                        <div class="shopee-price-range-filter__range-line" style="
                                                             flex: 1;
                                                             height: 1px;
                                                             background: #bdbdbd;
                                                             margin: 0 10px;">
                                                        </div>
                                                        <input type="number" style="width: 90px" name="priceto" class="shopee-price-range-filter__input" placeholder="TO" value="${price2 == 0 ? "" : price2}" step="0.5" min=1">
                                                    </div>
                                                    <button class="submit-price" style="">Apply</button>

                                                </div>
                                            </fieldset>
                                        </div>
                                        <button class="btn btn-warning" type="button" style="font-size: 20px; width: 40%; border-radius: 10%"><a href="refine?cid_refinee=0">Reset</a></button>
                                    </form>
                                </div>
                            </div>
                            <!-- testimonial section ends -->
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="row">
                            <c:forEach items="${allproduct}" var="o">
                                <c:if test="${cid_refine == 0}">
                                    <div class="col-12 col-md-6 col-lg-4" style="margin-bottom: 20px">
                                        <div class="card">
                                            <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                            <div class="card-body">
                                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></h4>
                                                <div class="row">
                                                    <div class="col">
                                                        <p class="btn btn-danger btn-block">
                                                            <input type="hidden" class="amount" value="${o.price}">
                                                            <span class="num currency price"></span>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col" style="padding-top: 3px">
                                                        <a href="cart?role=add&id=${o.id}&quantity=1" class="btn btn-success btn-block">Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>


            <div class="pagination col-md-12" style="margin-top: 20px; display: flex; justify-content: center">
                <c:if test="${requestScope.cid_refinee == null}">
                    <c:forEach begin="${1}" end="${requestScope.numberpage}" var="i">
                        <a href="refine?page=${i}">${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${requestScope.cid_refinee != null}">
                    <c:forEach begin="${1}" end="${requestScope.numberpage}" var="i"> 
                        <a href="refine?${stringForLink}&pricefrom=${price1}&priceto=${price2}&page=${i}">${i}</a>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <button id="myBtn" title="Lên đầu trang" style="border-radius: 30%; width: 40px"> <i class="fa fa-chevron-up" style="color: black"></i></button>

        <jsp:include page="footer.jsp"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>   
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>
        <script src="js/countdown.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <script src="js/clickevents.js"></script>
        <!--<script src="js/main.js"></script>-->
        <script type="text/javascript">
                                                                    function setCheckk(obj) {
                                                                        var fries = document.getElementsByName('discount');
                                                                        var checked = obj.value;
                                                                        console.log(obj.checked)
                                                                        for (var i = 0; i < fries.length; i++) {
                                                                            if (checked == fries[i].value) {
                                                                                fries[i].checked = obj.checked;
                                                                            } else {
                                                                                fries[i].checked = false;
                                                                            }
                                                                        }

                                                                        document.getElementById('f1').submit();
                                                                    }


                                                                    function setCheck(obj) {
                                                                        var fries = document.getElementsByName('cid_refinee');
                                                                        if ((obj.id == 'c0') && (fries[0].checked) == true) {
                                                                            for (var i = 1; i < fries.length; i++) {
                                                                                fries[i].checked = false;
                                                                            }
                                                                        } else {
                                                                            for (var i = 1; i < fries.length; i++) {
                                                                                if (fries[i].checked == true) {
                                                                                    fries[0].checked = false;
                                                                                    break;
                                                                                }
                                                                            }
                                                                        }
                                                                        document.getElementById('f1').submit();
                                                                    }


                                                                    function searchByName() {
                                                                        var text = document.querySelector("#searchId").value;
                                                                        $.ajax({
                                                                            url: "/PefumeMN-Website/search",
                                                                            type: "get",
                                                                            data: {
                                                                                txt: text
                                                                            },
                                                                            success: function (data) {
                                                                                var row = document.getElementById("contentt");
                                                                                row.innerHTML = data;
                                                                            },
                                                                            error: function (xhr) {
                                                                            }
                                                                        });
                                                                    }
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

                                                                    document.getElementById('myBtn').addEventListener("click", function () {
                                                                        document.body.scrollTop = 0;
                                                                        document.documentElement.scrollTop = 0;
                                                                    });

                                                                    document.addEventListener("DOMContentLoaded", function () {
                                                                        // Select all subtotal, shipping, and total elements
                                                                        let priceElements = document.querySelectorAll('.col-12.col-md-6.col-lg-4');

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



        </script>
    </body>
    <div class="modal fade" id="modal_box" role="dialog"></div>
</html>
