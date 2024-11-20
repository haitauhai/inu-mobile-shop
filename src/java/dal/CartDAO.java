/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CartView;
import model.UserCart;

/**
 *
 * @author nguye
 */
public class CartDAO extends DBContext{
    public List<UserCart> getAllCartByID(String username) {
        List<UserCart> list = new ArrayList<>();
        String sql = "SELECT * FROM UserCart WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UserCart cartItem = new UserCart();
                cartItem.setUsername(rs.getString("username"));
                cartItem.setIdProduct(rs.getInt("idproduct"));
                cartItem.setIdCategories(rs.getInt("idcategories"));
                cartItem.setQuantity(rs.getInt("quantity"));
                list.add(cartItem);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    // Lưu thông tin giỏ hàng vào cơ sở dữ liệu
    public void saveToDatabase(UserCart cartItem) {
        String sql = "INSERT INTO UserCart (username, idproduct, idcategories, quantity) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cartItem.getUsername());
            ps.setInt(2, cartItem.getIdProduct());
            ps.setInt(3, cartItem.getIdCategories());
            ps.setInt(4, cartItem.getQuantity());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean isProductExists(String username, int productId) {
        String sql = "SELECT * FROM UserCart WHERE username = ? AND idproduct = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Trả về true nếu sản phẩm tồn tại, ngược lại trả về false
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    public void updateQuantityBy1(String username, int productId) {
        if (isProductExists(username, productId)) {
            String sql = "UPDATE UserCart SET quantity = quantity + 1 WHERE username = ? AND idproduct = ?";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, username);
                ps.setInt(2, productId);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public void updateQuantityByQuantity(String username, int productId, int quantity) {
        if (isProductExists(username, productId)) {
            String sql = "UPDATE UserCart SET quantity = ? WHERE username = ? AND idproduct = ?";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, quantity);
                ps.setString(2, username);
                ps.setInt(3, productId);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public void removecart(String username, int id){
        String sql = "Delete UserCart Where username = ? AND idproduct = ?";
         try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, username);
                ps.setInt(2, id);
                ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    public List<CartView> getCartViewByUsername(String username) {
        List<CartView> cartItems = new ArrayList<>();
        String sql = "SELECT p.id, p.image, p.name AS nameProduct, p.price, uc.quantity " +
                     "FROM UserCart uc " +
                     "JOIN PhoneProduct p ON uc.idproduct = p.id " +
                     "WHERE uc.username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String image = rs.getString("image");
                String nameProduct = rs.getString("nameProduct");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                CartView cartView = new CartView(id ,image, nameProduct, price, quantity);
                cartItems.add(cartView);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cartItems;
    }
    public CartView addCartView(String username, int productid){
        CartView cartView = null ;
        String sql = "SELECT p.image, p.name AS nameProduct, p.price, uc.quantity " +
                     "FROM UserCart uc " +
                     "JOIN PhoneProduct p ON uc.idproduct = p.id " +
                     "WHERE uc.username = ? and p.id =? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, productid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String image = rs.getString("image");
                String nameProduct = rs.getString("nameProduct");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                cartView = new CartView(productid,image, nameProduct, price, quantity);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cartView;
    }
//    public void removeCartProduct(String username, int id){
//        String sql = "DELETE UserCart WHERE username = ? AND idproduct = ?";
//        try {
//                PreparedStatement ps = connection.prepareStatement(sql);
//                ps.setString(1, username);
//                ps.setInt(2, id);
//                ps.executeUpdate();
//            } catch (SQLException ex) {
//                Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//    }
    public static void main(String[] args) {
        CartDAO c = new CartDAO();
        System.out.println(c.getCartViewByUsername("sa1").toString());
    }
}
