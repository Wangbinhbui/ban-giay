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
import model.Account;
import model.Product;

/**
 *
 * @author VIET HOANG
 */
public class AccountDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Account> list = new ArrayList<>();

    public List<Account> getALl() {
        String sql = "select * from account";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getBoolean(9));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account login(String user, String pass) {
        String sql = "SELECT *"
                + "  FROM [dbo].[account]\n"
                + "where [username]= ?\n"
                + "and [password]= ? and deleted = 'false'";
        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getBoolean(9));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public Account checkAccountExist(String user) {
        String sql = "SELECT *"
                + "  FROM [dbo].[account]"
                + "where [username]= ?\n";

        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getBoolean(9));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void Signup(String user, String pass) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           (\n"
                + "           [username]\n"
                + "           ,[password]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?,?,2)";
        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addNewAccount(String user, String email, String phone, String name, String address, String pass, int role_id) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           (\n"
                + "           [username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[phonenumber]\n"
                + "           ,[name]\n"
                + "           ,[address]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {

            stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            stm.setString(3, email);
            stm.setString(4, phone);
            stm.setString(5, name);
            stm.setString(6,address);
            stm.setInt(7,role_id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String user, String email, String phone, String name, String address) {
        String sql = "UPDATE [dbo].[account]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE username=?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, email);
            stm.setString(3, phone);
            stm.setString(4, address);
            stm.setString(5, user);
            stm.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void update2(String user, String email, String phone, String name, String address, String password, int role_id) {
        String sql = "UPDATE [dbo].[account]\n"
                + "   SET [name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[role_id] = ?\n"
                + " WHERE username=?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, email);
            stm.setString(3, phone);
            stm.setString(4, address);
            stm.setString(5, password);
            stm.setInt(6, role_id);
            stm.setString(7, user);
            stm.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void changePassword(String user, String pass) {
        String sql = "update [dbo].[account] set [password] = ? where [username] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, pass);
            stm.setString(2, user);
            stm.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public void lockAccount(String user){
        String sql = "update [dbo].[account] set [deleted] = 'true' where [username] = ?";
        try{
            stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.executeUpdate();
        }catch(SQLException e){
            
        }
    }
    public void unlockAccount(String user){
        String sql = "update [dbo].[account] set [deleted] = 'false' where [username] = ?";
        try{
            stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.executeUpdate();
        }catch(SQLException e){
            
        }
    }
}
