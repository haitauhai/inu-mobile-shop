<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
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
            max-width: 500px;
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
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E');
            background-repeat: no-repeat;
            background-position: right 10px top 50%;
            background-size: 12px auto;
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
            width: 100%;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update User</h2>
        <form action="updateuser" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${user.username}" readonly>
            </div>  
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${user.name}" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required>
            </div>
            <div class="form-group">
                <label for="fullAddress">Full Address:</label>
                <input type="text" id="fullAddress" name="fullAddress" value="${user.fullAddress}" required>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" required>
                    <option value="1" ${user.role == 1 ? 'selected' : ''}>Admin</option>
                    <option value="3" ${user.role == 3 ? 'selected' : ''}>Customer</option>
                </select>
            </div>
                <input type="hidden" value="${user.password}" name="password"/>
                <input type="hidden" name="action" value="Updateuser">
            <button type="submit" class="button">Update User</button>
        </form>
    </div>
</body>
</html>