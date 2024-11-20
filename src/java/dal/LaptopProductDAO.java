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
import model.LaptopProduct;

/**
 *
 * @author nguye
 */

public class LaptopProductDAO extends DBContext{
    public List<LaptopProduct> getAll() {
        List<LaptopProduct> list = new ArrayList();
        String sql = "Select * from [dbo].[LaptopProduct]";
        try{
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs =ps.executeQuery();
        LaptopProduct l = new LaptopProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
               rs.getInt("price"), rs.getDouble("display_size"), rs.getString("processor"), rs.getInt("ram"), rs.getInt("storage_capacity"),
                rs.getString("gpu"), rs.getString("operating_system"), rs.getString("describe"), rs.getInt("lcid"));
        list.add(l);
        }catch (SQLException e){
            System.out.println(e);
        }
        return list;
    }
    public List<LaptopProduct> getTop5(){
        List<LaptopProduct> list = new ArrayList();
        String sql="Select top 5 * from LaptopProduct order by price desc";
        try{
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs =ps.executeQuery();
        while(rs.next()){
        LaptopProduct l = new LaptopProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
               rs.getInt("price"), rs.getDouble("display_size"), rs.getString("processor"), rs.getInt("ram"), rs.getInt("storage_capacity"),
                rs.getString("gpu"), rs.getString("operating_system"), rs.getString("describe"), rs.getInt("lcid"));
        list.add(l);
        }
        }catch (SQLException e){
            System.out.println(e);
        }
        return list;
                
        }
       public static void main(String[] args) {
        LaptopProductDAO p = new LaptopProductDAO();
        List<LaptopProduct> list = p.getTop5();
           System.out.println(list);
    }
 
}
