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
public class Token {
    private int token_id;
    private int user_id;
    private String token_string;
    private Timestamp created_date;

    public Token() {
    }

    public Token(int token_id, int user_id, String token_string, Timestamp created_date) {
        this.token_id = token_id;
        this.user_id = user_id;
        this.token_string = token_string;
        this.created_date = created_date;
    }

    public int getToken_id() {
        return token_id;
    }

    public void setToken_id(int token_id) {
        this.token_id = token_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getToken_string() {
        return token_string;
    }

    public void setToken_string(String token_string) {
        this.token_string = token_string;
    }

    public Timestamp getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Timestamp created_date) {
        this.created_date = created_date;
    }

    @Override
    public String toString() {
        return "Token{" + "token_id=" + token_id + ", user_id=" + user_id + ", token_string=" + token_string + ", created_date=" + created_date + '}';
    }
}
