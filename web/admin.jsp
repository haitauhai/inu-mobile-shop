<%@page import="model.Revenue"%>
<%@page import="model.ProductSale"%>
<%@page import="model.UserPurchase"%>
<%@page import="model.OrderView"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
        <link rel="stylesheet" href="css/admin.css"
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <div class="container">
            <aside class="sidebar">
                <div class="user-info">
                    <i class="fas fa-user-circle"></i>
                    <p>Welcome, Admin</p>
                    <button class="logout-btn" onclick="logout()">Logout</button>
                </div>
                <nav>
                    <ul>
                        <li><a href="#dashboard" onclick="showSection('dashboard')"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                        <li><a href="#products" onclick="showSection('products')"><i class="fas fa-box"></i> Products</a></li>
                        <li><a href="#users" onclick="showSection('users')"><i class="fas fa-users"></i> Users</a></li>
                        <li><a href="#orders" onclick="showSection('orders')"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                        <li><a href="#charts" onclick="showSection('charts')"><i class="fas fa-chart-bar"></i> Charts</a></li>
                    </ul>
                </nav>
            </aside>

            <main class="content">
                <section id="dashboard" class="section active">
                    <h1>Dashboard</h1>
                    <div class="dashboard-stats">
                        <div class="stat-box">
                            <h3>Total Products</h3>
                            <p>${totalProducts}</p>
                        </div>
                        <div class="stat-box">
                            <h3>Total Users</h3>
                            <p>${totalUsers}</p>
                        </div>
                        <div class="stat-box">
                            <h3>Total Orders</h3>
                            <p>${totalOrders}</p>
                        </div>
                        <div class="stat-box">
                            <h3>Total Revenue</h3>
                            <p>đ${totalRevenue}</p>
                        </div>
                    </div>
                </section>

                <section id="products" class="section">
                    <h2>Products</h2>
                    <div class="search-bar">
                        <input type="text" id="productSearch" placeholder="Search products">
                        <button onclick="searchProducts()">Search</button>
                    </div>
                    <c:choose>
                        <c:when test="${not empty productList}">
                            <table id="productTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Stock</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <a href="addproduct" class="button">Add product</a>
                                <tbody>
                                    <c:forEach items="${productList}" var="product">
                                        <tr>
                                            <td>${product.id}</td>
                                            <td><img class="product-image" src="${product.image}"></td>
                                            <td>${product.name}</td>
                                            <td>${product.price}</td>
                                            <td>${product.stock}</td>
                                            <td>
                                                <button class="edit-btn" onclick="editProduct(${product.id})">Edit</button>
                                                <button class="delete-btn" onclick="deleteProduct(${product.id})">Delete</button>
                                                <button class="view-btn" onclick="viewProduct(${product.id})">View</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>No products found.</p>
                        </c:otherwise>
                    </c:choose>
                </section>

                <section id="users" class="section">
                    <h2>Users</h2>
                    <div class="search-bar">
                        <input type="text" id="userSearch" placeholder="Search users">
                        <button onclick="searchUsers()">Search</button>
                    </div>
                    <c:choose>
                        <c:when test="${not empty userList}">
                            <table id="userTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Phone Number</th>
                                        <th>Address</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userList}" var="user">
                                        <tr>
                                            <td>${user.username}</td>
                                            <td>${user.name}</td>
                                            <td>${user.phoneNumber}</td>
                                            <td>${user.fullAddress}</td>
                                            <td>${user.role}</td>
                                            <td>
                                                <button class="edit-btn" onclick="editUser('${user.username}')">Edit</button>
                                                <button class="delete-btn" onclick="deleteUser('${user.username}')">Delete</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>No users found.</p>
                        </c:otherwise>
                    </c:choose>
                </section>

                <section id="orders" class="section">
                    <h2>Orders</h2>
                    <div class="search-bar">
                        <input type="text" id="orderSearch" placeholder="Search orders">
                        <button onclick="searchOrders()">Search</button>
                    </div>
                    <c:choose>
                        <c:when test="${not empty orderList}">
                            <table id="orderTable">
                                <thead>
                                    <tr>
                                        <th>Customer</th>
                                        <th>Image</th>
                                        <th>Product</th>
                                        <th>Quantity</th>
                                        <th>Total Price</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${orderList}" var="order">
                                        <tr>
                                            <td>${order.username}</td>
                                            <td><img class="product-image" src="${order.image}"></td>
                                            <td>${order.name}</td>
                                            <td>${order.quantity}</td>
                                            <td>${order.amount}</td>
                                            <td>${order.status}</td>
                                            <td>
                                                <button class="view-btn" onclick="viewOrder(${order.id})">View</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>No orders found.</p>
                        </c:otherwise>
                    </c:choose>
                </section>

                <section id="charts" class="section">
                    <h2>Charts</h2>
                    <div class="chart-container">
                        <div class="chart-box">
                            <h3>Sales Chart</h3>
                            <canvas id="salesChart"></canvas>
                        </div>
                        <div class="chart-box">
                            <h3>Revenue Chart</h3>
                            <canvas id="revenueChart"></canvas>
                        </div>
                        <div class="chart-box">
                            <h3>Users Chart</h3>
                            <canvas id="usersChart"></canvas>
                        </div>
                    </div></section>

            </main>
        </div>
        <div id="confirmModal" class="modal">
            <div class="modal-content">
                <h3>Confirm Deletion</h3>
                <p>Are you sure you want to delete this product?</p>
                <div class="button-group">
                    <button onclick="confirmDelete()" class="btn-confirm">Yes, Delete</button>
                    <button onclick="closeModal()" class="btn-cancel">Cancel</button>
                </div>
            </div>
        </div>
        <div id="confirmUserModal" class="modal">
            <div class="modal-content">
                <h3>Confirm User Deletion</h3>
                <p>Are you sure you want to delete this user?</p>
                <div class="button-group">
                    <button onclick="confirmDeleteUser()" class="btn-confirm">Yes, Delete</button>
                    <button onclick="closeUserModal()" class="btn-cancel">Cancel</button>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                        function showSection(sectionId) {
                            const sections = document.querySelectorAll('.section');
                            sections.forEach(section => {
                                section.classList.remove('active');
                            });
                            document.getElementById(sectionId).classList.add('active');

                            const links = document.querySelectorAll('nav ul li a');
                            links.forEach(link => {
                                link.classList.remove('active');
                            });
                            document.querySelector(`nav ul li a[href="#${sectionId}"]`).classList.add('active');
                        }

                        function searchProducts() {
                            const searchValue = document.getElementById('productSearch').value.toLowerCase();
                            const table = document.getElementById('productTable');
                            const rows = table.getElementsByTagName('tr');

                            for (let i = 1; i < rows.length; i++) {
                                const cells = rows[i].getElementsByTagName('td');
                                let found = false;

                                for (let j = 0; j < cells.length; j++) {
                                    if (cells[j].innerText.toLowerCase().includes(searchValue)) {
                                        found = true;
                                        break;
                                    }
                                }

                                if (found) {
                                    rows[i].style.display = '';
                                } else {
                                    rows[i].style.display = 'none';
                                }
                            }
                        }

                        function searchUsers() {
                            const searchValue = document.getElementById('userSearch').value.toLowerCase();
                            const table = document.getElementById('userTable');
                            const rows = table.getElementsByTagName('tr');

                            for (let i = 1; i < rows.length; i++) {
                                const cells = rows[i].getElementsByTagName('td');
                                let found = false;

                                for (let j = 0; j < cells.length; j++) {
                                    if (cells[j].innerText.toLowerCase().includes(searchValue)) {
                                        found = true;
                                        break;
                                    }
                                }

                                if (found) {
                                    rows[i].style.display = '';
                                } else {
                                    rows[i].style.display = 'none';
                                }
                            }
                        }

                        function searchOrders() {
                            const searchValue = document.getElementById('orderSearch').value.toLowerCase();
                            const table = document.getElementById('orderTable');
                            const rows = table.getElementsByTagName('tr');

                            for (let i = 1; i < rows.length; i++) {
                                const cells = rows[i].getElementsByTagName('td');
                                let found = false;

                                for (let j = 0; j < cells.length; j++) {
                                    if (cells[j].innerText.toLowerCase().includes(searchValue)) {
                                        found = true;
                                        break;
                                    }
                                }

                                if (found) {
                                    rows[i].style.display = '';
                                } else {
                                    rows[i].style.display = 'none';
                                }
                            }
                        }

                        function editProduct(productId) {
                            window.location.href = "editproduct?id=" + productId;
                        }

                        let productIdToDelete;

                        function deleteProduct(productId) {
                            productIdToDelete = productId;
                            document.getElementById('confirmModal').style.display = 'block';
                        }

                        function confirmDelete() {
                            window.location.href = 'deleteproduct?id=' + productIdToDelete;
                        }

                        function closeModal() {
                            document.getElementById('confirmModal').style.display = 'none';
                        }

                        window.onclick = function (event) {
                            let modal = document.getElementById('confirmModal');
                            if (event.target == modal) {
                                closeModal();
                            }
                        }

                        function viewProduct(productId) {
                            window.location.href = "viewproduct?id=" + productId;
                        }

                        function editUser(userId) {
                            window.location.href = "updateuser?username=" + userId;
                        }

                        let userIdToDelete;

                        function deleteUser(userId) {
                            userIdToDelete = userId;
                            document.getElementById('confirmUserModal').style.display = 'block';
                        }
                        function confirmDeleteUser() {
                            window.location.href = "deleteuser?username=" + userIdToDelete;
                        }

                        function closeUserModal() {
                            document.getElementById('confirmUserModal').style.display = 'none';
                        }

                        window.onclick = function (event) {
                            let productModal = document.getElementById('confirmModal');
                            let userModal = document.getElementById('confirmUserModal');
                            if (event.target == productModal) {
                                closeModal();
                            }
                            if (event.target == userModal) {
                                closeUserModal();
                            }
                        }
                        function viewOrder(orderId) {
                            window.location.href = "orderview?id=" + orderId;
                        }

            <%
                List<UserPurchase> userPurchases = (List<UserPurchase>) request.getAttribute("userPurchases");
                StringBuilder salesData = new StringBuilder();
                StringBuilder revenueData = new StringBuilder();
                StringBuilder userLabels = new StringBuilder();
                StringBuilder userData = new StringBuilder();
                for (UserPurchase userPurchase : userPurchases) {
                    userLabels.append("'").append(userPurchase.getUsername()).append("',");
                    userData.append(userPurchase.getPurchaseCount()).append(",");
                }
                List<ProductSale> productsale = (List<ProductSale>) request.getAttribute("productsale");
                StringBuilder labels = new StringBuilder();
                for (ProductSale product : productsale) {
                    labels.append("'").append(product.getName()).append("',");
                    salesData.append(product.getAmount()).append(",");
                }
                List<Revenue> revenue = (List<Revenue>) request.getAttribute("revenue");
                StringBuilder dateLabels = new StringBuilder();
                for (Revenue rev : revenue) {
                    revenueData.append(rev.getRevenue()).append(",");
                    dateLabels.append("'").append(rev.getDate()).append("',");
                }
            %>

                        const salesData = [<%= salesData.substring(0, salesData.length() - 1)%>];
                        const labels = [<%= labels.substring(0, labels.length() - 1)%>];

                        const salesChart = new Chart(document.getElementById('salesChart'), {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [{
                                        label: 'Sales',
                                        data: salesData,
                                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                        const revenueData = [<%= revenueData.substring(0, revenueData.length() - 1)%>];
                        const dateLabels = [<%= dateLabels.substring(0, dateLabels.length() - 1)%>];

                        const revenueChart = new Chart(document.getElementById('revenueChart'), {
                            type: 'line',
                            data: {
                                labels: dateLabels,
                                datasets: [{
                                        label: 'Revenue',
                                        data: revenueData,
                                        backgroundColor: 'rgba(153, 102, 255, 0.2)',
                                        borderColor: 'rgba(153, 102, 255, 1)',
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });

                        const usersChart = new Chart(document.getElementById('usersChart'), {
                            type: 'pie',
                            data: {
                                labels: [<%= userLabels.substring(0, userLabels.length() - 1)%>],
                                datasets: [{
                                        label: 'Users',
                                        data: [<%= userData.substring(0, userData.length() - 1)%>],
                                        backgroundColor: [
                                            'rgba(255, 99, 132, 0.2)',
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(255, 206, 86, 0.2)',
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(153, 102, 255, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(255, 99, 132, 1)',
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 206, 86, 1)',
                                            'rgba(75, 192, 192, 1)',
                                            'rgba(153, 102, 255, 1)'
                                        ],
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                responsive: true,
                                plugins: {
                                    legend: {
                                        position: 'top',
                                    },
                                    tooltip: {
                                        callbacks: {
                                            label: function (context) {
                                                let label = context.label || '';
                                                if (label) {
                                                    label += ': ';
                                                }
                                                if (context.parsed !== null) {
                                                    label += context.parsed + ' purchases';
                                                }
                                                return label;
                                            }
                                        }
                                    }
                                }
                            }
                        });
                        function logout() {
                            window.location.href = "logout";
                        }
                        function backtohome() {
                            window.location.href = "logout";
                        }
        </script>
    </body>
</html>
