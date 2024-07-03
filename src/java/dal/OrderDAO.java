/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetails;
import model.Product;
import model.User;

/**
 *
 * @author nduya
 */
public class OrderDAO extends DBContext {

    //
    public int getNumberOrders() {
        try {
            String sql = "SELECT COUNT(*) FROM Orders";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int number = rs.getInt(1);
                return number;
            }
        } catch (Exception e) {
        }
        return 1;
    }

    public void addOrder(User cus) {
        CartDAO cartdao = new CartDAO();
        ProductDAO pd = new ProductDAO();
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            // add vao bang Order
            String sql1 = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([date]\n"
                    + "           ,[username]\n"
                    + "           ,[total])\n"
                    + "     VALUES (?,?,?)";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, date);
            st1.setString(2, cus.getUserName());
            st1.setDouble(3, cartdao.getTotalCart(cus));
            st1.executeUpdate();

            // Lay ra orderID cua Order vua tao
            String sql2 = "SELECT Top 1 [order_id] FROM [Orders] ORDER BY [order_id] DESC";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();

            if (rs.next()) {
                int oID = rs.getInt("order_id");

                // add thong tin vao bang OrderDetails
                for (Item item : cartdao.getCart()) {
                    double total = item.getQuantity() * item.getProduct().getPrice();
                    String sql3 = "INSERT INTO Order_Details ([order_id], [product_id], [quantity], [price])VALUES (?,?,?,?)";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, oID);
                    st3.setInt(2, item.getProduct().getId());
                    st3.setInt(3, item.getQuantity());
                    st3.setDouble(4, total);
                    st3.executeUpdate();
                }

                // update quantity sp (outside the loop)
                for (Item item : cartdao.getCart()) {
                    pd.updateValueProduct(item.getProduct(), item.getQuantity());
                }
            }

            // add vao bang orderDetail
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double totalMoneyMonth(int month, int year) {
        String sql = "select SUM([total]) from Orders\r\n"
                + "where MONTH([date])=? and year([date])=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            st.setInt(2, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyWeek(int day, int from, int to, int year, int month) {
        String sql = "";
        if (from > to) {
            sql = " SELECT SUM([total])\n"
                    + "				FROM Orders\n"
                    + "				WHERE ((DAY([date]) >= ? AND MONTH([date]) = ?) OR (DAY([date]) <= ? AND MONTH([date]) = ?)) AND YEAR([date]) = ? and DATEPART(dw,[date]) = ?";
        } else {
            sql = "select \n"
                    + "               	SUM([total])\n"
                    + "                  from Orders\n"
                    + "               where day([date]) between ? and ? and month([date]) = ? and year([date])= ?  and DATEPART(dw,[date]) = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (from > to) {
                st.setInt(1, from);
                st.setInt(2, month);
                st.setInt(3, to);
                st.setInt(4, (month + 1));
                st.setInt(5, year);
                st.setInt(6, day);
            } else {
                st.setInt(1, from);
                st.setInt(2, to);
                st.setInt(3, month);
                st.setInt(4, year);
                st.setInt(5, day);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double sumAllMoneyOrder() {
        String sql = "select SUM([total]) from Orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Order> getBillInfo() {
        UserDAO udao = new UserDAO();
        List<Order> list = new ArrayList<>();
        String sql = "select b.order_id, u.username, u.user_phone, u.user_address, b.date, b.total from Orders b inner join Users u on b.username = u.username";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = udao.getUserByUserName(rs.getString("username"));
                Order o = new Order(rs.getInt("order_id"), u, rs.getDouble("total"), rs.getDate("date"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Order getBill() {
        String sql = "select top 1 order_id, total, date from [Orders] order by order_id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return (new Order(rs.getInt(1), rs.getDouble(2), rs.getDate(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<OrderDetails> getDetail(int bill_id) {
        ProductDAO pdao = new ProductDAO();
        List<OrderDetails> list = new ArrayList<>();
        String sql = "select d.order_id, p.product_id, d.quantity, d.price from Order_Details d "
                + "inner join Products p on d.product_id = p.product_id where d.order_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bill_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = pdao.getProductByID(rs.getInt("product_id"));
                OrderDetails od = new OrderDetails(rs.getInt("order_id"), product, rs.getInt("quantity"), rs.getDouble("price"));
                list.add(od);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getTop5Users() {
        List<Order> list = new ArrayList<>();
        UserDAO udao = new UserDAO();
        String sql = "SELECT TOP 5 u.username, o.order_id, SUM(o.total) AS total_spent, o.date "
                + "FROM Users u LEFT JOIN Orders o "
                + "ON o.username = u.username "
                + "GROUP BY u.username, o.order_id, [role], o.date "
                + "HAVING [role] = 2"
                + "ORDER BY total_spent DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = udao.getUserByUserName(rs.getString("username"));
                list.add(new Order(rs.getInt("order_id"), u, rs.getDouble("total_spent"), rs.getDate("date")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        UserDAO udao = new UserDAO();
        String sql = "select * from Orders";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = udao.getUserByUserName(rs.getString("username"));
                list.add(new Order(rs.getInt("order_id"), u, rs.getDouble("total"), rs.getDate("date")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
//        List<OrderDetails> list = dao.getDetail(5);
        List<Order> list = dao.getAll();
        for (Order order : list) {
            System.out.println(order);
        }
    }
}
