
package dal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.User;

public class UserDAO extends DBContext{
    private List<Account> list = new ArrayList();
    private void getAllAccount(){
        String sql="select * from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Account a = new Account(rs.getString("username"), rs.getString("password"), rs.getInt("role"));
                list.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }    
    }
    public Boolean checkAccount(String username, String password){
        getAllAccount();
        for(Account a : list){
            if(a.getUsername().equals(username)&&a.getPassword().equals(SHA256(password))) return true;
        }
            return false;
    }
    public String SHA256(String password){
        String encode=null;
     try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update(password.getBytes());
            byte[] hashedBytes = digest.digest();
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashedBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            encode=hexString.toString();
         
            
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
     return encode;
}
    public boolean checkDuplicate(String userID) {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                ptm = connection.prepareStatement("Select * from Account where username=?");
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean registerUser(String username, String password, String name, String phoneNumber, String fullAddress) {
    boolean success = false;
    try {
        // Insert into Account table
        String sql1 = "INSERT INTO Account (username, password, role) VALUES (?, ?, 3)";
        PreparedStatement ps = connection.prepareStatement(sql1);
        ps.setString(1, username);
        ps.setString(2, SHA256(password));
        int affectedRows1 = ps.executeUpdate();

        // Insert into UserInfo table
        String sql2 = "INSERT INTO UserInformation (username, name, phonenumber, address) VALUES (?, ?, ?, ?)";
        ps = connection.prepareStatement(sql2);
        ps.setString(1, username);
        ps.setNString(2, name);
        ps.setString(3, phoneNumber);
        ps.setNString(4, fullAddress);
        int affectedRows2 = ps.executeUpdate();
        success = (affectedRows1 > 0 && affectedRows2 > 0);
    } catch (Exception e) {
        e.printStackTrace();
    }
    return success;
}
    public boolean updateUser(String username, String password, String name, String phoneNumber, String fullAddress, int role) {
    boolean success = false;
    PreparedStatement ps = null;
    try {
        String sql1 = "UPDATE Account SET password = ?, role = ? WHERE username = ?";
        ps = connection.prepareStatement(sql1);
        ps.setString(1, password); // Giả sử bạn muốn mã hóa mật khẩu
        ps.setInt(2, role);
        ps.setString(3, username);
        int affectedRows1 = ps.executeUpdate();

        // Update UserInformation table
        String sql2 = "UPDATE UserInformation SET name = ?, phonenumber = ?, address = ? WHERE username = ?";
        ps = connection.prepareStatement(sql2);
        ps.setNString(1, name);
        ps.setString(2, phoneNumber);
        ps.setNString(3, fullAddress);
        ps.setString(4, username);
        int affectedRows2 = ps.executeUpdate();

        // Nếu cả hai câu lệnh đều thành công, commit transaction
        if (affectedRows1 > 0 && affectedRows2 > 0) {
            connection.commit();
            success = true;
        } else {
            connection.rollback();
        }
    } catch (SQLException e) {
        try {
            if (connection != null) connection.rollback();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (connection != null) {
                connection.setAutoCommit(true);
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return success;
}
    public User getUserByUsername(String username) {
        User user = null;
        String sql = "SELECT a.username, a.password, a.role, u.name, u.phonenumber, u.address " +
                     "FROM Account a " +
                     "JOIN UserInformation u ON a.username = u.username " +
                     "WHERE a.username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                int role = rs.getInt("role");
                String name = rs.getNString("name"); // Use getNString for nvarchar columns
                String phoneNumber = rs.getString("phonenumber");
                String address = rs.getNString("address"); // Use getNString for nvarchar columns
                user = new User(username, password, name, phoneNumber, address, role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    public List<User> getAllUser(){
        List<User> list = new ArrayList<>();
        User user = null;
        String sql = "SELECT a.username, a.password, a.role, u.name, u.phonenumber, u.address " +
                     "FROM Account a " +
                     "JOIN UserInformation u ON a.username = u.username ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                int role = rs.getInt("role");
                String name = rs.getNString("name"); // Use getNString for nvarchar columns
                String phoneNumber = rs.getString("phonenumber");
                String address = rs.getNString("address"); // Use getNString for nvarchar columns
                user = new User(username, password, name, phoneNumber, address, role);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public boolean deleteUserByUsername(String username) {
        boolean success = false;
        PreparedStatement psAccount = null;
        PreparedStatement psUserInfo = null;

        try {
            connection.setAutoCommit(false);
            String sqlUserInfo = "DELETE FROM UserInformation WHERE username = ?";
            psUserInfo = connection.prepareStatement(sqlUserInfo);
            psUserInfo.setString(1, username);
            int affectedRowsUserInfo = psUserInfo.executeUpdate();
            String sqlAccount = "DELETE FROM Account WHERE username = ?";
            psAccount = connection.prepareStatement(sqlAccount);
            psAccount.setString(1, username);
            int affectedRowsAccount = psAccount.executeUpdate();
            if (affectedRowsUserInfo > 0 && affectedRowsAccount > 0) {
                connection.commit();
                success = true;
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            try {
                if (connection != null) connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                if (psUserInfo != null) psUserInfo.close();
                if (psAccount != null) psAccount.close();
                if (connection != null) connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }

   
    public static void main(String[] args) {
        UserDAO l = new UserDAO();
        System.out.println(l.getUserByUsername("admin"));
    }
}
