/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import model.Account;
import model.Cart;
import model.Item;

/**
 *
 * @author VIET HOANG
 */
public class OrderDAO extends DBContext {

    public void addOrder(Account a, Cart cart) {
        try {
            String sql = "INSERT INTO [dbo].[order] ([total], [aid]) VALUES (?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, cart.getTotalMoney());
            st.setInt(2, a.getId());
            st.executeUpdate();

            String sql1 = "SELECT TOP 1 id FROM [dbo].[order] ORDER BY id DESC";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);

                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[orderdetail] ([oid], [pid], [quantity], [price]) VALUES (?, ?, ?, ?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }

            String sql3 = "UPDATE [dbo].[product] SET [quantity] = [quantity] - ? WHERE id = ?";
            PreparedStatement st3 = connection.prepareStatement(sql3);

            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In ra thông báo lỗi
        }
    }

}
