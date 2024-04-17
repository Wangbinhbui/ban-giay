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
import model.Brand;

/**
 *
 * @author VIET HOANG
 */
public class BrandDAO extends DBContext{
    PreparedStatement stm;
    ResultSet rs;
    List<Brand> list = new ArrayList<>();
    
     public List<Brand> getAllBrand() {
        try {
            String strSelect = "SELECT * FROM brand";
            stm = connection.prepareStatement(strSelect);          
            rs = stm.executeQuery();
            while (rs.next()) {
                Brand c = new Brand(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
