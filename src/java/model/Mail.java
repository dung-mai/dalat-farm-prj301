/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Mail {
    private int e_id;
    private String name;
    private String title;
    private String message;
    private Timestamp created_at;

    public Mail() {
    }

    public Mail(int e_id, String name, String title, String message, Timestamp created_at) {
        this.e_id = e_id;
        this.name = name;
        this.title = title;
        this.message = message;
        this.created_at = created_at;
    }

    public int getE_id() {
        return e_id;
    }

    public void setE_id(int e_id) {
        this.e_id = e_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Mail{" + "e_id=" + e_id + ", name=" + name + ", title=" + title + ", message=" + message + ", created_at=" + created_at + '}';
    }
    
    
    
}
