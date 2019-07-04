package com.blog.mail;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * @author xyq
 * @date 2019/06/30
 */
public class SendEmail {

    public static void sendEmailMessage(String email, String validateCode, String msg) {
        try {
            /**
             * 发件人使用发邮件的电子信箱服务器
             * 发件人邮箱
             */
            String host = "smtp.163.com";
            String from = "xyqPython@163.com";
            String to = email;

            // Get system properties
            Properties props = System.getProperties();

            // Setup mail server
            props.put("mail.smtp.host", host);

            // Get Session
            // 这样才能验证通过
            props.put("mail.smtp.auth", "true");

            // 阿里云上25号端口被禁用，需设置465端口，添加下面两行代码 // 设置SSL端口
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            /**
             * 授权码
             */
            MyAuthenticator myauth = new MyAuthenticator(from, "kaixin1205");
            Session session = Session.getDefaultInstance(props, myauth);

            // Define message
            MimeMessage message = new MimeMessage(session);

            // Set the from address
            message.setFrom(new InternetAddress(from));

            // Set the to address
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set the subject
            message.setSubject(msg);

            // Set the content
            message.setContent("<a href=\"http://localhost:8080/activeCode?email=" + email + "&validateCode=" + validateCode + "\" target=\"_blank\">请于12小时内点击激活</a>", "text/html;charset=gb2312");
            message.saveChanges();

            Transport.send(message);
        } catch (Exception e) {
            e.getMessage();
        }
    }
}
