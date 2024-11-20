<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
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
                width: 100%;
                max-width: 600px;
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
            .form-group {
                margin-bottom: 25px;
            }
            label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: 500;
            }
            input[type="text"], 
            input[type="number"], 
            textarea, 
            select {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 6px;
                box-sizing: border-box;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }
            input[type="text"]:focus, 
            input[type="number"]:focus, 
            textarea:focus, 
            select:focus {
                border-color: #4CAF50;
                outline: none;
                box-shadow: 0 0 0 2px rgba(76,175,80,0.2);
            }
            input[type="file"] {
                margin-top: 8px;
            }
            textarea {
                resize: vertical;
                min-height: 100px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
                font-weight: 500;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .file-input-wrapper {
                position: relative;
                overflow: hidden;
                display: inline-block;
            }
            .file-input-wrapper input[type=file] {
                font-size: 100px;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
            }
            .file-input-wrapper .btn-file-input {
                background-color: #f0f0f0;
                border: 1px solid #ddd;
                border-radius: 6px;
                padding: 10px 20px;
                display: inline-block;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Add New Product</h2>
            <form action="Maincontroller" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="id">ID: </label>
                    <input type="number" id="id" name="id" >
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="image">Image:</label>
                    <div class="file-input-wrapper">
                        <button class="btn-file-input">Choose file</button>
                        <input type="file" id="image" name="image" accept="image/*" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" required>
                </div>

                <div class="form-group">
                    <label for="display">Display:</label>
                    <input type="text" id="display" name="display">
                </div>

                <div class="form-group">
                    <label for="f_camera">Front Camera:</label>
                    <input type="text" id="f_camera" name="f_camera">
                </div>

                <div class="form-group">
                    <label for="r_camera">Rear Camera:</label>
                    <input type="text" id="r_camera" name="r_camera">
                </div>

                <div class="form-group">
                    <label for="chip">Chip:</label>
                    <input type="text" id="chip" name="chip">
                </div>

                <div class="form-group">
                    <label for="ram">RAM (GB):</label>
                    <input type="number" id="ram" name="ram">
                </div>

                <div class="form-group">
                    <label for="rom">ROM (GB):</label>
                    <input type="number" id="rom" name="rom">
                </div>

                <div class="form-group">
                    <label for="describe">Description:</label>
                    <textarea id="describe" name="describe"></textarea>
                </div>

                <div class="form-group">
                    <label for="pcid">Brand:</label>
                    <select id="pcid" name="pcid" required>
                        <option value="1">Iphone</option>
                        <option value="2">Samsung</option>
                        <option value="3">Oppo</option>
                        <option value="4">Xiaomi</option>
                        <option value="5">Vivo</option>
                        <option value="6">Realme</option>
                        <option value="7">Nokia</option>
                        <option value="8">Asus</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="stock">Stock:</label>
                    <input type="number" id="stock" name="stock">
                </div>
                <input type="hidden" name="action" value="Addproduct">
                <input type="submit" value="Add Product">
            </form>
        </div>

        <script>
            document.querySelector('input[type="file"]').addEventListener('change', function (e) {
                var fileName = e.target.files[0].name;
                document.querySelector('.btn-file-input').textContent = fileName;
            });
        </script>
    </body>
</html>