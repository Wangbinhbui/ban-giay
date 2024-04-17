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
import model.Category;


/**
 *
 * @author VIET HOANG
 */
public class CategoryDAO extends DBContext {
      PreparedStatement stm;
    ResultSet rs;
    List<Category> list = new ArrayList<>();
    
     public List<Category> getAllCategory() {
        try {
            String strSelect = "SELECT * FROM Category";
            stm = connection.prepareStatement(strSelect);          
            rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      public static void main(String[] args){
       CategoryDAO a = new CategoryDAO();
       List<Category> list = a.getAllCategory();
       System.out.println(list.get(0).toString());
    }
}
