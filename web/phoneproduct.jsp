

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/phoneproduct.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="Menu.jsp"/>
        <div id="container">
            <h2 class="title"><c:out value="${itemphone.name}"/></h2>
            <div class="dash"></div>
            <div class = "col1">
                <image class ="img" src="<c:out value="${itemphone.image}"/>">
                <p>Describle: ${itemphone.describe}</p>
            </div>
            <div class ="col2">
                <h2 class="price">Price: ${itemphone.price}đ</h2>
                <br>
                <div class="button">
                    <a class="buy" href="buy?id=${itemphone.id}">Buy now</a>
                    <a class="add" href="addtocart?id=${itemphone.id}&&cateid=${itemphone.pcid}">Add to cart</a>
                </div>
                <br>
                <h3 class="infor">Information of product:</h3>
                <div class="tableinfor">
                    <table >
                        <tr>
                            <th>Parameter</th>
                            <th>Detail</th>
                        </tr>
                        <tr>
                            <td>Display:</td>
                            <td>${itemphone.display}</td>
                        </tr>
                        <tr>
                            <td>Front Camera:</td>
                            <td>${itemphone.f_camera}</td>
                        </tr>
                        <tr>
                            <td>Rear camera:</td>
                            <td>${itemphone.r_camera}</td>
                        </tr>
                        <tr>
                            <td>Chip:</td>
                            <td>${itemphone.chip}</td>
                        </tr>
                        <tr>
                            <td>Ram:</td>
                            <td>${itemphone.ram}GB</td>
                        </tr>
                        <tr>
                            <td>Rom:</td>
                            <td>${itemphone.rom}GB</td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--                    hãy viết more product tại đây-->
            <div class="more-products">
                <h2 class="title">More Products</h2>
                <div class="dash"></div>
                <div class="product-list">
                    <c:forEach var="product" items="${listProduct}">
                        <c:if test="${product.id ne itemphone.id}">
                            <div class="product">
                                <div class="product-image">
                                    <img src="<c:out value="${product.image}"/>" alt="<c:out value="${product.name}"/>">
                                </div>
                                <div class="product-info">
                                    <h3><a href="phoneproduct?id=${product.id}"><c:out value="${product.name}"/></a></h3>
                                    <p><b>Price:</b> ${product.price}đ</p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>
        </div>
                        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
