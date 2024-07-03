/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nduya
 */
public class User {

    private String userName, fullName, password, address, phone, image, email;
    private int roleID;
    private String BirthDay;

    public User() {
    }
    
    public User(String userName) {
        this.userName = userName;

    }

    public User(String userName, String fullName, String password, String address, String phone, String email, String BirthDay, int roleID, String image) {
        this.userName = userName;
        this.fullName = fullName;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.BirthDay = BirthDay;
        this.email = email;
        this.roleID = roleID;
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthdate() {
        return BirthDay;
    }

    public void setBirthdate(String BirthDay) {
        this.BirthDay = BirthDay;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "User{" + "userName=" + userName + ", fullName=" + fullName + ", password=" + password + ", address=" + address + ", phone=" + phone + ", image=" + image + ", email=" + email + ", roleID=" + roleID + ", BirthDay=" + BirthDay + '}';
    }

    
}
