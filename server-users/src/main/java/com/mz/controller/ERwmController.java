package com.mz.controller;

import cn.hutool.extra.qrcode.QrCodeUtil;
import cn.hutool.extra.qrcode.QrConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/13 15:10
 * 做一个二维码
 */
@RestController
@RequestMapping("ewm")
public class ERwmController {

    @Autowired
    HttpServletResponse response;

    @CrossOrigin
    @GetMapping("getEwm")
    public String getEwm(String msg){
        QrConfig config = new QrConfig(300, 300);
// 设置边距，即二维码和背景之间的边距
        config.setMargin(3);
// 设置前景色，即二维码颜色（青色）
        config.setForeColor(Color.CYAN.getRGB());
// 设置背景色（灰色）
        config.setBackColor(Color.GRAY.getRGB());

// 生成二维码到文件，也可以到流
        BufferedImage bufferedImage = QrCodeUtil.generate(msg, config);
        try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "png", baos);
            byte[] imageData = baos.toByteArray();

// 将字节数组进行 Base64 编码
            String base64Image = Base64.getEncoder().encodeToString(imageData);

            return base64Image;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
