/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nduya
 */
public class Product {
    private String name, describe;
    private String image;
    private int id, quantity, quantitySold;
    private double price;
    private Category category;

    public Product() {
    }

    public Product(String name, String describe, String image, int id, int quantity, double price, Category category) {
        this.name = name;
        this.describe = describe;
        this.image = image;
        this.id = id;
        this.quantity = quantity;
        this.price = price;
        this.category = category;
    }

    public Product(String name, String describe, String image, int id, int quantity, int quantitySold, double price, Category category) {
        this.name = name;
        this.describe = describe;
        this.image = image;
        this.id = id;
        this.quantity = quantity;
        this.quantitySold = quantitySold;
        this.price = price;
        this.category = category;
    }
    
    
    
    public Product(String name, String describe, String image, int id, int quantity, double price) {
        this.name = name;
        this.describe = describe;
        this.image = image;
        this.id = id;
        this.quantity = quantity;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }
    

    @Override
    public String toString() {
        return "Product{" + "name=" + name + ", describe=" + describe + ", image=" + image + ", id=" + id + ", quantity=" + quantity + ", price=" + price + ", category=" + category + '}';
    }
    
}
