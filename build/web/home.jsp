<%-- 
    Document   : home
    Created on : Jan 4, 2024, 10:08:56 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./assests/fontawesome-free-6.2.1-web/css/all.css">
        <link rel="stylesheet" href="css/home.css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <img class="imgsale" src="./images/Banner-big--1920x450-1920x450-2.webp" alt="alt"/>
        <div class="photosale">
            <img src="./images/720x220-min-720x220-1.webp" alt="alt"/>
            <img src="./images/Lap-tet-720-220-720x220.webp" alt="alt"/>
        </div>
        <div class="phonesaleimg"><img  src="./images/Top-deal-soc2-1200x120-1.png" alt="alt"/></div>
        <div id="phonesale">
            <c:forEach items="${requestScope.dataPhone}" var="p">
                <div class="itemphone">
                    <ul>
                        <li><img src="${p.image}" alt="alt"/></li>
                        <li><span style="padding:3px;
                                  border-radius: 3px;">--Hot sale Tết--</span></li>
                        <li><a href="phoneproduct?id=${p.id}">${p.name}</a></li>
                        <li><p>Giá gốc: <del style="color:red;">${p.price+2000000}</del></p></li>
                        <li><p>Giá Giảm Giá: ${p.price}</p></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    <center><img src="images/7-ngay-02-1200x120.webp" style="
                 max-width: calc(80%);
                height: auto;
                display: block;"  alt="alt"/></center>
    <div id="laptopsale">
            <c:forEach items="${requestScope.datalaptop}" var="p">
                <div class="itemlaptop">
                    <ul>
                        <li><img src="./images/${p.img}" alt="alt"/></li>
                        <li><span style="padding:3px;
                                  border-radius: 3px;">--Hot sale Tết--</span></li>
                        <li><a href="#">${p.name}</a></li>
                        <li><p>Giá gốc: <del style="color:red;">${p.price+2000000}</del></p></li>
                        <li><p>Giá Giảm Giá: ${p.price}</p></li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    <jsp:include page="floatinglogo.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
        <script>
            
            function changeColor() {
                // Lấy tất cả các thẻ span trong các phần tử có lớp là "itemphone"
                var spanElements = document.querySelectorAll('.itemphone span, .itemlaptop span');

                // Tạo một mảng chứa các màu sắc để chuyển đổi
                var colors = ['#ff0000', '#00ff00', '#0000ff', '#ffff00', '#ff00ff', '#00ffff'];

                // Lặp qua NodeList và thay đổi màu nền của từng thẻ span liên tục
                var index = 0;
                setInterval(function () {
                    spanElements.forEach(function (spanElement) {
                        spanElement.style.backgroundColor = colors[index];
                    });
                    index = (index + 1) % colors.length;
                }, 1000); // 1000 milliseconds = 1 second
            }

            // Gọi hàm để bắt đầu thay đổi màu nền
            changeColor();

        </script>
    </body>

</html>
