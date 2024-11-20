<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Footer</title>
    <link rel="stylesheet" href="./assests/fontawesome-free-6.2.1-web/css/all.css">
    <style>
        footer {
            background-color: rgba(0,255,255,0.4);
            color: #000;
            padding: 40px 0;
            margin-top: 30px;
        }
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .footer-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .footer-column {
            flex: 0 0 30%;
            margin-bottom: 20px;
        }
        footer h3 {
            font-size: 20px;
            margin-bottom: 20px;
        }
        footer p {
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 10px;
        }
        footer .social-icons a {
            color: #fff;
            font-size: 20px;
            margin-right: 15px;
        }
        footer .social-icons a:hover {
            color: #ddd;
        }
    </style>
</head>
<body>
    <footer>
        <div class="footer-container">
            <div class="footer-row">
                <div class="footer-column">
                    <h3>Về chúng tôi</h3>
                    <p>Chuyên cung cấp các sản phẩm điện thoại và laptop chính hãng với giá ưu đãi.</p>
                    <p>Cam kết chất lượng và dịch vụ hậu mãi tốt nhất.</p>
                </div>
                <div class="footer-column">
                    <h3>Liên hệ</h3>
                    <p><i class="fas fa-map-marker-alt"></i> Hồ Chí Minh, Việt Nam</p>
                    <p><i class="fas fa-phone"></i> 2403 2004</p>
                    <p><i class="fas fa-envelope"></i> inushopmoblie@haitauhai.com</p>
                </div>
                <div class="footer-column">
                    <h3>Theo dõi chúng tôi</h3>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <div style="text-align: center; margin-top: 20px;">
                <p>&copy; 2024 Inu Store.</p>
            </div>
        </div>
    </footer>
</body>
</html>