/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import controller.base.Utility;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Order {

    private int order_id;
    private int user_id;
    private String order_code;
    private Timestamp order_date;
    private int status;
    private Timestamp deliveryDate;
    private String fullname;
    private String email;
    private String phone_number;
    private String address;
    private String payment_method;
    private ArrayList<OrderDetail> orderList;

    public Order() {
        orderList = new ArrayList<>();
    }

    public Order(int order_id, int user_id, String order_code, Timestamp order_date, int status, Timestamp deliveryDate, String fullname, String email, String phone_number, String address, String payment_method, ArrayList<OrderDetail> orderList) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_code = order_code;
        this.order_date = order_date;
        this.status = status;
        this.deliveryDate = deliveryDate;
        this.fullname = fullname;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.payment_method = payment_method;
        this.orderList = orderList;
    }

    public ArrayList<OrderDetail> getOrderList() {
        return orderList;
    }

    public void setOrderList(ArrayList<OrderDetail> orderList) {
        this.orderList = orderList;
    }

    public String getOrder_code() {
        return order_code;
    }

    public void setOrder_code(String order_code) {
        this.order_code = order_code;
    }

    public int getOrder_id() {
        return order_id;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Timestamp order_date) {
        this.order_date = order_date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Timestamp deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    
    
    public long getTotalMoney() {
        long total = 0;
        for (OrderDetail o: orderList ){
            total += o.getPrice() * o.getQuantity();
        }
        return total;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", status=" + status + ", first_name=" + fullname + ", email=" + email + ", phone_number=" + phone_number + ", address=" + address;
    }
}
