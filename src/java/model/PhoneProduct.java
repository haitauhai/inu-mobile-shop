/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class PhoneProduct {
    private int id;
    private String name;
    private String image;
    private int price;
    private String display;
    private String f_camera;
    private String r_camera;
    private String chip;
    private int ram;
    private int rom;
    private String describe;
    private int pcid;
    private int stock;

    public PhoneProduct() {
    }

    public PhoneProduct(int id, String name, String image, int price, String display, String f_camera, String r_camera, String chip, int ram, int rom, String describe, int pcid, int stock) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.display = display;
        this.f_camera = f_camera;
        this.r_camera = r_camera;
        this.chip = chip;
        this.ram = ram;
        this.rom = rom;
        this.describe = describe;
        this.pcid = pcid;
        this.stock = stock;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getF_camera() {
        return f_camera;
    }

    public void setF_camera(String f_camera) {
        this.f_camera = f_camera;
    }

    public String getR_camera() {
        return r_camera;
    }

    public void setR_camera(String r_camera) {
        this.r_camera = r_camera;
    }

    public String getChip() {
        return chip;
    }

    public void setChip(String chip) {
        this.chip = chip;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getRom() {
        return rom;
    }

    public void setRom(int rom) {
        this.rom = rom;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public int getPcid() {
        return pcid;
    }

    public void setPcid(int pcid) {
        this.pcid = pcid;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
}
