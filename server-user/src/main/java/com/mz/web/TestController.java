package com.mz.web;


import com.mz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目的启动
 */
@Controller
@RequestMapping("/api/test")
//@Api(description = "服务器向客户端推送消息接口", tags = "Test")
public class TestController {

    @Autowired
    private TestServiceImpl testServiceImpl;

    @Autowired
    UserService userService;
    /**
     * 启动页面
     * @return
     */
    @GetMapping("/start")
    public String start(){
        return "index";
    }

    @PostMapping("/pushToWeb")
    //@ApiOperation(value = "服务器端向客户端推送消息", notes = "服务器端向客户端推送消息")
    public Object pushToWeb(@RequestBody CodesInfo info){
        testServiceImpl.printTime();//发送请求
        //Map<String, Object> map = testServiceImpl.printTime();//发送请求
        return true;
    }

}
