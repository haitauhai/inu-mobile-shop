<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order</title>
        <link rel="stylesheet" href="./css/checkout.css">
    </head>
    <body>
        <div class="breadcrumb">
            <a href="home">Home</a> &gt; <a href="cart">Cart</a> &gt; Order
        </div>

        <h2>Complete Your Order</h2>

        <div class="order-container">
            <div class="product-list">
                <h3>Selected Products</h3>
                <c:forEach var="item" items="${purchase}">
                    <div class="product-item">
                        <img src="${item.image}" alt="${item.nameProduct}" class="product-image">
                        <div class="product-details">
                            <div class="product-name">${item.nameProduct}</div>
                            <div>Quantity: ${item.quantity}</div>
                        </div>
                        <div class="product-price">đ<fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###" /></div>
                    </div>
                </c:forEach>
            </div>
            <div class="total-price">
                Total: đ${totalPrice}
            </div>
        </div>

        <div class="order-container">
            <h3>Customer Information</h3>
            <form id="orderForm" action="processOrder" method="post">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" value="${sessionScope.user.name}" required>

                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" value="${sessionScope.user.phoneNumber}" required>

                <div class="select-container">
                    <select class="css_select" id="province" name="province" required>
                        <option value="">Select Province</option>
                    </select> 
                    <select class="css_select" id="district" name="district" required>
                        <option value="">Select District</option>
                    </select> 
                    <select class="css_select" id="ward" name="ward" required>
                        <option value="">Select Ward</option>
                    </select>
                </div>

                <label for="address">Specific Address:</label>
                <input type="text" id="address" name="address" placeholder="House Number, Street Name" value="${sessionScope.user.getSpecific(sessionScope.user.fullAddress,0)}" required>

                <label for="note">Note:</label>
                <textarea id="note" name="note" rows="4"></textarea>

                <label for="payment-method">Payment Method:</label>
                <div class="payment-options">
                    <label>
                        <input type="radio" name="payment-method" value="cod" checked> Cash on Delivery
                    </label>
                    <label>
                        <input type="radio" name="payment-method" value="vnpay"> VNPAY
                    </label>
                </div>
                <c:forEach var="item" items="${purchase}" varStatus="status">
                    <input type="hidden" name="idproduct${status.index}" value="${item.id}">
                    <input type="hidden" name="quantity${status.index}" value="${item.quantity}">
                    <input type="hidden" name="nameProduct${status.index}" value="${item.nameProduct}">
                    <input type="hidden" name="price${status.index}" value="${item.price}">
                </c:forEach>
                <input type="hidden" name="amount" value="${totalPrice}">
                <input type="submit" value="Place Order" onclick="processPayment(event)">
            </form>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var citis = document.getElementById("province");
                        var districts = document.getElementById("district");
                        var wards = document.getElementById("ward");

                        var Parameter = {
                            url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                            method: "GET",
                            responseType: "application/json",
                        };

                        axios(Parameter)
                                .then(function (response) {
                                    renderCity(response.data);
                                })
                                .catch(function (error) {
                                    console.error("Error fetching data:", error);
                                });

                        function renderCity(data) {
                            for (const x of data) {
                                citis.options[citis.options.length] = new Option(x.Name, x.Id);
                            }
                            citis.onchange = function () {
                                districts.length = 1;
                                wards.length = 1;
                                if (this.value != "") {
                                    const result = data.filter(n => n.Id === this.value);
                                    for (const k of result[0].Districts) {
                                        districts.options[districts.options.length] = new Option(k.Name, k.Id);
                                    }
                                }
                            };
                            districts.onchange = function () {
                                wards.length = 1;
                                const dataCity = data.filter((n) => n.Id === citis.value);
                                if (this.value != "") {
                                    const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
                                    for (const w of dataWards) {
                                        wards.options[wards.options.length] = new Option(w.Name, w.Id);
                                    }
                                }
                            };
                        }

                        document.getElementById('orderForm').addEventListener('submit', function (e) {
                            e.preventDefault();
                            var detailedAddress = document.querySelector('input[name="address"]').value;
                            var ward = wards.options[wards.selectedIndex].text;
                            var district = districts.options[districts.selectedIndex].text;
                            var province = citis.options[citis.selectedIndex].text;
                            var fullAddress = detailedAddress + ", " + ward + ", " + district + ", " + province;

                            // Thêm input hidden cho địa chỉ đầy đủ
                            var inputFullAddress = document.createElement('input');
                            inputFullAddress.type = 'hidden';
                            inputFullAddress.name = 'fullAddress';
                            inputFullAddress.value = fullAddress;
                            document.getElementById('orderForm').appendChild(inputFullAddress);

                            processPayment(e);
                        });

                        function processPayment(event) {
                            event.preventDefault();
                            var paymentMethod = document.querySelector('input[name="payment-method"]:checked').value;
                            var form = document.getElementById('orderForm');

                            if (paymentMethod === 'vnpay') {
                                form.action = 'processVNPAYPayment'; // Điều hướng sang thanh toán VNPAY
                            } else {
                                form.action = 'processOrder'; // Điều hướng sang thanh toán khi nhận hàng
                            }

                            form.submit(); // Gửi form đi để xử lý thanh toán
                        }
                    });
        </script>

    </body>
</html> 