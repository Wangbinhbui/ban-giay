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
public class Product {
    private int id;
    private int c_id;
    private int b_id;
    private String title;
    private String image;
    private double price;
    private String description;
    private Date created_at;
    private Date updated_at;
    private boolean deleted;
    private int quantity;

    public Product() {
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public Product(int id, int c_id, int b_id, String title, String image, double price, String description,Date created_at, boolean deleted, int quantity) {
        this.id = id;
        this.c_id = c_id;
        this.b_id = b_id;
        this.title = title;
        this.image = image;
        this.price = price;
        this.description = description;
        this.created_at = created_at;
        this.deleted = deleted;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public String getImages(){
        return image.substring(7);
    }
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", c_id=" + c_id + ", b_id=" + b_id + ", title=" + title + ", image=" + image + ", price=" + price + ", description=" + description + ", created_at=" + created_at + ", updated_at=" + updated_at + ", deleted=" + deleted + '}';
    }

    
}
