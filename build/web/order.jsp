<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Orders</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f4f4f4;
            }

            .breadcrumb {
                margin-bottom: 20px;
                font-size: 14px;
            }

            .breadcrumb a {
                color: #3498db;
                text-decoration: none;
            }

            .breadcrumb a:hover {
                text-decoration: underline;
            }

            h2 {
                text-align: center;
                color: #2c3e50;
                margin-bottom: 30px;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background-color: #fff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                margin-bottom: 20px;
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            th {
                background-color: #3498db;
                color: #fff;
                font-weight: bold;
                text-transform: uppercase;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            .status {
                font-weight: bold;
                padding: 5px 10px;
                border-radius: 4px;
            }

            .status-pending {
                background-color: #f39c12;
                color: #fff;
            }

            .status-processing {
                background-color: #3498db;
                color: #fff;
            }

            .status-shipped {
                background-color: #2ecc71;
                color: #fff;
            }

            .status-delivered {
                background-color: #27ae60;
                color: #fff;
            }

            .status-cancelled {
                background-color: #e74c3c;
                color: #fff;
            }
            .product-image {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 4px;
            }
            .no-orders {
                text-align: center;
                padding: 20px;
                font-size: 18px;
                color: #777;
            }
        </style>
    </head>
    <body>
        <div class="breadcrumb">
            <a href="home">Home</a> &gt; My Orders
        </div>
        <h2>My Orders</h2>
        <c:choose>
            <c:when test="${empty orders}">
                <div class="no-orders">
                    Bạn chưa có đơn hàng nào.
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Order Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.id}</td>
                                <td><img src="${order.image}" alt="${order.name}" class="product-image"></td>
                                <td>${order.name}</td>
                                <td>${order.quantity}</td>
                                <td>đ<fmt:formatNumber value="${order.amount}" pattern="#,###" /></td>
                                <td><span class="status status-${order.status.toLowerCase()}">${order.status}</span></td>
                                <td><fmt:formatDate value="${order.date}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
        <script>
            // You can add JavaScript here if needed
        </script>
    </body>
</html>