/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nduya
 */
public class OrderDetails {
    private int order_id;
    private Product product;
    private int quantity;
    private double price;

    public OrderDetails() {
    }
    
    public OrderDetails(int order_id, Product product, int quantity, double price) {
        this.order_id = order_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "order_id=" + order_id + ", product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
    
}
