/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author nguye
 */
public class Revenue {
    private Date date;
    private long revenue;

    public Revenue() {
    }

    public Revenue(Date date, long revenue) {
        this.date = date;
        this.revenue = revenue;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public long getRevenue() {
        return revenue;
    }

    public void setRevenue(long revenue) {
        this.revenue = revenue;
    }
    
    
}
