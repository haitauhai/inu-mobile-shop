/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nguye
 */
public class CartView {
    private int id;
    private String image;
    private String nameProduct;
    private double price;
    private int quantity;

    // Constructors
    public CartView() {
    }

    public CartView(int id, String image, String nameProduct, double price, int quantity) {
        this.id = id;
        this.image = image;
        this.nameProduct = nameProduct;
        this.price = price;
        this.quantity = quantity;
    }

    

    // Getters and Setters
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}

