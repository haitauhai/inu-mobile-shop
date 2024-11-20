/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class TabletProduct {
    private int id;
    private String name;
    private String imgage;
    private int price;
    private double display_size;
    private String processor;
    private int ram;
    private int storage_capacity;
    private String operating_system;
    private String describe;
    private int tcid;

    public TabletProduct() {
    }

    public TabletProduct(int id, String name, String imgage, int price, double display_size, String processor, int ram, int storage_capacity, String operating_system, String describe, int tcid) {
        this.id = id;
        this.name = name;
        this.imgage = imgage;
        this.price = price;
        this.display_size = display_size;
        this.processor = processor;
        this.ram = ram;
        this.storage_capacity = storage_capacity;
        this.operating_system = operating_system;
        this.describe = describe;
        this.tcid = tcid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImgage() {
        return imgage;
    }

    public void setImgage(String imgage) {
        this.imgage = imgage;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getDisplay_size() {
        return display_size;
    }

    public void setDisplay_size(double display_size) {
        this.display_size = display_size;
    }

    public String getProcessor() {
        return processor;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getStorage_capacity() {
        return storage_capacity;
    }

    public void setStorage_capacity(int storage_capacity) {
        this.storage_capacity = storage_capacity;
    }

    public String getOperating_system() {
        return operating_system;
    }

    public void setOperating_system(String operating_system) {
        this.operating_system = operating_system;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getTcid() {
        return tcid;
    }

    public void setTcid(int tcid) {
        this.tcid = tcid;
    }
    
}
