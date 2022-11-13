/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

/**
 *
 * @author Admin
 */
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

public class SendMail {

    public static String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public static void sendEmail(String toAddress, String token)
            throws AddressException, MessagingException {

        String message = "Hi " + toAddress + ",\n"
                + "<p>We just need to <strong>verify your </strong> email address before you can access your page.</p>\n"
                + "\n"
                + "Verify your email address by this code: \n"
                + token + "\n"
                + "Thanks!";

        String subject = "Email verification account from DalatFarm";

        final String userName = "maivandungdungdung@gmail.com";
        final String password = "hffogqipslvywmob";

        String host = "smtp.gmail.com", port = "587";
//        hffogqipslvywmob

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress("dungmvhe163263@fpt.edu.vn")};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
//        msg.setText();
        msg.setContent(message, "text/html; charset=utf-8");

        // sends the e-mail
        Transport.send(msg);
    }

    public static void sendEmail(String toAddress, String subject, String message)
            throws AddressException, MessagingException {

        final String userName = "maivandungdungdung@gmail.com";
        final String password = "hffogqipslvywmob";

        String host = "smtp.gmail.com", port = "587";
//        hffogqipslvywmob

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {

            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);
//        BodyPart messageBodyPart = new MimeBodyPart();
//        messageBodyPart.
//        
        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress("dungmvhe163263@fpt.edu.vn")};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
//        msg.setText();
        msg.setContent(message, "text/html; charset=utf-8");

        // sends the e-mail
        Transport.send(msg);
    }

//    public static void main(String[] args) throws MessagingException {
//        sendEmail("maivandungdungdung@gmail.com", "123456");
//    }
    public static void sendEmailMultiple(String[] emailList, String subject, String message) throws AddressException, MessagingException {
        final String userName = "maivandungdungdung@gmail.com";
        final String password = "hffogqipslvywmob";

        String host = "smtp.gmail.com", port = "587";
//        hffogqipslvywmob

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {

            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);
//        BodyPart messageBodyPart = new MimeBodyPart();
//        messageBodyPart.
//        
        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        InternetAddress[] toAddresses = new InternetAddress[emailList.length];

        msg.setFrom(new InternetAddress(userName));
        for (int i = 0; i < emailList.length; i++) {
            toAddresses[i] = new InternetAddress(emailList[i]);
        }
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
//        msg.setText();
        msg.setContent(message, "text/html; charset=utf-8");

        // sends the e-mail
        Transport.send(msg);
    }
}
