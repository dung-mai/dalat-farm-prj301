/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class User {

    private int user_id;
    private String first_name;
    private String last_name;
    private String email;
    private String phone_number;
    private String address;
    private String password;
    private String avatar;
    private boolean external_login;
    private String external_id;
    private boolean verified;
    private boolean active;
    private Date created_at;
    private Date updated_at;

    public User() {
    }

    public User(int user_id, String first_name, String last_name, String email, String phone_number, String address, String password, String avatar, boolean external_login, String external_id, boolean verified, boolean active, Date created_at, Date updated_at) {
        this.user_id = user_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.phone_number = phone_number;
        this.address = address;
        this.password = password;
        this.avatar = avatar;
        this.external_login = external_login;
        this.external_id = external_id;
        this.verified = verified;
        this.active = active;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getStatus() {
        if (!active) {
            return 2;
        } else if (!verified) {
            return 3;
        } else {
            return 1;
        }
    }

    public void setStatus(int status) {
        if (status == 1) {
            active = true;
            verified = true;
        } else if (status == 2) {
            active = false;
        } else if(status == 3){
            verified = false;
        }
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isExternal_login() {
        return external_login;
    }

    public void setExternal_login(boolean external_login) {
        this.external_login = external_login;
    }

    public String getExternal_id() {
        return external_id;
    }

    public void setExternal_id(String external_id) {
        this.external_id = external_id;
    }

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", first_name=" + first_name + ", last_name=" + last_name + ", email=" + email + ", phone_number=" + phone_number + ", address=" + address + ", password=" + password + ", is_verified=" + verified + ", created_at=" + created_at + ", updated_at=" + updated_at + '}';
    }
}
