/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author VIET HOANG
 */
public class Order {
    /*id INT PRIMARY KEY IDENTITY(1,1),
    dateOrder DATE DEFAULT GETDATE(),
    total MONEY,
    aid INT,*/
    private int id;
    private Date dateOrder;
    private double total;
    private int aid;

    public Order() {
    }

    public Order(int id, Date dateOrder, double total, int aid) {
        this.id = id;
        this.dateOrder = dateOrder;
        this.total = total;
        this.aid = aid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", dateOrder=" + dateOrder + ", money=" + total + ", aid=" + aid + '}';
    }
    
}
