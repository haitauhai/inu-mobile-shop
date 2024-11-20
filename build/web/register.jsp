<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            * { padding: 0; margin: 0; box-sizing: border-box; }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: white;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                width: 350px;
            }
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            input, select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            input:focus, select:focus {
                outline: none;
                border-color: #E00000;
            }
            button {
                width: 100%;
                padding: 12px;
                background-color: #E00000;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #C00000;
            }
            .step {
                display: none;
            }
            .step.active {
                display: block;
            }
            .errorMessage {
                color: red;
                font-size: 14px;
                margin-top: 5px;
            }
            .valid {
                color: green;
            }
            .invalid {
                color: red;
            }
            button:disabled {
                cursor: not-allowed;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Register</h2>
            <center><h5 style="color:red;">${requestScope.fail}</h5></center>
            <form id="registerForm" action="Maincontroller" method="post" onsubmit="return validateForm()">
                <div id="step1" class="step active">
                    <div class="form-group">
                        <input type="text" id="txtUser" name="username" placeholder="Username" required>
                        <p id="usernameError" class="errorMessage"></p>
                    </div>
                    <div class="form-group">
                        <input type="password" id="txtPass" name="password" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input type="password" id="reenterPassword" name="repassword" placeholder="Re-enter Password" required>
                        <p id="passwordError" class="errorMessage"></p>
                    </div>
                    <button type="button" id="nextBtn">Next</button>
                </div>

                <div id="step2" class="step">
                    <div class="form-group">
                        <input type="text" name="name" placeholder="Full Name" required>
                    </div>
                    <div class="form-group">
                        <input type="tel" name="phonenumber" placeholder="Phone Number" required>
                    </div>
                    <div class="form-group">
                        <select id="province" name="province">
                            <option value="">Tỉnh/Thành phố</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="district" name="district">
                            <option value="">Quận/Huyện</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="ward" name="ward">
                            <option value="">Phường/Xã</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" name="address" placeholder="Detailed Address" required>
                    </div>
                    <input type="hidden" name="action" value="Register">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>

        <script src="js/register.js"></script>
    </body>
</html>