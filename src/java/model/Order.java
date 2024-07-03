/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author nduya
 */
public class Order {

    private int orderId;
    private User user;
    private double total;
    private Date date;

    public Order() {
    }

    public Order(int orderId, User user, double total, Date date) {
        this.orderId = orderId;
        this.user = user;
        this.total = total;
        this.date = date;
    }
    
    public Order(int orderId,double total,Date date) {
        this.orderId = orderId;
        this.total = total;
        this.date = date;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", user=" + user + ", total=" + total + ", date=" + date + '}';
    }

    
    
}
