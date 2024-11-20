<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
                max-width: 1200px;
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
                color: #2c3e50;
                margin-bottom: 30px;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background-color: #fff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                margin-bottom: 20px;
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #e0e0e0;
            }

            th {
                background-color: #3498db;
                color: #fff;
                font-weight: bold;
                text-transform: uppercase;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            img {
                width: 80px;
                height: auto;
                border-radius: 4px;
            }

            .quantity-input {
                width: 60px;
                padding: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            button {
                padding: 8px 12px;
                margin: 2px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button:hover {
                opacity: 0.8;
            }

            .buy-btn {
                background-color: #2ecc71;
                color: #fff;
            }

            .remove-btn {
                background-color: #e74c3c;
                color: #fff;
            }

            .total-row {
                font-weight: bold;
                background-color: #ecf0f1;
            }

            .total-price {
                font-size: 1.2em;
                color: #e74c3c;
            }

            .checkbox-cell {
                text-align: center;
            }

            .purchase-container {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                margin-top: 20px;
            }

            .purchase-btn {
                background-color: #3498db;
                color: #fff;
                font-size: 1.1em;
                padding: 10px 20px;
            }

            .purchase-btn:disabled {
                background-color: #bdc3c7;
                cursor: not-allowed;
            }
            .popup-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1000;
                overflow: hidden;
            }

            .popup-content {
                position: absolute;
                top: -150px; /* Start off-screen */
                left: 50%;
                transform: translateX(-50%);
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
                text-align: center;
                transition: top 0.2s ease-out;
            }

            .popup-overlay.show .popup-content {
                top: 50%;
                transform: translate(-50%, -50%);
            }

            .popup-message {
                margin-bottom: 20px;
                font-size: 18px;
            }

            .popup-buttons {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .popup-btn {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .popup-btn-confirm {
                background-color: #2ecc71;
                color: #fff;
            }

            .popup-btn-cancel {
                background-color: #e74c3c;
                color: #fff;
            }

            .popup-btn:hover {
                opacity: 0.8;
            }
        </style>
    </head>
    <body>
        <div class="breadcrumb">
            <a href="home">Home</a> &gt; Cart
        </div>

        <h2>Your Shopping Cart</h2>
        <form id="cartForm" action="checkout" method="post">
            <table id="cartTable">
                <thead>
                    <tr>
                        <th class="checkbox-cell"><input type="checkbox" id="selectAll" onclick="toggleAll(this)"></th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty listcartview}">
                            <tr>
                                <td colspan="7" style="text-align: center;">No product</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="item" items="${listcartview}">
                                <tr>
                                    <td class="checkbox-cell"><input type="checkbox" name="selectedItems" value="${item.id}" class="product-checkbox" onchange="updateTotalPrice()"></td>
                                    <td><img src="${item.image}" alt="Product Image"></td>
                                    <td>${item.nameProduct}</td>
                                    <td>đ<fmt:formatNumber value="${item.price}" pattern="#,###" /></td>
                                    <td><input type="number" class="quantity-input" name="quantity_${item.nameProduct}" value="${item.quantity}" min="1" onchange="updateQuantity(this, '${item.nameProduct}', ${item.price},${item.id})"></td>
                                    <td>đ<span class="totalPrice" ><fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###" /></span></td>
                                    <td>
                                        <button type="button" class="remove-btn" onclick="remove(${item.id}, '${item.nameProduct}')">Remove</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
                <tfoot>
                    <tr class="total-row">
                        <td colspan="5" style="text-align: right;">Total:</td>
                        <td colspan="2">đ<span id="totalPrice" class="total-price">0.00</span></td>
                    </tr>
                </tfoot>
            </table>

            <div class="purchase-container">
                <button type="submit" id="purchaseBtn" class="purchase-btn" disabled>Purchase Selected Items</button>
            </div>
        </form>
        <div id="popupOverlay" class="popup-overlay">
            <div class="popup-content">
                <p id="popupMessage" class="popup-message"></p>
                <div class="popup-buttons">
                    <button id="popupConfirm" class="popup-btn popup-btn-confirm">Confirm</button>
                    <button id="popupCancel" class="popup-btn popup-btn-cancel">Cancel</button>
                </div>
            </div>
        </div>

        <script>
            function calculateTotalPrice() {
                let total = 0;
                const rows = document.querySelectorAll("#cartTable tbody tr");
                rows.forEach(row => {
                    if (row.querySelector(".product-checkbox").checked) {
                        const priceText = row.querySelector(".totalPrice").innerText.replace(/[^\d]/g, '');
                        const price = parseFloat(priceText);
                        total += price;
                    }
                });
                document.getElementById("totalPrice").value = total;
                document.getElementById("totalPrice").innerText = new Intl.NumberFormat('vi-VN').format(total);
                document.getElementById("purchaseBtn").disabled = total === 0;
            }

            function updateQuantity(input, productName, price, id) {
                const quantity = parseInt(input.value);
                const totalPrice = price * quantity;
                const row = input.closest('tr');
                row.querySelector(".totalPrice").innerText = new Intl.NumberFormat('vi-VN').format(totalPrice);
                calculateTotalPrice();
                window.location.href = "updatequantitycart?id=" + id + "&&quantity=" + quantity;
            }

            function toggleAll(checkbox) {
                const checkboxes = document.querySelectorAll(".product-checkbox");
                checkboxes.forEach(cb => {
                    cb.checked = checkbox.checked;
                });
                calculateTotalPrice();
            }

            function updateTotalPrice() {
                calculateTotalPrice();
            }

            function showPopup(message, onConfirm) {
                const popup = document.getElementById('popupOverlay');
                const popupMessage = document.getElementById('popupMessage');
                const confirmBtn = document.getElementById('popupConfirm');
                const cancelBtn = document.getElementById('popupCancel');

                popupMessage.textContent = message;
                popup.style.display = 'block';

                // Trigger reflow to ensure the transition works
                popup.offsetHeight;

                popup.classList.add('show');

                confirmBtn.onclick = () => {
                    onConfirm();
                    hidePopup();
                };

                cancelBtn.onclick = hidePopup;
            }

            function hidePopup() {
                const popup = document.getElementById('popupOverlay');
                popup.classList.remove('show');
                setTimeout(() => {
                    popup.style.display = 'none';
                }, 500); // Match this delay with the CSS transition time
            }

            function remove(id, name) {
                showPopup('Do you want to delete ' + name + ' ?', () => {
                    window.location.href = 'removecart?id=' + id;
                });
            }

            function purchaseSelectedItems() {
                const selectedItems = Array.from(document.querySelectorAll('.product-checkbox:checked'))
                        .map(checkbox => checkbox.value);

                if (selectedItems.length === 0) {
                    alert('Please select at least one item to purchase.');
                    return;
                }

                const totalPrice = document.getElementById('totalPrice').value;

                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'checkout';

                selectedItems.forEach(itemId => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'selectedItems';
                    input.value = itemId;
                    form.appendChild(input);
                });

                const priceInput = document.createElement('input');
                priceInput.type = 'hidden';
                priceInput.name = 'totalPrice';
                priceInput.value = totalPrice;
                form.appendChild(priceInput);

                document.body.appendChild(form);
                form.submit();
            }

            // Update the purchase button event listener
            document.getElementById('purchaseBtn').addEventListener('click', function (event) {
                event.preventDefault();
                showPopup('Are you sure you want to purchase the selected items?', purchaseSelectedItems);
            });

            // Initialize total price on page load
            document.addEventListener('DOMContentLoaded', calculateTotalPrice);
        </script>
    </body>
</html>