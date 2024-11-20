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
public class UserPurchase {
    private String username;
    private int purchaseCount;

    public UserPurchase() {
    }

    public UserPurchase(String username, int purchaseCount) {
        this.username = username;
        this.purchaseCount = purchaseCount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPurchaseCount() {
        return purchaseCount;
    }

    public void setPurchaseCount(int purchaseCount) {
        this.purchaseCount = purchaseCount;
    }
    
}
