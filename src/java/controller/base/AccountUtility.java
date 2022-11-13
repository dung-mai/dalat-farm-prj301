/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.base;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class AccountUtility {

    /*   PATTERN MATCHING
        (?=.*[0-9]) a digit must occur at least once
        (?=.*[a-z]) a lower case letter must occur at least once
        (?=.*[A-Z]) an upper case letter must occur at least once
        (?=.*[@#$%^&+=]) a special character must occur at least once
        (?=\\S+$) no whitespace allowed in the entire string
        .{8,} at least 8 characters 
    */
    public static boolean isValidPassword(String password, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
//        String patternn = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,30}";
    }
    
    public static boolean validateString(String password, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
//        String patternn = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{6,30}";
    }
    
}
