package com.app.config;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

    @Value("${naver.mail.host}")
    private String naverHost;

    @Value("${naver.mail.port}")
    private int naverPort;

    @Value("${naver.mail.username}")
    private String naverUsername;

    @Value("${naver.mail.password}")
    private String naverPassword;

    @Value("${naver.mail.properties.mail.smtp.auth}")
    private String naverSmtpAuth;

    @Value("${naver.mail.properties.mail.smtp.ssl.enable}")
    private String naverSmtpSslEnable;

    @Value("${google.mail.protocol}")
    private String googleMailProtocol;

    @Value("${google.mail.host}")
    private String googleMailHost;

    @Value("${google.mail.port}")
    private int googleMailPort;

    @Value("${google.mail.username}")
    private String googleMailUsername;

    @Value("${google.mail.password}")
    private String googleMailPassword;

    @Value("${google.mail.default-encoding}")
    private String googleMailDefaultEncoding;

    @Value("${google.mail.properties.mail.smtp.starttls.enable}")
    private boolean googleMailStartTlsEnable;

    @Value("${google.mail.properties.mail.smtp.auth}")
    private boolean googleMailSmtpAuth;

    @Bean
    public JavaMailSender gmailMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(googleMailHost);
        mailSender.setPort(googleMailPort);
        mailSender.setUsername(googleMailUsername);
        mailSender.setPassword(googleMailPassword);
        
        Properties properties = mailSender.getJavaMailProperties();
        properties.put("mail.smtp.starttls.enable", String.valueOf(googleMailStartTlsEnable));
        properties.put("mail.smtp.auth", String.valueOf(googleMailSmtpAuth));
        return mailSender;
    }

    @Bean(name = "naverMailSender")
    public JavaMailSender naverMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(naverHost);
        mailSender.setPort(naverPort);
        mailSender.setUsername(naverUsername);
        mailSender.setPassword(naverPassword);

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", naverSmtpAuth);
        properties.put("mail.smtp.ssl.enable", naverSmtpSslEnable);
        mailSender.setJavaMailProperties(properties);

        return mailSender;
    }
}
