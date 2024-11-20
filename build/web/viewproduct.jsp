<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Product</title>
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
            .product-content {
                display: flex;
                flex-wrap: wrap;
                gap: 30px;
            }
            .product-image-container {
                flex: 1;
                min-width: 300px;
            }
            .product-details {
                flex: 2;
                min-width: 300px;
            }
            .product-image {
                max-width: 100%;
                height: auto;
                border-radius: 8px;
            }
            .product-info {
                margin-bottom: 20px;
            }
            .product-info label {
                font-weight: bold;
                color: #555;
                display: block;
                margin-bottom: 5px;
            }
            .product-info p {
                margin: 0;
                color: #333;
                font-size: 16px;
                line-height: 1.5;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
                font-weight: bold;
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
            <h2>Product Details</h2>
            <div class="product-content">
                <div class="product-image-container">
                    <img src="${product.image}" alt="${product.name}" class="product-image">
                </div>
                <div class="product-details">
                    <div class="product-info">
                        <label>ID:</label>
                        <p>${product.id}</p>
                    </div>
                    <div class="product-info">
                        <label>Name:</label>
                        <p>${product.name}</p>
                    </div>
                    <div class="product-info">
                        <label>Price:</label>
                        <p>$${product.price}</p>
                    </div>
                    <div class="product-info">
                        <label>Brand:</label>
                        <p id="brand-name"></p>
                    </div>
                    <div class="product-info">
                        <label>Stock:</label>
                        <p>${product.stock}</p>
                    </div>
                    <div class="product-info">
                        <label>Description:</label>
                        <p>${product.describe}</p>
                    </div>
                    <table>
                        <tr>
                            <th>Specification</th>
                            <th>Value</th>
                        </tr>
                        <tr>
                            <td>Display</td>
                            <td>${product.display}</td>
                        </tr>
                        <tr>
                            <td>Front Camera</td>
                            <td>${product.f_camera}</td>
                        </tr>
                        <tr>
                            <td>Rear Camera</td>
                            <td>${product.r_camera}</td>
                        </tr>
                        <tr>
                            <td>Chip</td>
                            <td>${product.chip}</td>
                        </tr>
                        <tr>
                            <td>RAM</td>
                            <td>${product.ram} GB</td>
                        </tr>
                        <tr>
                            <td>ROM</td>
                            <td>${product.rom} GB</td>
                        </tr>
                    </table>
                    <a href="admin#products" class="button secondary">Back to Admin Products</a>
                </div>
            </div>
        </div>
    </body>
    <script>
        const brandMapping = {
            1: 'Iphone',
            2: 'Samsung',
            3: 'Oppo',
            4: 'Xiaomi',
            5: 'Vivo',
            6: 'Realme',
            7: 'Nokia',
            8: 'Asus'
        };

        const pcid = ${product.pcid}; // Thay thế bằng giá trị thực tế của product.pcid
        document.getElementById('brand-name').textContent = brandMapping[pcid];
    </script>
</html>