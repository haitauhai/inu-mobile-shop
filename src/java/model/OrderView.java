/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author nguye
 */
public class OrderView {
    private int id;
    private String username;
    private int idProduct;
    private int quantity;
    private int idCategories;
    private String name;
    private String address;
    private String phoneNumber;
    private String note;
    private long amount;
    private String status;
    private Timestamp date;
    private String image;

    public OrderView() {
    }

    public OrderView(int id, String username, int idProduct, int quantity, int idCategories, String name, String address, String phoneNumber, String note, long amount, String status, Timestamp date, String image) {
        this.id = id;
        this.username = username;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.idCategories = idCategories;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.note = note;
        this.amount = amount;
        this.status = status;
        this.date = date;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdCategories() {
        return idCategories;
    }

    public void setIdCategories(int idCategories) {
        this.idCategories = idCategories;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "OrderView{" + "id=" + id + ", username=" + username + ", idProduct=" + idProduct + ", quantity=" + quantity + ", idCategories=" + idCategories + ", name=" + name + ", address=" + address + ", phoneNumber=" + phoneNumber + ", note=" + note + ", amount=" + amount + ", status=" + status + ", date=" + date + ", image=" + image + '}';
    }
    
}
