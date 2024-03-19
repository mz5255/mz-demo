package com.mz.controller;

import com.mz.api.domain.SysUsers;
import com.mz.config.ZzyUtil;
import com.mz.config.redis.EmailUtil;
import com.mz.service.SysUsersService;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/13 10:57
 */
@RestController
@RequestMapping("xxl")
@Slf4j
public class XxlJobController {
    @Autowired
    SysUsersService sysUsersService;
    @Autowired
    ZzyUtil zzyUtil;
    @Autowired
    EmailUtil emailUtil;


    /**
     * xxjob定时任务
     */
    @XxlJob("mz-demo")
    @GetMapping("test")
    public void xxl(){
        //当前月日
        String birthday = new Date().getMonth() + 1+"-"+new Date().getDate();
        List<SysUsers> sysUsers = sysUsersService.list();
        for (SysUsers sysUser : sysUsers) {
            System.out.println(sysUser);
            int month = sysUser.getCreateTime().getMonth() + 1;
            int date = sysUser.getCreateTime().getDate();
            System.out.println(month);
            System.out.println(date);
            if(birthday.equals(month+"-"+date)){
                System.out.println(month+"-"+date);
                boolean zzy = zzyUtil.zzy(sysUser.getPhonenumber());
                if(zzy){
                    System.out.println("发送成功");
                }else{
                    System.out.println("发送失败");
                    log.error("发送失败");
                }
                emailUtil.send(sysUser.getEmail());
            }
        }
    }

    /**
    * 原生方式定时任务
    */
    @GetMapping("test1")
    @Scheduled(cron = "0 0 0 * * ?")
    public void scheduled(){
        //当前月日
        String birthday = new Date().getMonth() + 1+"-"+new Date().getDate();
        List<SysUsers> sysUsers = sysUsersService.list();
        for (SysUsers sysUser : sysUsers) {
            System.out.println(sysUser);
            int month = sysUser.getCreateTime().getMonth() + 1;
            int date = sysUser.getCreateTime().getDate();
            System.out.println(month);
            System.out.println(date);
            if(birthday.equals(month+"-"+date)){
                System.out.println(month+"-"+date);
                boolean zzy = zzyUtil.zzy(sysUser.getPhonenumber());
                if(zzy){
                    System.out.println("发送成功");
                }else{
                    System.out.println("发送失败");
                    log.error("发送失败");
                }
                emailUtil.send(sysUser.getEmail());
            }
        }
    }


}
