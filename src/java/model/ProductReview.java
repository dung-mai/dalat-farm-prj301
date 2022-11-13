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
public class ProductReview {
    private int review_id;
    private int user_id;
    private int product_id;
    private String name;
    private String email;
    private String detail;
    private int rating;
    private Timestamp created_at;

    public ProductReview() {
    }

    public ProductReview(int review_id, int user_id, int product_id, String name, String email, String detail, int rating, Timestamp created_at) {
        this.review_id = review_id;
        this.user_id = user_id;
        this.product_id = product_id;
        this.name = name;
        this.email = email;
        this.detail = detail;
        this.rating = rating;
        this.created_at = created_at;
    }

    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "ProductReview{" + "review_id=" + review_id + ", user_id=" + user_id + ", product_id=" + product_id + ", name=" + name + ", email=" + email + ", detail=" + detail + ", rating=" + rating + ", created_at=" + created_at + '}';
    }
}
