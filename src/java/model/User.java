/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class User {
    private String username;
    private String password;
    private String name;
    private String phoneNumber;
    private String fullAddress;
    private int role;

    public User() {
    }

    public User(String username, String password, String name, String phoneNumber, String fullAddress, int role) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.fullAddress = fullAddress;
        this.role = role;
    }

    

    // Getters và setters cho các thuộc tính
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullAddress() {
        return fullAddress;
    }

    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
    public String getSpecific(String fuadd, int i){
        String add = "";
        String[] list = fuadd.split(", ");
        if(list[i]!=null) return list[i];
        return add;
    }
}

