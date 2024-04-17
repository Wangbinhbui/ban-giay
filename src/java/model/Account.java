/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author VIET HOANG
 */
public class Account {
    private int id;
    private String user;
    private String pass;
    private String name;
    private String email;
    private String phone;
    private String address;
    private int role_id;
    private boolean deleted;

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
    
    public Account() {
    }

    public Account(int id, String user, String pass, int role_id) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.role_id = role_id;
    }

    public Account(int id, String name, String email, String phone, String address, String pass, String user, int role_id, boolean deleted) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role_id = role_id;
        this.deleted = deleted;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
    
}