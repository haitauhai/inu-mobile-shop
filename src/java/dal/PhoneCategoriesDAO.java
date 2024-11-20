/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.PhoneCategories;

/**
 *
 * @author nguye
 */
public class PhoneCategoriesDAO extends DBContext {

    public List<PhoneCategories> getAll() {
        List<PhoneCategories> list = new ArrayList<>();
        String sql = "select * from PhoneCategories;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PhoneCategories c = new PhoneCategories(rs.getInt("id"), rs.getString("name"), rs.getInt("cid"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public PhoneCategories getPhoneCategoryById(int id) {
        String sql = "select * from PhoneCategories where id=?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                PhoneCategories c = new PhoneCategories(rs.getInt("id"), rs.getString("name"), rs.getInt("cid"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insert(PhoneCategories c) {
        String sql = "INSERT INTO [dbo].[PhoneCategories]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[cid])\n"
                + "     VALUES(?,?,?)";
        try {
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, c.getId());
            pt.setString(2, c.getName());
            pt.setInt(3, c.getCid());
            pt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
