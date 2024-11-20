<%-- 
    Document   : login
    Created on : Feb 26, 2024, 4:04:52 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form</title>
        <link rel="stylesheet" href="./css/login.css"/>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <center><h5 style="color:green;">${requestScope.success}</h5></center>
            <form action="Maincontroller" method="post">
                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${cookie.cuser.value}" >
                </div>
                <div class="form-group">
                    <label for="password">Password</label> 
                    <input type="password" id="password" name="password" value="${cookie.cenpass.value}" >
                </div>
                <div class="form-group">
                    <label for="remember">Remember me<input type="checkbox" ${(cookie.crem!=null?'checked':'')} id="remember" name="remember" value="on"> </label>
                </div>
                <div class="form-group">
                    <h5 style="color:red;">${requestScope.error}</h5>
                </div>
                <input type="hidden" name="action" value="Login">
                <button type="submit" class="btn">Login</button>
            </form>
            <p>Don't have an account? <a href="register">Register</a></p>
        </div>
    </body>
</html>


