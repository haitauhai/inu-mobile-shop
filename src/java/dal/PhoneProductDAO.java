/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.PhoneProduct;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author nguye
 */
public class PhoneProductDAO extends DBContext {

    public List<PhoneProduct> getAll() {
        List<PhoneProduct> list = new ArrayList<>();
        String sql = "select * from PhoneProduct";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PhoneProduct pp = new PhoneProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getInt("price"), rs.getString("display"), rs.getString("f_camera"), rs.getString("r_camera"),
                        rs.getString("chip"), rs.getInt("ram"), rs.getInt("rom"), rs.getString("describe"), rs.getInt("pcid"), rs.getInt("stock"));
                list.add(pp);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<PhoneProduct> getTop5() {
        List<PhoneProduct> list = new ArrayList<>();
        String sql = "select top 5 * from PhoneProduct order by price desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PhoneProduct pp = new PhoneProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getInt("price"), rs.getString("display"), rs.getString("f_camera"), rs.getString("r_camera"),
                        rs.getString("chip"), rs.getInt("ram"), rs.getInt("rom"), rs.getString("describe"), rs.getInt("pcid"), rs.getInt("stock"));
                list.add(pp);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<PhoneProduct> getProductByCID(int id) {
        List<PhoneProduct> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[display]\n"
                + "      ,[f_camera]\n"
                + "      ,[r_camera]\n"
                + "      ,[chip]\n"
                + "      ,[ram]\n"
                + "      ,[rom]\n"
                + "      ,[describe]\n"
                + "      ,[pcid], stock\n"
                + "  FROM [dbo].[PhoneProduct]\n"
                + "  where pcid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PhoneProduct pp = new PhoneProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getInt("price"), rs.getString("display"), rs.getString("f_camera"), rs.getString("r_camera"),
                        rs.getString("chip"), rs.getInt("ram"), rs.getInt("rom"), rs.getString("describe"), rs.getInt("pcid"), rs.getInt("stock"));
                list.add(pp);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public PhoneProduct getProductByID(int id) {
        PhoneProduct pp = null;
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[display]\n"
                + "      ,[f_camera]\n"
                + "      ,[r_camera]\n"
                + "      ,[chip]\n"
                + "      ,[ram]\n"
                + "      ,[rom]\n"
                + "      ,[describe]\n"
                + "      ,[pcid], stock\n"
                + "  FROM [dbo].[PhoneProduct]\n"
                + "  where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 pp = new PhoneProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getInt("price"), rs.getString("display"), rs.getString("f_camera"), rs.getString("r_camera"),
                        rs.getString("chip"), rs.getInt("ram"), rs.getInt("rom"), rs.getString("describe"), rs.getInt("pcid"), rs.getInt("stock"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return pp;
    }
    public List<PhoneProduct> getProductBySearch(int cid, String price,int ram, int rom){
         List<PhoneProduct> list = new ArrayList<>();
         String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[display]\n"
                + "      ,[f_camera]\n"
                + "      ,[r_camera]\n"
                + "      ,[chip]\n"
                + "      ,[ram]\n"
                + "      ,[rom]\n"
                + "      ,[describe]\n"
                + "      ,[pcid], stock\n"
                + "  FROM [dbo].[PhoneProduct]\n"
                + "  where 1=1";
         if(cid!=0) sql+=" and pcid = " + cid;
         if(price!=null && price!="") sql+=" and price " + price ;
         if(ram!=0) sql+=" and ram = " + ram;
         if(rom!=0) sql+=" and rom = " + rom;
         try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                PhoneProduct pp = new PhoneProduct(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
                        rs.getInt("price"), rs.getString("display"), rs.getString("f_camera"), rs.getString("r_camera"),
                        rs.getString("chip"), rs.getInt("ram"), rs.getInt("rom"), rs.getString("describe"), rs.getInt("pcid"), rs.getInt("stock"));
                list.add(pp);
            }
         }catch(Exception e){
             System.out.println(e);
         }
         return list;
    }
    public void addProduct(PhoneProduct product)  {
        String sql = "INSERT INTO PhoneProduct (name, image, price, display, f_camera, r_camera, chip, ram, rom, describe, pcid, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement pstmt; 
        try {
            pstmt = connection.prepareStatement(sql);
            pstmt.setNString(1, product.getName());
            pstmt.setString(2, product.getImage());
            pstmt.setInt(3, product.getPrice());
            pstmt.setNString(4, product.getDisplay());
            pstmt.setNString(5, product.getF_camera());
            pstmt.setNString(6, product.getR_camera());
            pstmt.setNString(7, product.getChip());
            pstmt.setInt(8, product.getRam());
            pstmt.setInt(9, product.getRom());
            pstmt.setNString(10, product.getDescribe());
            pstmt.setInt(11, product.getPcid());
            pstmt.setInt(12, product.getId());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PhoneProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        }
    public void updateProduct(PhoneProduct product) {
        String sql = "UPDATE [PhoneProduct] SET name = ?, image = ?, price = ?, display = ?, f_camera = ?, r_camera = ?, chip = ?, ram = ?, rom = ?, describe = ?, pcid = ?, stock = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setNString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setInt(3, product.getPrice());
            ps.setNString(4, product.getDisplay());
            ps.setNString(5, product.getF_camera());
            ps.setNString(6, product.getR_camera());
            ps.setNString(7, product.getChip());
            ps.setInt(8, product.getRam());
            ps.setInt(9, product.getRom());
            ps.setNString(10, product.getDescribe());
            ps.setInt(11, product.getPcid());
            ps.setInt(12, product.getStock());
            ps.setInt(13, product.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateStockProductByBuy(int id){
        String sql = "UPDATE [PhoneProduct] SET stock = stock - 1 where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteProduct(int id){
        String sql = "DELETE [PhoneProduct] where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        PhoneProductDAO p = new PhoneProductDAO();
        List<PhoneProduct> pp = p.getAll();
        System.out.println(pp.toString());
//        PhoneProduct phon = new PhoneProduct(0, " ", " ", 0, " ", " ", " ", " ", 0, 0, " ", 0);
//        p.addProduct(phon);
    }
}
