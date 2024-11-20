<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Error Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                max-width: 800px;
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
                color: #e74c3c;
                margin-bottom: 30px;
            }

            .error-container {
                background-color: #fff;
                border-radius: 8px;
                padding: 30px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .error-message {
                text-align: center;
                font-size: 18px;
                margin-bottom: 20px;
            }

            .error-details {
                background-color: #ecf0f1;
                border-radius: 4px;
                padding: 15px;
                margin-bottom: 20px;
            }

            .back-btn {
                display: block;
                width: 200px;
                margin: 0 auto;
                padding: 10px;
                background-color: #3498db;
                color: #fff;
                text-align: center;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .back-btn:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <div class="breadcrumb">
            <a href="home">Home</a> &gt; Error
        </div>

        <div class="error-container">
            <h2>Oops! An Error Occurred</h2>
            <div class="error-message">
                We're sorry, but something went wrong while processing your request.
            </div>
            <div class="error-details">
                <strong>Error details:</strong>
                <p>${pageContext.exception.message}</p>
            </div>
            <a href="home" class="back-btn">Back to Home</a>
        </div>
    </body>
</html>