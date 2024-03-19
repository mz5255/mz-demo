package com.mz.web;


import cn.hutool.core.date.DateUtil;
import com.mz.domain.User;
import com.mz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 逻辑的处理
 * 数据的定义
 */
@Service
@EnableScheduling
public class TestServiceImpl {
    @Autowired
    UserService userService;

    //打印时间
    @Scheduled(fixedRate=10000) //1000毫秒执行一次
    //定义一个名为printTime的公共方法
public  void  printTime(){


        ArrayList<String> x = new ArrayList<>();
        ArrayList<Long> y = new ArrayList<>();
        List<User> list=  userService.list();
        Map<String, Long> bar = list.stream().collect(Collectors.groupingBy(User::getSex, Collectors.counting()));
        bar.forEach((sex,count)->{
            if(sex.equals("0")){
                x.add("男");
                y.add(count);
            }else if (sex.equals("1")){
                x.add("女");
                y.add(count);
            }
        });

        List<Integer> CreatedX = new ArrayList<>();
        List<Long> CreatedY = new ArrayList<>();

        Map<Integer, Long> line = list.stream()
                .collect(Collectors.groupingBy(user -> DateUtil.year(user.getCreateTime()), Collectors.counting()));

        line.forEach((year,count)->{
            CreatedX.add(year);
            CreatedY.add(count);
        });
        HashMap<String, Object> map = new HashMap<>();
        map.put("x",x);
        map.put("y",y);

        map.put("CreatedX",CreatedX);
        map.put("CreatedY",CreatedY);
      /*  //创建一个SimpleDateFormat对象，用于格式化时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        //使用SimpleDateFormat对象格式化当前时间，并将其赋值给date变量
        String date = dateFormat.format(new Date());*/
        //调用WebSocketServer的sendInfo方法，将格式化后的时间发送给客户端，第一个参数为要发送的时间，第二个参数为客户端的id
        WebSocketServer.sendInfoo(map,"10");
      /*  //打印格式化后的时间
        System.out.println("ws:::::::::"+ date);*/


    }



}
