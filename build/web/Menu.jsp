<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assests/fontawesome-free-6.2.1-web/css/all.css">
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            html {
                font-family: Arial, Helvetica, sans-serif;
            }
            .clear {
                clear: both;
            }
            #nav input{
                text-indent: 10px;
            }
            #header{
                padding-top: 10px;
                align-items: center;
                display: flex;
                justify-content: center;
                background-color: rgba(0,255,255,0.4);
            }
            #nav>li {
                position: relative;
                display: inline-block;
            }
            #nav>li>a,#nav>li>form{
                color:rgba(0,0,0,0.6);
                text-decoration: none;
                padding:  0 14px 0 14px;
                line-height: 40px;
            }
            #searchheader{
                height: 40px;
                border-radius: 6px;
                width: 300px;
                border: 1px solid #ccc;
            }
            #submitheder{
                height: 40px;
                border-radius: 6px;
                border: 1px solid #ccc;
                padding: 0 12px 0 12px;
            }
            #logoheader{
                display: block;
                padding: 0 40px 0 40px;
                height: 48px;
            }
            .shoppingcart,.account{
                border: 1px solid #ccc;
                border-radius: 6px;
                background-color: rgba(0,255,255,0.7);
            }
            .shoppingcart:hover a{
                color: red;
            }
            #categories-header{
                height: 50px;
                padding: 15px 13% 5px 13%;
                align-items: center;
                display: flex;
                justify-content: center;
                background-color: rgba(0,255,255,0.4);
            }
            #categories>li{
                position: relative;
                display: inline-block;
                padding: 0 30px 0 30px;
            }
            #categories>li>a{
                display: block;
                text-decoration: none;
                font-size: 16px;
                color: black;
            }
            #categories li:hover a{
                background-color: rgba(0,255,255,0.7);
            }
            /* New styles for the cart badge */
            .shoppingcart {
                position: relative;
            }
            .cart-badge {
                position: absolute;
                top: -10px;
                right: -10px;
                background-color: red;
                color: white;
                border-radius: 50%;
                padding: 2px 6px;
                font-size: 12px;
                font-weight: bold;
            }
            #order{
                margin-left: 5px;
            }
            .user-popup {
                display: none;
                position: absolute;
                top: 100%;
                right: 0;
                background-color: white;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
                z-index: 1000;
            }
            .user-popup ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
            }
            .user-popup ul li {
                padding: 10px 20px;
            }
            .user-popup ul li:hover {
                background-color: #f0f0f0;
            }
            .user-popup ul li a {
                text-decoration: none;
                color: #333;
                display: block;
            }
            .account {
                margin-left: 5px;
                position: relative;
            }
        </style>
    </head>
    <body>
        <div id="header">
            <img id="logoheader" src="./images/logo-text.png" alt="alt"/>
            <ul id="nav">
                <li><a href="home" class="fa-solid fa-house"></a></li>
                <li ><form>
                        <input id="searchheader" type="text" placeholder="Hôm nay bạn muốn tìm gì??">
                        <button id="submitheder" type="submit">
                            <i  class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form></li>
                <li class="shoppingcart">
                    <a href="cart" ><i class="fa-solid fa-cart-shopping"></i>Giỏ hàng</a>
                    <c:if test="${sessionScope.number != null && sessionScope.number != 0}">
                        <span class="cart-badge">${sessionScope.number}</span>
                    </c:if>

                </li>
                <li class="account" id="order">
                    <a href="order">Ðơn hàng</a>
                    <c:if test="${sessionScope.numberorder != null && sessionScope.numberorder != 0}">
                        <span class="cart-badge">${sessionScope.numberorder}</span>
                    </c:if>
                </li>
                    <c:choose>
                        <c:when test="${sessionScope.user!=null}">
                        <li class="account">
                            <a href="#" onclick="toggleUserPopup(event)">
                                ${sessionScope.user.name} <i class="fa-solid fa-user"></i>
                            </a>
                            <div class="user-popup" id="userPopup">
                                <ul>
                                    <li><a href="profile?username=${sessionScope.user.username}">Thông tin cá nhân</a></li>
                                    <li><a href="order">Đơn hàng</a></li>
                                    <c:if test="${sessionScope.user.role==1}">
                                    <li><a href="admin">Quản lí cửa hàng</a></li>
                                    </c:if>
                                    <li><a href="logout">Đăng xuất</a></li>
                                </ul>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="account"><a href="login">Tài khoản</a></li>
                        </c:otherwise>
                    </c:choose>

                <li><a href="#">Hỏi đáp</a></li>
            </ul>
        </div>
        <div id="categories-header">
            <ul id="categories">
                <c:set var="cate" value="${['phone', 'laptop', 'tablet', 'accessories', 'clock', 'more']}" />
                <c:forEach items="${requestScope.data}" var="c">
                    <li><a href="${cate[c.id-1]}">${c.name}</a></li>
                    </c:forEach>
            </ul>
        </div>
    </body>
    <script>
        function toggleUserPopup(event) {
            event.preventDefault();
            var popup = document.getElementById("userPopup");
            popup.style.display = popup.style.display === "block" ? "none" : "block";
        }

        // Close the popup when clicking outside
        window.onclick = function (event) {
            if (!event.target.matches('.account a')) {
                var popup = document.getElementById("userPopup");
                if (popup.style.display === "block") {
                    popup.style.display = "none";
                }
            }
        }
    </script>
</html>