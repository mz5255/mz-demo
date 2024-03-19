
package com.mz.controller;

import com.mz.domain.SysUser;
import com.mz.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 马震
 * @version 1.0
 * @date 2024/3/18 10:03
 */
@RestController
@RequestMapping("user")
public class UserController {


    @Autowired
    SysUserService service;


    @PostMapping("save")
    public Map<String,Object> saveUser(@RequestBody SysUser sysUser){
        HashMap<String, Object> map = new HashMap<>();
        boolean save = service.save(sysUser);
        map.put("save",save);
        return map;
    }


    @GetMapping("list")
    public List<SysUser> listUsers(){

        List<SysUser> list = service.list();

        return list;
    }
}
