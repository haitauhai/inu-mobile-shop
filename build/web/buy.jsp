<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                background-color: #f4f4f4;
                color: #333;
            }
            #container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .breadcrumb {
                margin-bottom: 20px;
                font-size: 14px;
            }
            .breadcrumb a {
                color: #009688;
                text-decoration: none;
            }
            .breadcrumb a:hover {
                text-decoration: underline;
            }
            .title {
                color: #009688;
                text-align: center;
                margin-bottom: 20px;
            }
            .dash {
                height: 2px;
                background-color: #009688;
                margin-bottom: 20px;
            }
            .product-details {
                display: flex;
                flex-wrap: wrap;
                gap: 30px;
                margin-bottom: 30px;
            }
            .product-image {
                flex: 1;
                min-width: 300px;
            }
            .product-image img {
                width: 100%;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .product-info {
                flex: 2;
                min-width: 300px;
            }
            .price {
                color: #e53935;
                margin-bottom: 20px;
            }
            .product-table {
                width: 100%;
                border-collapse: collapse;
            }
            .product-table th,
            .product-table td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }
            .product-table th {
                background-color: #f2f2f2;
                font-weight: bold;
                text-align: left;
            }
            .customer-info {
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 8px;
            }
            .customer-title {
                color: #009688;
                margin-bottom: 20px;
            }
            form label {
                display: block;
                margin-bottom: 5px;
                color: #666;
            }
            form input[type="text"],
            form textarea,
            .css_select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            form textarea {
                height: 100px;
                resize: vertical;
            }
            .select-container {
                display: flex;
                gap: 10px;
                margin-bottom: 15px;
            }
            .css_select {
                flex: 1;
            }
            input[type="submit"] {
                background-color: #009688;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #00796b;
            }
            .payment-options {
                margin-bottom: 15px;
            }
            .payment-options label {
                display: inline-block;
                margin-right: 15px;
            }
            @media (max-width: 768px) {
                .product-details {
                    flex-direction: column;
                }
                .select-container {
                    flex-direction: column;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div id="container">
                <div class="breadcrumb">
                    <a href="home">Home</a> &gt; Buy
                </div>
                <h2 class="title"><c:out value="${itemphone.name}"/></h2>
            <div class="dash"></div>
            <div class="product-details">
                <div class="product-image">
                    <img class="img" src="<c:out value='${itemphone.image}'/>" alt="Product Image">
                </div>
                <div class="product-info">
                    <h2 class="price">Price: ${itemphone.price}đ</h2>
                    <table class="product-table">
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
                            <td>Rear Camera:</td>
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
            <div class="customer-info">
                <h3 class="customer-title">Customer Information</h3>
                <form id="orderForm" action="processOrder" method="post">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${sessionScope.user.name}" required>

                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="${sessionScope.user.phoneNumber}" required>

                    <div class="select-container">
                        <select class="css_select" id="province" name="province" required>
                            <option value="">Select Province</option>
                        </select> 
                        <select class="css_select" id="district" name="district" required>
                            <option value="">Select District</option>
                        </select> 
                        <select class="css_select" id="ward" name="ward" required>
                            <option value="">Select Ward</option>
                        </select>
                    </div>

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" placeholder="House Number, Road,..." value="${sessionScope.user.getSpecific(sessionScope.user.fullAddress,0)}" required>

                    <label for="note">Note:</label>
                    <textarea id="note" name="note" rows="4"></textarea>

                    <label for="payment-method">Payment Method:</label>
                    <div class="payment-options">
                        <label>
                            <input type="radio" name="payment-method" value="cod" checked> Cash on Delivery
                        </label>
                        <label>
                            <input type="radio" name="payment-method" value="vnpay"> VNPAY
                        </label>
                    </div>

                    <input type="hidden" name="idproduct0" value="${itemphone.id}">
                    <input type="hidden" name="quantity0" value="1">
                    <input type="hidden" name="nameProduct0" value="${itemphone.name}">
                    <input type="hidden" name="price0" value="${itemphone.price}">
                    <input type="hidden" name="amount" value="${itemphone.price}">

                    <input type="submit" value="Place Order" onclick="processPayment(event)">
                </form>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="./js/buy.js"></script>
    </body>
</html>