
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="footer_widgets color_two">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-7">
                    <div class="widgets_container contact_us">
                        <div class="footer_logo">
                            <a href="#"><img src="images/logo.png" alt="Logo" width="30%"></a>
                        </div>
                        <!--                                <div class="footer_desc">
                                                            <p>Get all types of perfume from us within 2 day delivery. We can even order the
                                                                perfumes which are not in our database. To do that kindly send a E-mail to the
                                                                company's mail id.</p>
                                                        </div>-->
                        <p>
                            <span>Address :</span> Đại Học FPT, Hòa Lạc, Hà Nội.
                        </p>
                        <p><span>Email :</span> <a href="#">anhndhe171346@gmail.com</a></p>
                        <p><span>Phone :</span> <a href="tel: +91 8888884444">1900 9090</a> </p>
                        <p style="margin-top: 20px">
                            <iframe 
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1862.2469951882954!2d105.52375863844954!3d21.012911347004714!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2sFPT%20University!5e0!3m2!1sen!2sus!4v1709303422456!5m2!1sen!2sus" width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                            </iframe>

                        </p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-sm-5">
                    <div class="widgets_container widget_menu">
                        <h3>Information</h3>
                        <div class="footer_menu">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="aboutus">About Us</a></li>
                                <li><a href="refine?cid_refine=0">Shopping</a></li>
                                <li><a href="refine?cid_refine=5">Gift set</a></li>
                                <li><a href="profile">My Account</a></li>
                                <li><a href="viewcart">Order</a></li>
                                <li><a href="viewwishlist">Wish List</a></li>
                                <li><a href="contact">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="widgets_container widgets_p_product">
                        <h3>Featured Products</h3>
                        <div class="small_product_container small_product_column1 owl-carousel">
                            <div class="small_product_list">
                                <c:forEach items="${requestScope.productFooter1}" var="p">
                                    <article class="single_product">
                                        <figure>
                                            <div class="product_thumb">
                                                <a href="#" class="primary_img">
                                                    <img src="${p.image[0]}" alt="">
                                                </a>
                                                <a href="#" class="secondary_img">
                                                    <img src="${p.image[1]}" alt="">
                                                </a>
                                            </div>
                                            <figcaption class="product_content">
                                                <h4 class="product_name">
                                                    <a href="#" style="color: white;">${p.name}</a>
                                                </h4>

                                                <div class="price_box">
                                                    <c:if test="${i.price != i.salePrice}">
                                                        <span class="old_price" style="color: white;">Rs. ${p.price}</span>
                                                    </c:if>
                                                    <span class="current_price" style="color: white;">Rs. ${p.salePrice}</span>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </c:forEach>
                            </div>
                            <div class="small_product_list">
                                <c:forEach items="${requestScope.productFooter2}" var="p">
                                    <article class="single_product">
                                        <figure>
                                            <div class="product_thumb">
                                                <a href="#" class="primary_img">
                                                    <img src="${p.image[0]}" alt="">
                                                </a>
                                                <a href="#" class="secondary_img">
                                                    <img src="${p.image[1]}" alt="">
                                                </a>
                                            </div>
                                            <figcaption class="product_content">
                                                <h4 class="product_name">
                                                    <a href="#" style="color: white;">${p.name}</a>
                                                </h4>

                                                <div class="price_box">
                                                    <c:if test="${i.price != i.salePrice}">
                                                        <span class="old_price" style="color: white;">Rs. ${p.price}</span>
                                                    </c:if>
                                                    <span class="current_price" style="color: white;">Rs. ${p.salePrice}</span>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="widgets_container widgets_p_product">
                        <h3>Most Viewed Products</h3>
                        <div class="small_product_container small_product_column1 owl-carousel">
                            <div class="small_product_list">
                                <c:forEach items="${requestScope.productFooter2}" var="p">
                                    <article class="single_product">
                                        <figure>
                                            <div class="product_thumb">
                                                <a href="#" class="primary_img">
                                                    <img src="${p.image[0]}" alt="">
                                                </a>
                                                <a href="#" class="secondary_img">
                                                    <img src="${p.image[1]}" alt="">
                                                </a>
                                            </div>
                                            <figcaption class="product_content">
                                                <h4 class="product_name">
                                                    <a href="#" style="color: white;">${p.name}</a>
                                                </h4>

                                                <div class="price_box">
                                                    <c:if test="${i.price != i.salePrice}">
                                                        <span class="old_price" style="color: white;">Rs. ${p.price}</span>
                                                    </c:if>
                                                    <span class="current_price" style="color: white;">Rs. ${p.salePrice}</span>
                                                </div>
                                            </figcaption>
                                        </figure>
                                    </article>
                                </c:forEach>
                            </div>
                            <div class="small_product_list">
                                <article class="single_product">


                                    <figure>
                                        <div class="product_thumb">
                                            <a href="#" class="primary_img">
                                                <img src="images/best-product/B4-1.png" alt="">
                                            </a>
                                            <a href="#" class="secondary_img"><img
                                                    src="images/best-product/B4-2.png" alt=""></a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="#" style="color: white;">Mugler Aura Women</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="old_price">Rs. 7999</span>
                                                <span class="current_price" style="color: white;">Rs. 7550</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                                <article class="single_product">


                                    <figure>
                                        <div class="product_thumb">
                                            <a href="#" class="primary_img">
                                                <img src="images/best-product/B5-1.png" alt="">
                                            </a>
                                            <a href="#" class="secondary_img"><img
                                                    src="images/best-product/B5-2.png" alt=""></a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="#" style="color: white;">Jimmy Choo Women Fever</a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="old_price">Rs. 7499</span>
                                                <span class="current_price" style="color: white;">Rs. 7200</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                                <article class="single_product">


                                    <figure>
                                        <div class="product_thumb">
                                            <a href="#" class="primary_img">
                                                <img src="images/best-product/B6-1.png" alt="">
                                            </a>
                                            <a href="#" class="secondary_img"><img
                                                    src="images/best-product/B6-2.png" alt=""></a>
                                        </div>
                                        <figcaption class="product_content">
                                            <h4 class="product_name">
                                                <a href="#" style="color: white;">Dloce & Gabbana Women </a>
                                            </h4>

                                            <div class="price_box">
                                                <span class="old_price">Rs. 7499</span>
                                                <span class="current_price" style="color: white;">Rs. 7200</span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <jsp:include page="copyright.jsp"/>
</footer>
