/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail {

    private int product_id;
    private int order_id;
    private int quantity;
    private int price;
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(int product_id, int order_id, int quantity, int price, Product product) {
        this.product_id = product_id;
        this.order_id = order_id;
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }


    @Override
    public String toString() {
        return "OrderDetail{" + "product_id=" + product_id + ", order_id=" + order_id + ", quantity=" + quantity + ", price=" + price + '}';
    }

}
