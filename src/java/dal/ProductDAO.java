/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ProductSales;

/**
 *
 * @author VIET HOANG
 */
public class ProductDAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;
    List<Product> list = new ArrayList<>();

    public List<Product> getAllProduct() {
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[c_id]\n"
                    + "      ,[b_id]\n"
                    + "      ,[title]\n"
                    + "      ,[price]\n"
                    + "      ,[image]\n"
                    + "      ,[description]\n"
                    + "      ,[created_at]\n"
                    + "      ,[deleted]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product] where deleted = 'false'";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                        rs.getString("description"), rs.getDate("created_at"),
                        rs.getBoolean("deleted"), rs.getInt("quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCID(int c_id) {
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[c_id]\n"
                    + "      ,[b_id]\n"
                    + "      ,[title]\n"
                    + "      ,[price]\n"
                    + "      ,[image]\n"
                    + "      ,[description]\n"
                    + "      ,[created_at]\n"
                    + "      ,[deleted]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product]"
                    + "where c_id= ? and deleted = 'false'";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, c_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"), rs.getString("description"), rs.getDate("created_at"), rs.getBoolean("deleted"), rs.getInt("quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(int id) {
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[c_id]\n"
                    + "      ,[b_id]\n"
                    + "      ,[title]\n"
                    + "      ,[image]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[created_at]\n"
                    + "      ,[deleted]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product]"
                    + "where id= ? and deleted = 'false'";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getBoolean(9),
                        rs.getInt(10));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//SELECT [id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [deleted], [quantity]

    public List<Product> SearchByName(String txtSearch) {
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[c_id]\n"
                    + "      ,[b_id]\n"
                    + "      ,[title]\n"
                    + "      ,[price]\n"
                    + "      ,[image]\n"
                    + "      ,[description]\n"
                    + "      ,[created_at]\n"
                    + "      ,[deleted]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product]"
                    + "where [title] like ? and deleted = 'false'";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, "%" + txtSearch + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                        rs.getString("description"), rs.getDate("created_at"),
                        rs.getBoolean("deleted"), rs.getInt("quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> SearchByNameAndCid(String txtSearch, int c_id) {
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[c_id]\n"
                    + "      ,[b_id]\n"
                    + "      ,[title]\n"
                    + "      ,[price]\n"
                    + "      ,[image]\n"
                    + "      ,[description]\n"
                    + "      ,[created_at]\n"
                    + "      ,[deleted]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product]"
                    + "where [title] like ? and c_id = ? and deleted = 'false'";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, "%" + txtSearch + "%");
            stm.setInt(2, c_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                        rs.getString("description"), rs.getDate("created_at"),
                        rs.getBoolean("deleted"), rs.getInt("quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCIDAndBID(int[] c_id, int[] b_id, String priceorder) {
        List<Product> list1 = new ArrayList<>();
        try {
            String strSelect = "SELECT [id], [c_id], [b_id], [title], [price], [image], [description], [created_at], [deleted], [quantity]\n" +
"                               FROM [dbo].[product] where 1 = 1 "
                               ;

            // Kiểm tra nếu cả c_id và b_id đều được truyền vào
            if ((c_id != null && b_id != null) && (c_id[0] != 0 && b_id[0] != 0)) {
                strSelect += " and [c_id] in (";
                for (int i = 0; i < c_id.length; i++) {
                    strSelect += c_id[i] + ",";
                }
                if (strSelect.endsWith(",")) {
                    strSelect = strSelect.substring(0, strSelect.length() - 1);
                }
                strSelect += ") and [b_id] in (";
                for (int i = 0; i < b_id.length; i++) {
                    strSelect += b_id[i] + ",";
                }
                if (strSelect.endsWith(",")) {
                    strSelect = strSelect.substring(0, strSelect.length() - 1);
                }
                strSelect += ") and deleted = 'false'";
                if (priceorder.equalsIgnoreCase("increase")) {
                    strSelect += " ORDER BY [price] ASC";
                } else if (priceorder.equalsIgnoreCase("decrease")) {
                    strSelect += " ORDER BY [price] DESC";
                }
                stm = connection.prepareStatement(strSelect);
            } // Kiểm tra nếu chỉ có c_id được truyền vào
            else if ((c_id != null && b_id[0] == 0 && c_id[0] != 0)) {
                strSelect += " and [c_id] in (";
                for (int i = 0; i < c_id.length; i++) {
                    strSelect += c_id[i] + ",";
                }
                if (strSelect.endsWith(",")) {
                    strSelect = strSelect.substring(0, strSelect.length() - 1);
                }
                strSelect += ") and deleted = 'false'";
                if (priceorder.equalsIgnoreCase("increase")) {
                    strSelect += " ORDER BY [price] ASC";
                } else if (priceorder.equalsIgnoreCase("decrease")) {
                    strSelect += " ORDER BY [price] DESC";
                }
                stm = connection.prepareStatement(strSelect);
            } // Kiểm tra nếu chỉ có b_id được truyền vào
            else if (b_id != null && c_id[0] == 0 && b_id[0]!= 0) {
                strSelect += " and [b_id] in (";
                for (int i = 0; i < b_id.length; i++) {
                    strSelect += b_id[i] + ",";
                }
                if (strSelect.endsWith(",")) {
                    strSelect = strSelect.substring(0, strSelect.length() - 1);
                }
                strSelect += ") and deleted = 'false'";
                if (priceorder.equalsIgnoreCase("increase")) {
                    strSelect += " ORDER BY [price] ASC";
                } else if (priceorder.equalsIgnoreCase("decrease")) {
                    strSelect += " ORDER BY [price] DESC";
                }
                stm = connection.prepareStatement(strSelect);
            } // Trường hợp không có tham số nào được truyền vào, lấy tất cả sản phẩm
            else {
                strSelect += " and [deleted] = 'false'";
                if (priceorder.equalsIgnoreCase("increase")) {
                    strSelect += " ORDER BY [price] ASC";
                } else if (priceorder.equalsIgnoreCase("decrease")) {
                    strSelect += " ORDER BY [price] DESC";
                }
                stm = connection.prepareStatement(strSelect);
            }
            rs = stm.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                        rs.getString("description"), rs.getDate("created_at"),
                        rs.getBoolean("deleted"), rs.getInt("quantity"));
                list1.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list1;
    }

    public List<Product> getProductByBID(int b_id) {
        try {
            String strSelect = "SELECT [id]\n"
                    + "      ,[c_id]\n"
                    + "      ,[b_id]\n"
                    + "      ,[title]\n"
                    + "      ,[price]\n"
                    + "      ,[image]\n"
                    + "      ,[description]\n"
                    + "      ,[created_at]\n"
                    + "      ,[deleted]\n"
                    + "      ,[quantity]\n"
                    + "  FROM [dbo].[product]"
                    + "where [b_id]= ? and deleted = 'false'";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, b_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                        rs.getString("description"), rs.getDate("created_at"),
                        rs.getBoolean("deleted"), rs.getInt("quantity"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void DeleteProduct(int pid) {
        String strSelect = "UPDATE [dbo].[product]\n"
                + "   SET \n"
                + "      [deleted] = 'true'\n"
                + " WHERE id = ?";
        try {

            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, pid);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addProduct(String title, String image, double price, String description, int c_id, int b_id) {
        String strSelect = "INSERT INTO [dbo].[product]\n"
                + "           ([c_id]\n"
                + "           ,[b_id]\n"
                + "           ,[title]\n"
                + "           ,[price]\n"
                + "           ,[image]\n"
                + "           ,[description])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {

            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, c_id);
            stm.setInt(2, b_id);
            stm.setString(3, title);
            stm.setDouble(4, price);
            stm.setString(5, "images/" + image);
            stm.setString(6, description);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void UpdateProduct(String title, String image, double price, String description, int c_id, int id, int b_id) {
        String strSelect = "UPDATE [dbo].[product]\n"
                + "   SET [c_id] = ?"
                + "      ,[b_id] = ?"
                + "      ,[title] = ?"
                + "      ,[price] = ?"
                + "      ,[image] = ?"
                + "      ,[description] = ?"
                + "      ,[updated_at] = getdate()"
                + "where id= ?";
        try {
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, c_id);
            stm.setInt(2, b_id);
            stm.setString(3, title);
            stm.setDouble(4, price);
            stm.setString(5, "images/" + image);
            stm.setString(6, description);
            stm.setInt(7, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getListbyPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<ProductSales> getTop5BestSellingProducts() {
        List<ProductSales> top5List = new ArrayList<>();
        String sql = "SELECT TOP 5 p.[id], p.[c_id], p.[b_id], p.[title], p.[price], p.[image], p.[description], p.[created_at], p.[updated_at], p.[deleted], p.[quantity], od.total_quantity AS total_ordered\n"
                + "FROM [dbo].[product] p\n"
                + "JOIN (\n"
                + "    SELECT [pid], SUM([quantity]) AS total_quantity\n"
                + "    FROM [dbo].[orderdetail]\n"
                + "    GROUP BY [pid]\n"
                + ") od ON p.[id] = od.[pid]\n"
                + "ORDER BY od.total_quantity DESC;";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                        rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                        rs.getString("description"), rs.getDate("created_at"),
                        rs.getBoolean("deleted"), rs.getInt("quantity"));
                int totalSold = rs.getInt("total_ordered");
                ProductSales productSales = new ProductSales(product, totalSold);
                top5List.add(productSales);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return top5List;
    }

    public List<Product> top5newProduct() {
        List<Product> listP = new ArrayList<>();
        String sql = "SELECT TOP 5\n"
                + "    [id],\n"
                + "    [c_id],\n"
                + "    [b_id],\n"
                + "    [title],\n"
                + "    [price],\n"
                + "    [image],\n"
                + "    [description],\n"
                + "    [created_at],\n"
                + "    [deleted],\n"
                + "    [quantity]\n"
                + "FROM\n"
                + "    [dbo].[product]\n"
                + "ORDER BY\n"
                + "    [created_at] DESC;";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            Product c = new Product(rs.getInt("id"), rs.getInt("c_id"), rs.getInt("b_id"),
                    rs.getString("title"), rs.getString("image"), rs.getDouble("price"),
                    rs.getString("description"), rs.getDate("created_at"),
                    rs.getBoolean("deleted"), rs.getInt("quantity"));
            listP.add(c);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listP;
    }

    public static void main(String[] args) {
        ProductDAO a = new ProductDAO();
        List<Product> list = a.getAllProduct();
        System.out.println(list.get(0).toString());
    }
}
