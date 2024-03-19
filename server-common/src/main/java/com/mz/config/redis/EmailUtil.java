package com.mz.config.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/13 13:25
 */
@Component
public class EmailUtil {


    @Autowired
    JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String username;

    /**
     *
     * @param to 发给谁
     */
    public void send (String to){
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(username);
        simpleMailMessage.setTo(to);
        simpleMailMessage.setText("今天是你的生日，祝你生日快乐");
        simpleMailMessage.setSubject("HappyBirthday to you");
        javaMailSender.send(simpleMailMessage);
    }
}
