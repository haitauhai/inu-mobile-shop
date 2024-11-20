<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Order</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 15px 30px rgba(0,0,0,0.1);
                width: 90%;
                max-width: 1000px;
                margin: 20px;
            }
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
                font-size: 28px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            .order-content {
                display: flex;
                flex-wrap: wrap;
                gap: 30px;
            }
            .order-image-container {
                flex: 1;
                min-width: 300px;
            }
            .order-details {
                flex: 2;
                min-width: 300px;
            }
            .order-image {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
            }
            .order-info {
                margin-bottom: 20px;
            }
            .order-info label {
                font-weight: bold;
                color: #555;
                display: block;
                margin-bottom: 5px;
            }
            .order-info p {
                margin: 0;
                color: #333;
                font-size: 16px;
                line-height: 1.5;
            }
            .button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 500;
                transition: background-color 0.3s ease;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                margin-top: 20px;
                margin-right: 10px;
            }
            .button:hover {
                background-color: #45a049;
            }
            .button.secondary {
                background-color: #008CBA;
            }
            .button.secondary:hover {
                background-color: #007B9A;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Order Details</h2>
            <div class="order-content">
                <div class="order-image-container">
                    <img src="${order.image}" alt="${order.name}" class="order-image">
                </div>
                <div class="order-details">
                    <div class="order-info">
                        <label>Order ID:</label>
                        <p>${order.id}</p>
                    </div>
                    <div class="order-info">
                        <label>Username:</label>
                        <p>${order.username}</p>
                    </div>
                    <div class="order-info">
                        <label>Product ID:</label>
                        <p>${order.idProduct}</p>
                    </div>
                    <div class="order-info">
                        <label>Product Name:</label>
                        <p>${order.name}</p>
                    </div>
                    <div class="order-info">
                        <label>Quantity:</label>
                        <p>${order.quantity}</p>
                    </div>
                    <div class="order-info">
                        <label>Address:</label>
                        <p>${order.address}</p>
                    </div>
                    <div class="order-info">
                        <label>Phone Number:</label>
                        <p>${order.phoneNumber}</p>
                    </div>
                    <div class="order-info">
                        <label>Note:</label>
                        <p>${order.note}</p>
                    </div>
                    <div class="order-info">
                        <label>Amount:</label>
                        <p>$${order.amount}</p>
                    </div>
                    <div class="order-info">
                        <label>Status:</label>
                        <p>${order.status}</p>
                    </div>
                    <div class="order-info">
                        <label>Order Date:</label>
                        <p>${order.date}</p>
                    </div>
                    <a href="admin#orders" class="button secondary">Back to Admin Orders</a>
                </div>
            </div>
        </div>
    </body>
</html>