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
import model.User;

/**
 *
 * @author nduya
 */
public class UserDAO extends DBContext {

    public User check(String username, String password) {
        String sql = "SELECT * FROM Users WHERE [username] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("username"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("user_address"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("BirthDay"), rs.getInt("role"), rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User checkUser(String username) {
        String sql = "SELECT * FROM Users WHERE [username] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("username"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("user_address"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("BirthDay"), rs.getInt("role"), rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users order by [user_id] asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("username"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("user_address"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("BirthDay"), rs.getInt("role"), rs.getString("image")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateImage(String image, String userName) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET \n"
                + "      [image] = ?\n"
                + " WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, image);
            st.setString(2, userName);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(String name, String address, String phone, String email, String dob, String userName) {
        String sql = "UPDATE [dbo].[Users] SET \n";
        if (name != null) {
            sql += " [fullName] = " + "?";
        }
        if (address != null) {
            sql += ", [user_address] =" + "?";
        }
        sql += ", [user_phone] =" + "?";
        sql += ", [user_email] =" + "?";
        sql += ", [BirthDay] =" + "?";
        sql += " WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, dob);
            st.setString(6, userName);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertUser(String UserName, String FullName, String Password,
            String Email, String Phone, int RoleID) {
        String sql = "INSERT INTO Users ([username], [fullName], [password], [user_email], [user_phone], [role])"
                + "     VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, UserName);
            st.setString(2, FullName);
            st.setString(3, Password);
            st.setString(4, Email);
            st.setString(5, Phone);
            st.setInt(6, RoleID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserByUserName(String userName) {
        String sql = "SELECT * FROM [dbo].[Users] where [username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            //1
            if (rs.next()) {
                User u = new User(rs.getString("username"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("user_address"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("BirthDay"), rs.getInt("role"), rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkUserNameDuplicate(String username) {
        String sql = "SELECT * FROM Users WHERE userName = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("username"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("user_address"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("BirthDay"), rs.getInt("role"), rs.getString("image"));
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<User> getUsersBySearchName(String txtSearch) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Users] where UserName LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("username"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("user_address"), rs.getString("user_phone"), rs.getString("user_email"), rs.getString("BirthDay"), rs.getInt("role"), rs.getString("image")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteUser(String username) {
        String sql = "delete from Users where [username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeQuery();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public void updatePassByUserName(String pass, String username) {
        String sql = "update Users set [password]=? where [username]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, username);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public int countAllUser() {
        String sql = "select count(*) from Users where [role] = 2";
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

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
//        User u = ud.getUserByUserName("user1");
        int num = ud.countAllUser();
        System.out.println(num);
    }
}
