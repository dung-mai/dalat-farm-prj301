/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.base;

import DAL.UserDAO;
import com.sun.mail.handlers.text_html;
import controller.auth.SendMail;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.mail.MessagingException;
import model.Cart;
import model.Item;
import model.Product;
import model.UserAddress;

/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws MessagingException {        
        Timestamp currenttime = new Timestamp(System.currentTimeMillis());
        Timestamp time = new Timestamp(currenttime.getYear(), currenttime.getMonth(),currenttime.getDate(), 0, 0, 0, 0);
        System.out.println(time);
        System.out.println(System.currentTimeMillis());
    }

}
