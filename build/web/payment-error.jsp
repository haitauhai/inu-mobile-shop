<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        .error-message {
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            color: #a94442;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>Payment Error</h1>
    <div class="error-message">
        An error occurred while processing your payment. This may be due to an invalid transaction or security issues. Please try again or contact customer support.
    </div>
    <a href="cart" class="btn">Return to Cart</a>
</body>
</html>