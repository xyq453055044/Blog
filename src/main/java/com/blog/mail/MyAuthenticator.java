package com.blog.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @author xyq
 * @date 2019/06/30
 */
public class MyAuthenticator extends Authenticator {
    private String strUser;
    private String strPwd;

    public MyAuthenticator(String user, String password) {
        this.strUser = user;
        this.strPwd = password;
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(strUser, strPwd);
    }

}
