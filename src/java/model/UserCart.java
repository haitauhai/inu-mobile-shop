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
public class UserCart {
    private String username;
    private int idProduct;
    private int idCategories;
    private int quantity;

    // Constructors
    public UserCart() {
    }

    public UserCart(String username, int idProduct, int idCategories, int quantity) {
        this.username = username;
        this.idProduct = idProduct;
        this.idCategories = idCategories;
        this.quantity = quantity;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdCategories() {
        return idCategories;
    }

    public void setIdCategories(int idCategories) {
        this.idCategories = idCategories;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}

