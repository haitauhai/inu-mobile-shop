/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderView;
import model.ProductSale;
import model.Revenue;
import model.UserPurchase;

/**
 *
 * @author nguye
 */
public class OrderDAO extends DBContext {

    public void saveOrder(String username, String idProduct, String quantity, String idCategories, String name, String address, String phoneNumber, String note, long amount, String status, java.sql.Timestamp date) {
        String sql = "INSERT INTO orders (username, idproduct, quantity, idcategories, name, address, phonenumber, note, amount, status, date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
        PreparedStatement ps;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, Integer.parseInt(idProduct));
            ps.setInt(3, Integer.parseInt(quantity));
            ps.setInt(4, Integer.parseInt(idCategories));
            ps.setNString(5, name);
            ps.setNString(6, address);
            ps.setString(7, phoneNumber);
            ps.setNString(8, note);
            ps.setLong(9, amount);
            ps.setNString(10, status);
            ps.setTimestamp(11, date);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Order> getAllOrderByUsername(String username) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE username = ? ORDER BY date DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUsername(rs.getString("username"));
                    order.setIdProduct(rs.getInt("idproduct"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setIdCategories(rs.getInt("idcategories"));
                    order.setName(rs.getString("name"));
                    order.setAddress(rs.getString("address"));
                    order.setPhoneNumber(rs.getString("phonenumber"));
                    order.setNote(rs.getString("note"));
                    order.setAmount(rs.getLong("amount"));
                    order.setStatus(rs.getString("status"));
                    order.setDate(rs.getTimestamp("date"));
                    orders.add(order);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public List<OrderView> getAllOrderViewByUserName(String username) {
        List<OrderView> orders = new ArrayList<>();
        String sql = "SELECT o.*, p.image "
                + "FROM orders o "
                + "JOIN PhoneProduct p ON o.idproduct = p.id "
                + "WHERE o.username = ? "
                + "ORDER BY o.date DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderView order = new OrderView();
                    order.setId(rs.getInt("id"));
                    order.setUsername(rs.getString("username"));
                    order.setIdProduct(rs.getInt("idproduct"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setIdCategories(rs.getInt("idcategories"));
                    order.setName(rs.getString("name"));
                    order.setAddress(rs.getString("address"));
                    order.setPhoneNumber(rs.getString("phonenumber"));
                    order.setNote(rs.getString("note"));
                    order.setAmount(rs.getLong("amount"));
                    order.setStatus(rs.getString("status"));
                    order.setDate(rs.getTimestamp("date"));
                    order.setImage(rs.getString("image"));
                    orders.add(order);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public List<OrderView> getAllOrderView() {
        List<OrderView> orders = new ArrayList<>();
        String sql = "SELECT o.*, p.image "
                + "FROM orders o "
                + "JOIN PhoneProduct p ON o.idproduct = p.id "
                + "ORDER BY o.date DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderView order = new OrderView();
                    order.setId(rs.getInt("id"));
                    order.setUsername(rs.getString("username"));
                    order.setIdProduct(rs.getInt("idproduct"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setIdCategories(rs.getInt("idcategories"));
                    order.setName(rs.getString("name"));
                    order.setAddress(rs.getString("address"));
                    order.setPhoneNumber(rs.getString("phonenumber"));
                    order.setNote(rs.getString("note"));
                    order.setAmount(rs.getLong("amount"));
                    order.setStatus(rs.getString("status"));
                    order.setDate(rs.getTimestamp("date"));
                    order.setImage(rs.getString("image"));
                    orders.add(order);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public OrderView getOrderViewByID(int orderId) {
        OrderView order = null;
        String sql = "SELECT o.*, p.image "
                + "FROM orders o "
                + "JOIN PhoneProduct p ON o.idproduct = p.id "
                + "WHERE o.id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    order = new OrderView();
                    order.setId(rs.getInt("id"));
                    order.setUsername(rs.getString("username"));
                    order.setIdProduct(rs.getInt("idproduct"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setIdCategories(rs.getInt("idcategories"));
                    order.setName(rs.getString("name"));
                    order.setAddress(rs.getString("address"));
                    order.setPhoneNumber(rs.getString("phonenumber"));
                    order.setNote(rs.getString("note"));
                    order.setAmount(rs.getLong("amount"));
                    order.setStatus(rs.getString("status"));
                    order.setDate(rs.getTimestamp("date"));
                    order.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    public int getTodayOrderCount() {
        int orderCount = 0;

        String sql = "SELECT COUNT(*) FROM orders WHERE CONVERT(date, date) = ?";
        LocalDate today = LocalDate.now();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1, Date.valueOf(today));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                orderCount = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderCount;
    }

    public List<UserPurchase> getUserPurchases() {
        List<UserPurchase> userPurchases = new ArrayList<>();
        String query = "SELECT username, COUNT(*) as purchaseCount FROM Orders GROUP BY username";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                UserPurchase userPurchase = new UserPurchase();
                userPurchase.setUsername(resultSet.getString("username"));
                userPurchase.setPurchaseCount(resultSet.getInt("purchaseCount"));
                userPurchases.add(userPurchase);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return userPurchases;
    }

    public List<ProductSale> getTopProductsInCurrentMonth() {
        List<ProductSale> products = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT TOP 7 name AS TenSanPham, SUM(quantity) AS SoLuongBan "
                    + "FROM Orders "
                    + "WHERE MONTH(date) = MONTH(GETDATE()) AND YEAR(date) = YEAR(GETDATE()) "
                    + "GROUP BY name "
                    + "ORDER BY SoLuongBan DESC";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("TenSanPham");
                int amount = rs.getInt("SoLuongBan");
                ProductSale productSale = new ProductSale(name, amount);
                products.add(productSale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }

        return products;
    }

    public List<Revenue> getTotalRevenueLast7Days() {
        List<Revenue> revenues = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT CONVERT(date, date) AS Ngay, SUM(amount) AS TongDoanhThu "
                    + "FROM Orders "
                    + "WHERE DATEDIFF(DAY, date, GETDATE()) <= 7 "
                    + "GROUP BY CONVERT(date, date) "
                    + "ORDER BY Ngay DESC";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                java.sql.Date date = rs.getDate("Ngay");
                long revenue = rs.getLong("TongDoanhThu");
                Revenue rev = new Revenue(date, revenue);
                revenues.add(rev);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close your resources here (ResultSet, PreparedStatement, Connection)
        }

        return revenues;
    }

    public long getRevenueToday() {
        long revenue = 0;
        LocalDate today = LocalDate.now();
        String sql = "SELECT SUM(amount) AS totalRevenue "
                + "FROM orders "
                + "WHERE CONVERT(date, date) = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDate(1, Date.valueOf(today));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    revenue = rs.getLong("totalRevenue");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return revenue;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        List<ProductSale> productsale = o.getTopProductsInCurrentMonth();
        System.out.println(o.getTodayOrderCount());
//        Date d = new Date(1/1/2022);
//        o.saveOrder("sa1", "1", "1", "1", "1", "1", "1", "1", 0, "1",d);
    }
}
