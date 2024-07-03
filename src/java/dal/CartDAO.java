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
import model.Item;
import model.Product;
import model.User;

/**
 *
 * @author nduya
 */
public class CartDAO extends DBContext {

    public List<Item> getCart() {
        List<Item> list = new ArrayList<>();
        ProductDAO pdao = new ProductDAO();
        String sql = "SELECT * FROM [dbo].[Cart]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = pdao.getProductByID(rs.getInt("product_id"));
                list.add(new Item(p, rs.getInt("quantity")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Item> getCartByUserName(String username) {
        List<Item> list = new ArrayList<>();
        ProductDAO pdao = new ProductDAO();
        String sql = "SELECT * FROM [dbo].[Cart] where [username] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = pdao.getProductByID(rs.getInt("product_id"));
                list.add(new Item(p, rs.getInt("quantity")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void addCart(Product p, int quantiy, User u) {
        CartDAO cdao = new CartDAO();
        String sql = "INSERT INTO [dbo].[Cart] ([product_id] ,[product_name], [product_img], [product_price], [total], [quantity], [username])\n"
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            if (cdao.getProductInCart(p, u) != null) {
                cdao.updateCart(p, u, cdao.getQuantityProductInCart(p, u) + quantiy);
            } else {
                st.setInt(1, p.getId());
                st.setString(2, p.getName());
                st.setString(3, p.getImage());
                st.setDouble(4, p.getPrice());
                st.setDouble(5, p.getPrice() * quantiy);
                st.setInt(6, quantiy);
                st.setString(7, u.getUserName());
                st.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getQuantityProductInCart(Product p, User u) {
        String sql = "Select * from Cart c inner join Products p on c.product_id = p.product_id where username = ? AND c.product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            st.setInt(2, p.getId());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product product = new Product(rs.getString("product_name"), rs.getString("product_describe"), rs.getString("img"), rs.getInt("product_id"), rs.getInt("quantity"), rs.getDouble("UnitPrice"));
                return product.getQuantity();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Product getProductInCart(Product p, User u) {
        String sql = "Select * from Cart c inner join Products p on c.product_id = p.product_id where username = ? AND c.product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            st.setInt(2, p.getId());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product product = new Product(rs.getString("product_name"), rs.getString("product_describe"), rs.getString("img"), rs.getInt("product_id"), rs.getInt("quantity"), rs.getDouble("UnitPrice"));
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCart(Product p, User u, int quantity) {
        String sql = "UPDATE Cart SET quantity = ? WHERE username = ? AND product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setString(2, u.getUserName());
            st.setInt(3, p.getId());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteItemCart(Product p, User u) {
        String sql = "delete from Cart where product_id = ? and username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getId());
            st.setString(2, u.getUserName());
            st.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCart(User u) {
        String sql = "delete from Cart where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            st.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public double getTotalCart(User u) {
        String sql = "SELECT SUM(product_price * quantity) as total FROM Cart WHERE username = ? GROUP BY username";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUserName());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                double total = rs.getDouble("total");
                return total;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public static void main(String[] args) {
        CartDAO cdao = new CartDAO();
        List<Item> list = cdao.getCartByUserName("dyann");
        for (Item item : list) {
            System.out.println(item);

        }
    }

}
