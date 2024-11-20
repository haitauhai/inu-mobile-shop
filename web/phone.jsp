<%-- 
    Document   : phone
    Created on : Feb 24, 2024, 9:22:12 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/phone.css"/>
        <link rel="stylesheet" href="assests/fontawesome-free-6.2.1-web/css/all.css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <img class="imgsale" src="./images/Banner-big--1920x450-1920x450-2.webp" alt="alt"/>
            <div id="option">
                <form id="f1" action="phone" method="get">
                    <div id="brands">
                    <c:forEach var="c" items="${requestScope.listcate}">
                        <ul>
                            <li class="brand"><a onclick="change(this)" data-id="${c.id}" >${c.name}</a></li>
                        </ul>
                    </c:forEach>
                </div>
            </form>
            <script>
                function change(element) {
                    var brandId = element.getAttribute("data-id");
                    window.location.href = "phone?brandId=" + brandId;
                }
            </script>
            <div id="search">
                <form id="f2" action="Maincontroller" method="get">
                    <label for="brand">Brand:</label>
                    <select id="brand" name="brand">
                        <option value="0">-- Chọn brand --</option>
                        <option value="1">Iphone</option>
                        <option value="2">Samsung</option>
                        <option value="3">Oppo</option>
                        <option value="4">Xiaomi</option>
                        <option value="5">Vivo</option>
                        <option value="6">Realme</option>
                        <option value="7">Nokia</option>
                        <option value="8">Asus</option>
                    </select>

                    <label for="price">Price:</label>
                    <select id="price" name="price">
                        <option value="">-- Chọn mức giá --</option>
                        <option value="between 0 and 3000000">Dưới 3 triệu đồng</option>
                        <option value="between 3000000 and 6000000">Từ 3 triệu đến 6 triệu đồng</option>
                        <option value="between 6000000 AND 10000000">Từ 6 triệu đến 10 triệu đồng</option>
                        <option value="between 10000000 AND 15000000">Từ 10 triệu đến 15 triệu đồng</option>
                        <option value=">15000000">Trên 15 triệu đồng</option>
                    </select>

                    <label for="ram">Ram:</label>
                    <select id="ram" name="ram">
                        <option value="0">-- Chọn dung lượng RAM --</option>
                        <option value="2">2GB</option>
                        <option value="4">4GB</option>
                        <option value="6">6GB</option>
                        <option value="8">8GB</option>
                        <option value="12">12GB</option>
                    </select>

                    <label for="rom">Rom:</label>
                    <select id="rom" name="rom">
                        <option value="0">-- Chọn dung lượng ROM --</option>
                        <option value="32">32GB</option>
                        <option value="64">64GB</option>
                        <option value="128">128GB</option>
                        <option value="256">256GB</option>
                    </select>
                    <input type="hidden" name="action" value="SearchProduct">
                    <input type="submit" value="Tìm kiếm">
                </form>
            </div>
            <!--            <script>
                            window.addEventListener('DOMContentLoaded', (event) => {
                                const form = document.querySelector('form');
                                form.addEventListener('submit', (event) => {
                                    event.preventDefault();
                                    resetForm();
                                });
                                function resetForm() {
                                    const selects = document.querySelectorAll('select');
                                    selects.forEach(select => {
                                        select.value = '';
                                    });
                                }
                            });
                        </script>-->
        </div>
        <h3 class="title">LIST PRODUCT (${requestScope.size} product) </h3>
        <div id="phoneproduct">
            <c:forEach items="${requestScope.listphone}" var="p">
                <c:choose>
                    <c:when test="${p.stock > 0}">
                        <div class="itemphone">
                            <ul>
                                <li><img src="${p.image}" alt="alt"/></li>
                                <li><span style="padding:3px; border-radius: 3px;">Giảm giá mạnh</span></li>
                                <li><a href="phoneproduct?id=${p.id}">${p.name}</a></li>
                                <li><p>Giá gốc: <del style="color:red;">${p.price + 2000000}</del></p></li>
                                <li><p>Giá Giảm Giá: ${p.price}</p></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Do nothing or display a message indicating out of stock -->
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
