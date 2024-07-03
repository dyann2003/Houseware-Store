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
import model.Product;

/**
 *
 * @author nduya
 */
public class ProductDAO extends DBContext {

    private CategoryDAO cd = new CategoryDAO();
//    private DecimalFormat df = new DecimalFormat("###.##");

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Products]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String img = rs.getString("img");
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        img,
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    // 1> List products get by Category
    public List<Product> getProductsByCategoryid(int cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";
        if (cid != 0) {
            sql += " where category_id = ?";
        } else {
            sql += " where 0 = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    // 2> List products get by brand in year

    public List<Product> getProductsBrandByInYear(int year, Category category) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE YEAR(releaseDate) = ? ";
        if (category != null) {
            sql += " AND [category_id] =" + category.getId();
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // 3> List products in TOP <int> BEST SELLERS
    public List<Product> getTopBestSellers(String number) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP " + number + " * FROM Products ORDER BY [QuantitySold] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // 5> List product show in footer => random sp
    public List<Product> getFeaturedProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP 3 * FROM Products ORDER BY [QuantitySold";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // 6> List gift set 
    public List<Product> getGiflSets() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE category_id = 5";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    //Search By Check
    public List<Product> searchByCheckBox(int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1=1 ";
        if ((cid != null) && (cid[0] != 0)) {
            sql += " AND category_id in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //Search by price
    public List<Product> searchByPrice(double price1, double price2, int[] cid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE 1=1";
        if (price1 != 0) {
            sql += " and UnitPrice >= " + price1;
        }
        if (price2 != 0) {
            sql += " and UnitPrice <= " + price2;
        }
        if ((cid != null) && (cid[0] != 0)) {
            sql += " AND category_id in(";
            for (int i = 0; i < cid.length; i++) {
                sql += cid[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //getnext9Product
    public List<Product> getNext9Product(int amount) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM Products\n"
                + " ORDER BY product_id\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 9 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, amount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;

    }

    //searchbyname
    public List<Product> searchByName(String text) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Products where [product_name] like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // getProduct by name
    public Product getProductByName(String name) {
        String sql = "SELECT * FROM Products WHERE [product_name] =" + name;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    //
    public void updateValueProduct(Product product, int value) {
        try {
            String sql = "UPDATE Products SET [QuantityRemaining] = (QuantityRemaining - ?) AND [QuantitySold] = (QuantitySold + ?) WHERE [product_id] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, value);
            st.setInt(2, value);
            st.setInt(2, product.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    //
    public List<Product> getNext6Product(int amount) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM Products\n"
                + " ORDER BY [product_id]\n"
                + "OFFSET ? ROWS\n"
                + " FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, amount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countAllProduct() {
        String sql = "select sum([QuantityRemaining]) from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countAllTypeProduct() {
        String sql = "select count(*) from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getTop10SellerProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top(10) *\r\n"
                + "from Products\r\n"
                + "order by QuantitySold desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getInt("QuantitySold"),
                        rs.getDouble("UnitPrice"),
                        c);
                list.add(p);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductByID(int id) {
        String sql = "SELECT * FROM Products WHERE [product_id] =" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                return p;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public int getSumQuantitySold() {
        String sql = "select SUM([QuantitySold]) from Products";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void deleteProduct(int pid) {
        String sql = "delete from Products where [product_id]= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, double price, String describe, int quantity, int categoryID) {
        String sql = "INSERT INTO Products([category_id], [product_name], [product_describe], [UnitPrice], [QuantitySold], [img])"
                + "VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            st.setString(2, name);
            st.setString(3, describe);
            st.setDouble(4, price);
            st.setInt(5, quantity);
            st.setString(6, image);
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void editProduct(String name, String img, double price, String describe, int quantity, int categoryID, int productID) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [product_name] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[UnitPrice] =? \n"
                + "      ,[QuantityRemaining] =? \n";

        if (!(img.equals(""))) {
            sql += "      ,[img] =? \n";
        }
        sql += "      ,[product_describe] =? \n"
                + " WHERE [product_id]=?";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, categoryID);
            st.setDouble(3, price);
            st.setInt(4, quantity);
            if (!img.equals("")) {
                st.setString(5, img);
                st.setString(6, describe);
                st.setInt(7, productID);
                st.executeUpdate();
                return;
            } else {
                st.setString(6, describe);
                st.setInt(7, productID);
                st.executeUpdate();
            }

        } catch (Exception e) {

        }
    }

    public Product getLast() {
        String sql = "select top 1 * from Products order by [product_id] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category c = cd.getCategoryById(rs.getInt("category_id"));
                Product p = new Product(
                        rs.getString("product_name"),
                        rs.getString("product_describe"),
                        rs.getString("img"),
                        rs.getInt("product_id"),
                        rs.getInt("QuantityRemaining"),
                        rs.getDouble("UnitPrice"),
                        c);
                return p;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public int getQuantityRemaining(int product_id) {
        String sql = "select QuantityRemaining from Products where product_id = ?";
        int quantity = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return quantity;
    }

    public void updateQuantity(int product_id, int quantity) {
        String sql = "UPDATE Products\n"
                + "SET QuantityRemaining = (select QuantityRemaining from Products where product_id = ?) + ?\n"
                + "WHERE product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, quantity);
            st.setInt(3, product_id);
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public void updateQuantitySold(int product_id, int quantity) {
        String sql = "UPDATE Products\n"
                + "SET QuantitySold = (select QuantitySold from Products where product_id = ?) + ?\n"
                + "WHERE product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, quantity);
            st.setInt(3, product_id);
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public void updateQuantityRemaining(int product_id, int quantity) {
        String sql = "UPDATE Products\n"
                + "SET QuantityRemaining = (select QuantityRemaining from Products where product_id = ?) - ?\n"
                + "WHERE product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            st.setInt(2, quantity);
            st.setInt(3, product_id);
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
//        List<Product> list = p.getProductsByCategoryid(1);
//        for (Product product : list) {
//            System.out.println(product);
//        }
//        int quantity = p.getQuantityRemaining(1);
//        System.out.println(quantity);
//        for (int i = 2; i < 26; i++) {
//            p.updateQuantitySold(i, 10);
//
//        }
//        p.updateQuantityRemaining(1, 2000);

    }
}
