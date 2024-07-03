<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <div class="main_header header_transparent header-mobile-m">
        <div class="header_container sticky-header" style="padding: 0">
            <div class="container-fluid" style="background-color: black">
                <div class="row align-items-center" style="padding: 8px 0">
                    <div class="col-lg-4">
                        <div class="logo">
                            <a href="home"><img src="images/logo.png" alt="" ></a>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <form action="searchProduct" method="post" style="display: flex; justify-content: center">
                            <input value="${txtSearch}" id="searchId" type="text" placeholder="Search your product" name="txt">
                            <button type="submit" style="border-radius: 50%; width: 40px; font-size: 18px;"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <div class="col-lg-7">
                        <!-- main-menu starts -->
                        <div class="main_menu menu_two menu_position">
                            <nav>
                                <ul>
                                    <li class="mega_items">
                                        <a href="#">Collections <i class="fa fa-angle-down"></i></a>
                                        <div class="mega_menu">
                                            <ul class="mega_menu_inner">
                                                <li style="color: black; font-size: 16px">

                                                    <a href="refine?cid_refinee=${0}">ALL</a>
                                                </li>
                                                <c:forEach items="${requestScope.category}" var="c">
                                                    <li style="color: black; font-size: 16px">
                                                        <a href="refine?cid_refinee=${c.id}">${c.name}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </li>
                                    <li><a href="aboutus">About Us</a></li>
                                        <c:if test="${sessionScope.account==null}">
                                        <li>
                                            <a href="#">User <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
                                                <li><a href="login">Login</a></li>
                                                <li><a href="register">Sign Up</a></li>
                                            </ul>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.account!=null}">
                                        <li>
                                            <a href="profile">Profile</a> 
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.account.getRoleID() == 1}">
                                        <li><a href="manager">Manager Product</a>
                                        </li>
                                        <li><a href="managerAccount">Manager Account</a>
                                        </li>
                                        <li><a href="ordermanager">Manager Order</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div> 
                        <!-- main menu ends -->
                    </div>
                    <div class="col-lg-5">
                        <%@ include file="header_right.jsp"%>
                    </div>
                </div>

            </div>
        </div>
    </div>
</header>

<!--end of menu-->