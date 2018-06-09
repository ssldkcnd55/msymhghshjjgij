package com.kh.farm.member.model.vo;

import javax.mail.PasswordAuthentication;

import javax.mail.Authenticator;


public class SMTPAuthenticator extends Authenticator {

    public SMTPAuthenticator() {

        super();

    }

 

    public PasswordAuthentication getPasswordAuthentication() {

        String username = "jakmoolfarm@gmail.com";

        String password = "jakmoolfarm12#";

        return new PasswordAuthentication(username, password);

    }

}