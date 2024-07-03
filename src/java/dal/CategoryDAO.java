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
public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("category_id"));
                c.setName(rs.getString("category_name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM Category where category_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            //1
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("category_id"));
                c.setName(rs.getString("category_name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getCategoryByName(String name) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category where category_name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            //1
            while (rs.next()) {
                Category c = new Category(rs.getInt("category_id"), rs.getString("category_name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCid(String cid) {
        CategoryDAO cd = new CategoryDAO();
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products where category_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
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

    public void addCategory(String name) {
        String sql = "INSERT INTO Category([category_name]) VALUES (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void updateCategory(int id, String name){
        String sql = "Update Category SET [category_name] = ? WHERE [category_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, id);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteCategory(int id){
        String sql = "delete from Category where category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CategoryDAO d = new CategoryDAO();
        List<Category> list = d.getAll();
        for (Category category : list) {
            System.out.println(category);
        }
    }
}
